import 'models.dart';

Future<List<ThemeModel>> computeThemeMapFromAssets() async {
  final manifestContent = await rootBundle.loadString('AssetManifest.json');
  final Map<String, dynamic> manifestMap = json.decode(manifestContent);
  final themesInAssets = manifestMap.keys
      .where((String key) => key.contains('assets/theme/'))
      .where((String key) => key.contains('.json'))
      .toList();

  final themeMap = <ThemeModel>[];
  themeMap.add(initialThemeLight);
  themeMap.add(initialThemeDark);
  for (var element in themesInAssets) {
    themeMap.add(await getFutureMap(element));
  }
  return themeMap;
}

Future<ThemeModel> getFutureMap(String name) async {
  String themeStr = await rootBundle.loadString(name);
  final themeJson = jsonDecode(themeStr);
  ThemeData themeData =
      ThemeDecoder.decodeThemeData(themeJson) ?? ThemeData.light();
  return ThemeModel(
      name: name.split('/').last.split('.').first, themeData: themeData);
}

final ThemeModel initialThemeLight =
    ThemeModel(name: "default", themeData: ThemeData.light());

final ThemeModel initialThemeDark =
    ThemeModel(name: "default_dark", themeData: ThemeData.dark());
