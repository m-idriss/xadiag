import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme/theme.dart';

class ThemeApp extends StatelessWidget {
  final ThemeData theme;
  const ThemeApp({
    super.key,
    required this.theme,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: const ThemePage(),
    );
  }
}
