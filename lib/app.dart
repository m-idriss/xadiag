import 'package:flutter_bloc/flutter_bloc.dart';
import 'models/models.dart';
import 'theme/theme.dart';

class ThemeApp extends StatelessWidget {
  final ThemeModel themeModel;
  const ThemeApp({
    super.key,
    required this.themeModel,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(repository: ThemeRepository()),
      child: const ThemePage(),
    );
  }
}
