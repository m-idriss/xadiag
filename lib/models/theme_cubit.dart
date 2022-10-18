import 'models.dart';

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

  void changeTheme(ThemeModel them) {
    currentTheme = them;
    emit(LoadedState(currentTheme));
  }
}
