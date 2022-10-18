import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'app.dart';
import 'theme_observer.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeStr = rootBundle.loadString("assets/theme/default_light.json");
  final themeJson = jsonDecode(await themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson) ?? ThemeData.light();

  Bloc.observer = ThemeBlocObserver();
  runApp(ThemeApp(
    theme: theme,
  ));
}
