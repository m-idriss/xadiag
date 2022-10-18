import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_theme/json_theme.dart';
import '../theme.dart';

class ThemeView extends StatelessWidget {
  ThemeView({Key? key}) : super(key: key);

  final List themeList = [
    {
      'title': 'Violet clair',
      'color': Colors.purple,
      'brightness': Brightness.light,
      'name': 'default_light',
    },
    {
      'title': 'Violet sombre',
      'color': Colors.black,
      'brightness': Brightness.dark,
      'name': 'default_dark',
    },
    {
      'title': 'blue sombre',
      'color': Colors.blue,
      'brightness': Brightness.light,
      'name': 'default_light',
    },
  ];

  static final Map<String, Future<ThemeData>> _themeMap = {
    "default_light": getMap("default_light"),
    "default_dark": getMap("default_dark"),
  };

  static Future<ThemeData> getMap(String name) async {
    final themeStr = await rootBundle.loadString("assets/theme/$name.json");
    final themeJson = jsonDecode(themeStr);
    return ThemeDecoder.decodeThemeData(themeJson) ?? ThemeData.light();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc Theme')),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        itemCount: themeList.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 2,
        ),
        itemBuilder: (context, index) {
          Future<ThemeData>? item = _themeMap[themeList[index]['name']];
          return Card(
            color: Colors.white54,
            child: InkWell(
              onTap: () async {
                context.read<ThemeCubit>().changeTheme(
                      await item ?? ThemeData.light(),
                    );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 7),
                    child: Text(themeList[index]['title']),
                  ),
                  Container(
                    height: 25,
                    color: Colors.white54,
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const DemoPage()));
        },
        child: const Icon(
          Icons.open_in_new,
          color: Colors.white,
        ),
      ),
    );
  }
}
