import 'package:flutter/material.dart';
import 'package:islami/hadeth/hadeth_details_screen.dart';
import 'package:islami/home/HomeScreen.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/quran/sura_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        locale: Locale('ar'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
          HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
        },
        theme: MyTheme.LightTheme);
  }
}
