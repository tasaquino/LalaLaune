// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lala_laune/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Login screen is displayed correctly in pt-BR',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(
      locale: Locale('pt', 'BR'),
    ));

    expect(find.text('Login com o Google'), findsOneWidget);
    expect(find.text('Bem-vindo ao LalaLaune!'), findsOneWidget);
  });

  testWidgets('Login screen is displayed correctly in en-US',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(
      locale: Locale('en', 'US'),
    ));

    expect(find.text('Login with Google'), findsOneWidget);
    expect(find.text('Welcome to LalaLaune!'), findsOneWidget);
  });

  testWidgets('Login screen is displayed correctly in DE',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(
      locale: Locale('de', 'DE'),
    ));

    expect(find.text('Anmelden mit Google'), findsOneWidget);
    expect(find.text('Willkommen bei LalaLaune!'), findsOneWidget);
  });

  testWidgets('Login screen is displayed correctly in ES',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(
      locale: Locale('es', 'ES'),
    ));

    expect(find.text('Acceder con Google'), findsOneWidget);
    expect(find.text('¡Bienvenido a LalaLaune!'), findsOneWidget);
  });

  testWidgets('Login screen is displayed correctly in FR',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(
      locale: Locale('fr', 'FR'),
    ));

    expect(find.text('Se connecter à Google'), findsOneWidget);
    expect(find.text('Bienvenue à LalaLaune !'), findsOneWidget);
  });
}
