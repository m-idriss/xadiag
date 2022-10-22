import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../theme/theme.dart';
import '../theme/theme_state.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return MaterialApp(
            theme: state.props.first.themeData,
            debugShowCheckedModeBanner: false,
            home: const ThemeView(),
          );
        } else if (state is ErrorState) {
          return MaterialApp(
            theme: state.props.first.themeData,
            debugShowCheckedModeBanner: false,
            home: const ThemeView(),
          );
        } else if (state is LoadedState) {
          return MaterialApp(
            theme: state.props.first.themeData,
            debugShowCheckedModeBanner: false,
            home: const ThemeView(),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
