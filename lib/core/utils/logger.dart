import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// A utility class for application-wide logging
class AppLogger {
  static final AppLogger _instance = AppLogger._internal();
  static Logger? _logger;
  static bool _initialized = false;

  factory AppLogger() {
    return _instance;
  }

  AppLogger._internal() {
    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 50,
        colors: true,
        printEmojis: true,
        printTime: true,
      ),
    );
  }

  /// Initialize the logger
  static Future<void> init() async {
    if (_initialized) return;
    
    // Initialize any logger-specific configurations here
    if (kDebugMode) {
      _logger?.i('Logger initialized in debug mode');
    } else {
      _logger?.i('Logger initialized in release mode');
    }
    
    _initialized = true;
  }

  /// Log a debug message
  void d(String message, {dynamic error, StackTrace? stackTrace}) {
    if (kDebugMode) {
      _logger?.d(message, error: error, stackTrace: stackTrace);
      developer.log(message, name: 'DEBUG', error: error, stackTrace: stackTrace);
    }
  }

  /// Log an info message
  void i(String message, {dynamic error, StackTrace? stackTrace}) {
    _logger?.i(message, error: error, stackTrace: stackTrace);
    developer.log(message, name: 'INFO', error: error, stackTrace: stackTrace);
  }

  /// Log a warning message
  void w(String message, {dynamic error, StackTrace? stackTrace}) {
    _logger?.w(message, error: error, stackTrace: stackTrace);
    developer.log(message, name: 'WARNING', error: error, stackTrace: stackTrace);
  }

  /// Log an error message
  void e(String message, {dynamic error, StackTrace? stackTrace}) {
    _logger?.e(message, error: error, stackTrace: stackTrace);
    developer.log(message, name: 'ERROR', error: error, stackTrace: stackTrace);
  }

  /// Log a verbose message
  void v(String message, {dynamic error, StackTrace? stackTrace}) {
    if (kDebugMode) {
      _logger?.v(message, error: error, stackTrace: stackTrace);
      developer.log(message, name: 'VERBOSE', error: error, stackTrace: stackTrace);
    }
  }
}

// Global logger instance
final logger = AppLogger();

// Shortcut functions for easier access
void logD(String message, {dynamic error, StackTrace? stackTrace}) =>
    logger.d(message, error: error, stackTrace: stackTrace);

void logI(String message, {dynamic error, StackTrace? stackTrace}) =>
    logger.i(message, error: error, stackTrace: stackTrace);

void logW(String message, {dynamic error, StackTrace? stackTrace}) =>
    logger.w(message, error: error, stackTrace: stackTrace);

void logE(String message, {dynamic error, StackTrace? stackTrace}) =>
    logger.e(message, error: error, stackTrace: stackTrace);

void logV(String message, {dynamic error, StackTrace? stackTrace}) =>
    logger.v(message, error: error, stackTrace: stackTrace);
