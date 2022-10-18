import 'package:flutter_bloc/flutter_bloc.dart';
import 'models/models.dart';
import 'theme/theme.dart';

class ThemeApp extends StatelessWidget {
  const ThemeApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(repository: ThemeRepository()),
      child: const ThemePage(),
    );
  }
}
