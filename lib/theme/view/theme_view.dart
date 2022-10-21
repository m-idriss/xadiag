import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xadiag/theme/view/drawer_view.dart';
import '../../models/models.dart';
import '../theme.dart';
import 'bottom_nav_view.dart';

class ThemeView extends StatelessWidget {
  const ThemeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ThemeModel> themeList = context.read<ThemeCubit>().getLightThemes();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Preview'),
      ),
      body: _body(themeList),
      endDrawer: const DrawerView(),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }

  Builder _body(List<ThemeModel> themeList) {
    return Builder(builder: (context) {
      return Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DemoPage()));
            },
            icon: const Icon(Icons.airplanemode_active),
            label: const Text('Voyage'),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            itemCount: themeList.length,
            itemBuilder: (context, index) {
              ThemeModel themeModelIdem = themeList[index];
              return Card(
                color: themeModelIdem.themeData.primaryColor,
                child: InkWell(
                  onTap: () async {
                    context.read<ThemeCubit>().changeTheme(
                          themeModelIdem,
                          isDark(context),
                        );
                  },
                  child: ListTile(
                    title: Text(themeModelIdem.name),
                  ),
                ),
              );
            },
          ),
        ),
        SwitchListTile(
          title: const Text('Lights'),
          value: isDark(context),
          onChanged: (val) async {
            context.read<ThemeCubit>().changeBrigthness(val);
          },
          secondary: const Icon(Icons.lightbulb_outline),
        ),
      ]);
    });
  }
}
