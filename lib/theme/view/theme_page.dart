import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../theme.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return MaterialApp(
          theme: theme,
          debugShowCheckedModeBanner: false,
          home: ThemeView(),
        );
      },
    );
  }
}
