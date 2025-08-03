import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static final Config _instance = Config._internal();
  static Config get instance => _instance;

  late final Map<String, String> _config;

  factory Config() {
    return _instance;
  }

  Config._internal() {
    _config = {};
  }

  // Load configuration from environment variables
  Future<void> load() async {
    if (kIsWeb) {
      // For web, use compile-time environment variables
      _config = _getWebEnvironment();
    } else {
      // For mobile/desktop, load from .env file
      try {
        await dotenv.load(fileName: ".env");
        _config = dotenv.env;
      } catch (e) {
        debugPrint('Error loading .env file: $e');
        _config = {};
      }
    }
  }

  // Get a configuration value
  String? get(String key, {String? defaultValue}) {
    return _config[key] ?? defaultValue;
  }

  // Web-specific environment variables (set during build)
  Map<String, String> _getWebEnvironment() {
    // These should be set during build time for web
    return {
      'GOOGLE_API_KEY': const String.fromEnvironment('GOOGLE_API_KEY'),
    };
  }

  // Check if running in debug mode
  bool get isDebug => kDebugMode;

  // Check if running in release mode
  bool get isRelease => kReleaseMode;

  // Check if running in profile mode
  bool get isProfile => kProfileMode;
}
