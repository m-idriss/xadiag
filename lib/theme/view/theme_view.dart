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
        title: const Text('Bloc Theme'),
        actions: [
          Switch(
            value: isDark(context),
            onChanged: (val) async {
              context.read<ThemeCubit>().changeBrigthness(val);
            },
          )
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
