import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/models.dart';
import '../theme.dart';

class ThemeView extends StatelessWidget {
  const ThemeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ThemeModel> themeList = context.read<ThemeCubit>().themes;
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
          ThemeModel item = themeList[index];
          return Card(
            color: item.themeData.primaryColor,
            child: InkWell(
              onTap: () async {
                context.read<ThemeCubit>().changeTheme(
                      item,
                    );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Container()),
                  Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 7),
                      child: Text(item.name,
                          style: item.themeData.textTheme.bodyText2)),
                  Container(
                    height: 25,
                    color: item.themeData.focusColor,
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
