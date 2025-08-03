import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get googleApiKey {
    if (kIsWeb) {
      // For web, use compile-time environment variables
      return const String.fromEnvironment(
          'AIzaSyBvKymcGj2L9miF5il20w_tBi6crMy0Fuw');
    } else {
      // For mobile/desktop, use environment variables from .env file
      return dotenv.get('AIzaSyBvKymcGj2L9miF5il20w_tBi6crMy0Fuw');
    }
  }

  // Add other environment variables as needed
  static Future<void> load() async {
    if (!kIsWeb) {
      try {
        await dotenv.load(fileName: "lib/core/config/.env");
      } catch (e) {
        print('Error loading .env file: $e');
        rethrow;
      }
    }
  }
}
