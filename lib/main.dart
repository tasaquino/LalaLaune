import 'package:flutter/material.dart';
import 'package:lala_laune/feature/authentication/presentation/login_screen.dart';
import 'package:lala_laune/style/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// coverage:ignore-start
void main() {
  runApp(const MyApp());
}
// coverage:ignore-end

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    this.locale,
  });
  final Locale? locale;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: appTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: locale,
        home: const LoginScreen());
  }
}
