import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:woow_social/core/theme/app_theme.dart';
import 'package:woow_social/core/utils/environment.dart';
import 'package:woow_social/core/utils/logger.dart';
import 'package:woow_social/routes/register_routes.dart';
import 'package:woow_social/routes/route_names.dart';

Future<void> main() async {
  // Create a group for the main function to ensure all errors are caught
  await runZonedGuarded<Future<void>>(
    () async {
      // Ensure Flutter binding is initialized
      WidgetsFlutterBinding.ensureInitialized();

      // Set preferred orientations
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      // Initialize Firebase
      await Firebase.initializeApp();

      // Initialize Crashlytics in release mode
      if (!kDebugMode) {
        FlutterError.onError =
            FirebaseCrashlytics.instance.recordFlutterFatalError;
        PlatformDispatcher.instance.onError = (error, stack) {
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
          return true;
        };
      }

      // Initialize environment and dependencies
      await _initializeApp();

      // Run the app with error boundaries
      runApp(
        ErrorBoundary(
          child: const WoowSocialApp(),
        ),
      );
    },
    (error, stackTrace) {
      // Handle any uncaught errors
      logger.e('Uncaught error in main zone',
          error: error, stackTrace: stackTrace);
      if (!kDebugMode) {
        FirebaseCrashlytics.instance
            .recordError(error, stackTrace, fatal: true);
      }
    },
  );
}

Future<void> _initializeApp() async {
  try {
    // Initialize logger
    await AppLogger.init();

    logger.i('Initializing application...');

    // Load environment variables
    logger.d('Loading environment variables...');
    await Environment.load().catchError((error, stackTrace) {
      logger.e('Failed to load environment variables',
          error: error, stackTrace: stackTrace);
      throw Exception('Failed to load environment variables: $error');
    });

    // Setup dependencies
    logger.d('Setting up dependencies...');
    await setupDependencies().catchError((error, stackTrace) {
      logger.e('Failed to setup dependencies',
          error: error, stackTrace: stackTrace);
      throw Exception('Dependency initialization failed: $error');
    });

    logger.i('Application initialized successfully');
  } catch (error, stackTrace) {
    logger.e('Critical error during app initialization',
        error: error, stackTrace: stackTrace);

    // In production, we might want to show a user-friendly error screen
    // For now, we'll rethrow to be caught by the global error handler
    rethrow;
  }
}

final GetIt serviceLocator = GetIt.instance;

/// Sets up the dependency injection container
Future<void> setupDependencies() async {
  try {
    // Core services
    await _setupCoreServices();

    // Repositories
    await _setupRepositories();

    // Services
    await _setupServices();

    // Controllers
    await _setupControllers();
  } catch (e, stackTrace) {
    logger.e('Error setting up dependencies', error: e, stackTrace: stackTrace);
    rethrow;
  }
}

/// Sets up core services like SharedPreferences, network clients, etc.
Future<void> _setupCoreServices() async {
  try {
    // SharedPreferences
    if (!serviceLocator.isRegistered<SharedPreferences>()) {
      final sharedPreferences = await SharedPreferences.getInstance();
      serviceLocator.registerSingleton<SharedPreferences>(sharedPreferences);
      logger.d('SharedPreferences initialized');
    }

    // Network client can be initialized here
    // Example:
    // final dio = Dio()..interceptors.add(LoggingInterceptor());
    // serviceLocator.registerSingleton<Dio>(dio);
  } catch (e, stackTrace) {
    logger.e('Error setting up core services',
        error: e, stackTrace: stackTrace);
    rethrow;
  }
}

/// Sets up repository layer dependencies
Future<void> _setupRepositories() async {
  try {
    // Example:
    // final sharedPrefs = serviceLocator<SharedPreferences>();
    // final authRepo = AuthRepository(sharedPrefs: sharedPrefs);
    // serviceLocator.registerSingleton<AuthRepository>(authRepo);
  } catch (e, stackTrace) {
    logger.e('Error setting up repositories', error: e, stackTrace: stackTrace);
    rethrow;
  }
}

/// Sets up service layer dependencies
Future<void> _setupServices() async {
  try {
    // Example:
    // final authService = AuthService();
    // serviceLocator.registerSingleton<AuthService>(authService);
  } catch (e, stackTrace) {
    logger.e('Error setting up services', error: e, stackTrace: stackTrace);
    rethrow;
  }
}

/// Sets up application controllers
Future<void> _setupControllers() async {
  try {
    // Example:
    // final authController = Get.put(AuthController());
    // serviceLocator.registerSingleton<AuthController>(authController);
  } catch (e, stackTrace) {
    logger.e('Error setting up controllers', error: e, stackTrace: stackTrace);
    rethrow;
  }
}

/// A widget that catches and displays errors in the UI
class ErrorBoundary extends StatefulWidget {
  final Widget child;
  final Widget Function(Object error, StackTrace? stackTrace)? fallback;

  const ErrorBoundary({
    super.key,
    required this.child,
    this.fallback,
  });

  @override
  State<ErrorBoundary> createState() => _ErrorBoundaryState();
}

class _ErrorBoundaryState extends State<ErrorBoundary> {
  Object? _error;
  StackTrace? _stackTrace;

  @override
  void initState() {
    super.initState();
    // Save the original error handler
    _originalErrorHandler = FlutterError.onError;

    // Set up our error handler
    FlutterError.onError = (FlutterErrorDetails details) {
      logE('Error caught by Flutter framework',
          error: details.exception, stackTrace: details.stack);
      setState(() {
        _error = details.exception;
        _stackTrace = details.stack;
      });
    };
  }

  @override
  void dispose() {
    // Restore the original error handler
    FlutterError.onError = _originalErrorHandler!;
    super.dispose();
  }

  static FlutterExceptionHandler? _originalErrorHandler;

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return widget.fallback?.call(_error!, _stackTrace) ??
          _defaultErrorWidget(_error!, _stackTrace);
    }

    return widget.child;
  }

  Widget _defaultErrorWidget(Object error, StackTrace? stackTrace) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 60),
                const SizedBox(height: 24),
                Text(
                  'Something went wrong!',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                if (kDebugMode) ...[
                  Text(
                    error.toString(),
                    style: const TextStyle(color: Colors.black87, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  if (stackTrace != null)
                    Text(
                      stackTrace.toString().split('\n').take(5).join('\n'),
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 12),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                  const SizedBox(height: 24),
                ] else
                  const Text(
                    'An unexpected error occurred. Please restart the app.',
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  icon: const Icon(Icons.refresh),
                  label: const Text('Restart App'),
                  onPressed: () {
                    // In a real app, you would implement proper app restart logic
                    // For example, using the restart_app package
                    setState(() {
                      _error = null;
                      _stackTrace = null;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// The root widget of the application
class WoowSocialApp extends StatelessWidget {
  const WoowSocialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Woow Social',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: RouteNames.splashScreen,
      getPages: allPages(),
      defaultTransition: Transition.fade,
      builder: (context, child) {
        // Add global overlays, dialogs, or other UI elements here
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      onReady: () {
        // App is fully loaded
        logger.i('App started successfully');
      },
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('appName', 'Woow Social'));
    properties.add(StringProperty(
        'environment', kReleaseMode ? 'Production' : 'Development'));
  }
}
