import 'package:flutter/material.dart';
import 'package:meals_app/theme/color_theme.dart';
import 'package:meals_app/theme/text_theme.dart';

ThemeData theme = ThemeData(
  textTheme: textTheme,
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
);

ThemeData darkTheme = ThemeData(
  textTheme: textTheme,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
);
