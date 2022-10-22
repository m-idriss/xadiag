import '../models/models.dart';

abstract class ThemeState extends Equatable {}

class InitialState extends ThemeState {
  @override
  List<ThemeModel> get props => [initialThemeLight];
}

class LoadingState extends ThemeState {
  @override
  List<ThemeModel> get props => [initialThemeLight];
}

class LoadedState extends ThemeState {
  LoadedState(this.theme);

  final ThemeModel theme;

  @override
  List<ThemeModel> get props => [theme];
}

class ErrorState extends ThemeState {
  @override
  List<ThemeModel> get props => [initialThemeLight];
}
