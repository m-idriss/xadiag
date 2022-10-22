import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../theme/theme.dart';
import '../theme/theme_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return MaterialApp(
            theme: state.props.first.themeData,
            debugShowCheckedModeBanner: false,
            home: const DemoView(),
          );
        } else if (state is ErrorState) {
          return MaterialApp(
            theme: state.props.first.themeData,
            debugShowCheckedModeBanner: false,
            home: const DemoView(),
          );
        } else if (state is LoadedState) {
          return MaterialApp(
            theme: state.props.first.themeData,
            debugShowCheckedModeBanner: false,
            home: const DemoView(),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
