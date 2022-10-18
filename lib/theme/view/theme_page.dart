import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xadiag/models/theme_model.dart';
import '../theme.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeModel>(
      builder: (context, state) {
        return MaterialApp(
          theme: state.themeData,
          debugShowCheckedModeBanner: false,
          home: const ThemeView(),
        );
      },
    );
  }
}
