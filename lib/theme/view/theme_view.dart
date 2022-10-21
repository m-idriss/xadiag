import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/models.dart';
import '../theme.dart';

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
      endDrawer: _Drawer(),
      bottomNavigationBar: _BottomNavigationBar(),
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

class _Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Text(
              'Drawer header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          const ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          const AboutListTile(
            // <-- SEE HERE
            icon: Icon(
              Icons.info,
            ),
            applicationIcon: Icon(
              Icons.local_play,
            ),
            applicationName: 'My Cool App',
            applicationVersion: '1.0.25',
            applicationLegalese: '© 2019 Company',
            aboutBoxChildren: [
              ///Content goes here...
            ],
            child: Text('About app'),
          ),
        ],
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  int _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currIndex,
      onTap: (index) => setState(() => _currIndex = index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),
      ],
    );
  }
}
