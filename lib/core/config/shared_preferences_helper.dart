import 'package:shared_preferences/shared_preferences.dart';
import 'package:woow_social/main.dart';

/// A utility class to provide consistent access to SharedPreferences throughout the app
/// This helps avoid import issues and provides type-safe access
class SharedPreferencesHelper {
  /// Get the SharedPreferences instance from the service locator
  static SharedPreferences get prefs =>
      serviceLocatorInstance<SharedPreferences>();

  /// Get a String value with an optional default
  static String getString(String key, {String defaultValue = ''}) {
    return prefs.getString(key) ?? defaultValue;
  }

  /// Set a String value
  static Future<bool> setString(String key, String value) {
    return prefs.setString(key, value);
  }

  /// Get a bool value with an optional default
  static bool getBool(String key, {bool defaultValue = false}) {
    return prefs.getBool(key) ?? defaultValue;
  }

  /// Set a bool value
  static Future<bool> setBool(String key, bool value) {
    return prefs.setBool(key, value);
  }

  /// Get an int value with an optional default
  static int getInt(String key, {int defaultValue = 0}) {
    return prefs.getInt(key) ?? defaultValue;
  }

  /// Set an int value
  static Future<bool> setInt(String key, int value) {
    return prefs.setInt(key, value);
  }

  /// Get a double value with an optional default
  static double getDouble(String key, {double defaultValue = 0.0}) {
    return prefs.getDouble(key) ?? defaultValue;
  }

  /// Set a double value
  static Future<bool> setDouble(String key, double value) {
    return prefs.setDouble(key, value);
  }

  /// Check if key exists
  static bool containsKey(String key) {
    return prefs.containsKey(key);
  }

  /// Remove a key
  static Future<bool> remove(String key) {
    return prefs.remove(key);
  }

  /// Clear all preferences
  static Future<bool> clear() {
    return prefs.clear();
  }
}
