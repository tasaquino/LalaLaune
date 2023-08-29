import 'package:flutter/material.dart';
import 'package:lala_laune/style/style_dictionary.dart';

var appTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch()
      .copyWith(primary: StyleDictionary.purple)
      .copyWith(secondary: StyleDictionary.mustard)
      .copyWith(background: Colors.white),
  primaryColor: StyleDictionary.yellow,
  hintColor: StyleDictionary.indigo,
  cardColor: StyleDictionary.lightGrey,
  scaffoldBackgroundColor: StyleDictionary.white,
  primaryTextTheme: const TextTheme(
    bodySmall: StyleDictionary.body,
    bodyMedium: StyleDictionary.body2,
    headlineSmall: StyleDictionary.headline,
    headlineMedium: StyleDictionary.headlineSemiBold,
    headlineLarge: StyleDictionary.headline40,
  ),
);
