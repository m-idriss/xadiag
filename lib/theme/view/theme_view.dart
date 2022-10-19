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
        actions: [
          Row(
            children: [
              Switch(
                value: isDark(context),
                onChanged: (val) async {
                  context.read<ThemeCubit>().changeBrigthness(val);
                },
              )
            ],
          ),
        ],
      ),
      body: ListView.builder(
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
      drawer: _Drawer(),
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
      bottomNavigationBar: _BottomNavigationBar(),
    );
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
