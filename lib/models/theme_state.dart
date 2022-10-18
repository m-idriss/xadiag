import 'models.dart';

abstract class ThemeState extends Equatable {}

class InitialState extends ThemeState {
  @override
  List<Object> get props => [];
}

class LoadingState extends ThemeState {
  @override
  List<Object> get props => [];
}

class LoadedState extends ThemeState {
  LoadedState(this.theme);

  final ThemeModel theme;

  @override
  List<Object> get props => [theme];
}

class ErrorState extends ThemeState {
  @override
  List<Object> get props => [];
}
