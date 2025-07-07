import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:woow_social/features/splash/splash_screen.dart';
import 'package:woow_social/main.dart' as app;

void main() {
  testWidgets('Splash screen shows app name', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: SplashScreen(),
      ),
    );

    // Verify that the app name is visible
    expect(find.text('Woow', findRichText: true), findsOneWidget);
    expect(find.text('Social', findRichText: true), findsOneWidget);
  });

  testWidgets('App starts with SplashScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const app.WoowSocialApp());

    // Verify that the splash screen is shown first
    expect(find.byType(SplashScreen), findsOneWidget);
  });
}
