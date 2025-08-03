import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';
import '../utils/logger.dart';

/// A utility class to provide consistent access to SharedPreferences throughout the app.
/// This provides type-safe access to shared preferences and ensures all preferences
/// are accessed through a single point of control.
class SharedPreferencesHelper {
  static final GetIt _serviceLocator = GetIt.instance;
  
  /// Get the SharedPreferences instance from the service locator
  static SharedPreferences get prefs {
    try {
      return _serviceLocator<SharedPreferences>();
    } catch (e) {
      throw StateError('SharedPreferences not found in service locator. '
          'Make sure to register SharedPreferences in your dependency injection setup.');
    }
  }

  // Prevent instantiation
  SharedPreferencesHelper._();

  /// Get a String value with an optional default
  static String getString(String key, {String defaultValue = ''}) {
    try {
      return prefs.getString(key) ?? defaultValue;
    } catch (e) {
      logger.e('Error getting string for key: $key', error: e, stackTrace: StackTrace.current);
      return defaultValue;
    }
  }

  /// Set a String value
  static Future<bool> setString(String key, String value) async {
    try {
      return await prefs.setString(key, value);
    } catch (e) {
      logger.e('Error setting string for key: $key', error: e, stackTrace: StackTrace.current);
      return false;
    }
  }

  /// Get a bool value with an optional default
  static bool getBool(String key, {bool defaultValue = false}) {
    try {
      return prefs.getBool(key) ?? defaultValue;
    } catch (e) {
      logger.e('Error getting bool for key: $key', error: e, stackTrace: StackTrace.current);
      return defaultValue;
    }
  }

  /// Set a bool value
  static Future<bool> setBool(String key, bool value) async {
    try {
      return await prefs.setBool(key, value);
    } catch (e) {
      logger.e('Error setting bool for key: $key', error: e, stackTrace: StackTrace.current);
      return false;
    }
  }

  /// Get an int value with an optional default
  static int getInt(String key, {int defaultValue = 0}) {
    try {
      return prefs.getInt(key) ?? defaultValue;
    } catch (e) {
      logger.e('Error getting int for key: $key', error: e, stackTrace: StackTrace.current);
      return defaultValue;
    }
  }

  /// Set an int value
  static Future<bool> setInt(String key, int value) async {
    try {
      return await prefs.setInt(key, value);
    } catch (e) {
      logger.e('Error setting int for key: $key', error: e, stackTrace: StackTrace.current);
      return false;
    }
  }

  /// Get a double value with an optional default
  static double getDouble(String key, {double defaultValue = 0.0}) {
    try {
      return prefs.getDouble(key) ?? defaultValue;
    } catch (e) {
      logger.e('Error getting double for key: $key', error: e, stackTrace: StackTrace.current);
      return defaultValue;
    }
  }

  /// Set a double value
  static Future<bool> setDouble(String key, double value) async {
    try {
      return await prefs.setDouble(key, value);
    } catch (e) {
      logger.e('Error setting double for key: $key', error: e, stackTrace: StackTrace.current);
      return false;
    }
  }

  /// Get a list of strings with an optional default empty list
  static List<String> getStringList(String key, {List<String>? defaultValue}) {
    try {
      return prefs.getStringList(key) ?? defaultValue ?? [];
    } catch (e) {
      logger.e('Error getting string list for key: $key', error: e, stackTrace: StackTrace.current);
      return defaultValue ?? [];
    }
  }

  /// Set a list of strings
  static Future<bool> setStringList(String key, List<String> value) async {
    try {
      return await prefs.setStringList(key, value);
    } catch (e) {
      logger.e('Error setting string list for key: $key', error: e, stackTrace: StackTrace.current);
      return false;
    }
  }

  /// Check if key exists
  static bool containsKey(String key) {
    try {
      return prefs.containsKey(key);
    } catch (e) {
      logger.e('Error checking if key exists: $key', error: e, stackTrace: StackTrace.current);
      return false;
    }
  }

  /// Remove a key
  static Future<bool> remove(String key) async {
    try {
      return await prefs.remove(key);
    } catch (e) {
      logger.e('Error removing key: $key', error: e, stackTrace: StackTrace.current);
      return false;
    }
  }

  /// Clear all preferences
  static Future<bool> clear() async {
    try {
      return await prefs.clear();
    } catch (e) {
      logger.e('Error clearing preferences', error: e, stackTrace: StackTrace.current);
      return false;
    }
  }

  /// Get all keys
  static Set<String> getKeys() {
    try {
      return prefs.getKeys();
    } catch (e) {
      logger.e('Error getting all keys', error: e, stackTrace: StackTrace.current);
      return <String>{};
    }
  }

  /// Reload values from disk
  static Future<void> reload() async {
    try {
      await prefs.reload();
    } catch (e) {
      logger.e('Error reloading preferences', error: e, stackTrace: StackTrace.current);
      rethrow;
    }
  }
}
