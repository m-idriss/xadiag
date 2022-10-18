import 'app.dart';
import 'models/models.dart';
import 'models/theme_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = ThemeBlocObserver();
  runApp(ThemeApp(
    themeModel: initialThemeLight,
  ));
}
