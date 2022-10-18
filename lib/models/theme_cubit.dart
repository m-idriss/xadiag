import 'models.dart';

class ThemeCubit extends Cubit<ThemeModel> {
  ThemeCubit({required this.repository}) : super(initialThemeLight) {
    getThemes();
  }

  ThemeModel currentTheme = initialThemeLight;
  final ThemeRepository repository;
  late List<ThemeModel> themes = <ThemeModel>[];

  void getThemes() async {
    themes = await repository.getThemes();
    emit(currentTheme);
  }

  void changeTheme(ThemeModel them) {
    currentTheme = them;
    emit(currentTheme);
  }
}
