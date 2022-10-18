import 'models.dart';

class ThemeRepository {
  Future<List<ThemeModel>> getThemes() {
    return computeThemeMapFromAssets();
  }
}
