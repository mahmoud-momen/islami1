import 'package:flutter/material.dart';
import 'package:islami/hadeth/hadeth_details_screen.dart';
import 'package:islami/home/HomeScreen.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:islami/quran/sura_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/settings/language.dart';
import 'package:provider/provider.dart';
import 'package:islami/settings/language.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppConfigProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        theme: MyTheme.LightTheme,
        themeMode: provider.appTheme,
        darkTheme: MyTheme.darkTheme,
        locale: Locale(provider.appLanguage),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
          HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
        },
        );

    void showLanguage() {
      showModalBottomSheet(
          context: context,
          builder: ((context) => LanguageBottom() )
      );
    };
  }
}
