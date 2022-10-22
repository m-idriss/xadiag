import '../models/models.dart';
import 'dart:developer' as developer;

class ThemeBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) developer.log(change.toString());
  }
}
