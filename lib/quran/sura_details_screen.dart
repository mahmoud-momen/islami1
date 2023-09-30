import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:islami/quran/item_sura_details.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details_screen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }

    return Scaffold(
      extendBodyBehindAppBar: true, // Allow body to extend behind AppBar
      appBar: AppBar(
        title: Text(
          args.name,
          style: provider.isDarkMode()?
          MyTheme.darkTheme.textTheme.titleLarge
          :MyTheme.LightTheme.textTheme.titleLarge,
        ),
        backgroundColor: Colors.transparent, // Make AppBar transparent
        elevation: 0, // Remove the shadow
      ),
      body: Stack(
        children: [
          // Conditional background image
          if (provider.isDarkMode())
            Image.asset(
              'assets/images/bg.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            )
          else
            Image.asset(
              'assets/images/main_background.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),

          verses.length == 0
              ? Center(
            child: CircularProgressIndicator(
              color:provider.isDarkMode()?
              Theme.of(context).primaryColor
              :Theme.of(context).primaryColorLight,
            ),
          )
              : Container(
            decoration: BoxDecoration(
              color: provider.isDarkMode()?
              MyTheme.darkTheme.primaryColor
              :MyTheme.whiteColor,
              borderRadius: BorderRadius.circular(25),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.10,
            ),
            child: ListView.separated(
              separatorBuilder: (context, index) {

                return Divider(
                  color: provider.isDarkMode()?
                  Theme.of(context).dividerColor
                      :  Theme.of(context).dividerColor,
                  thickness: 3,

                );
              },
              itemBuilder: ((context, index) {
                return ItemSuraDetails(
                  content: verses[index],
                  index: index,
                );
              }),
              itemCount: verses.length,
            ),
          ),
        ],
      ),
    );
  }

  void loadFile(int index) async {
    String content =
    await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {});

    print(lines);
  }
}

class SuraDetailsArgs {
  String name;
  int index;
  SuraDetailsArgs({required this.name, required this.index});
}
