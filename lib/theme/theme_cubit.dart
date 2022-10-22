import '../models/models.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({required this.repository}) : super(InitialState()) {
    getThemes();
  }

  ThemeModel currentTheme = initialThemeLight;
  final ThemeRepository repository;
  late List<ThemeModel> themes = <ThemeModel>[];

  void getThemes() async {
    try {
      emit(LoadingState());
      themes = await repository.getThemes();
      emit(LoadedState(themes.first));
    } catch (e) {
      emit(ErrorState());
    }
  }

  void changeBrigthness(bool isDark) {
    changeTheme(currentTheme, isDark);
  }

  void changeTheme(ThemeModel themeModel, bool isDark) {
    String themeName = resolveThemeName(themeModel, isDark);
    currentTheme =
        themes.where((element) => element.name.contains(themeName)).first;
    emit(LoadedState(currentTheme));
  }

  String resolveThemeName(ThemeModel themeModel, bool isDark) {
    String themeName =
        isDark ? "${themeModel.name}_dark" : themeModel.name.split("_dark")[0];
    return themeName;
  }

  List<ThemeModel> getLightThemes() {
    return themes.where((element) => !element.name.contains("_dark")).toList();
  }
}
