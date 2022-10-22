import 'app.dart';
import 'models/models.dart';
import 'theme/theme_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = ThemeBlocObserver();
  runApp(const ThemeApp());
}
