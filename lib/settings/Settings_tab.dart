import 'package:flutter/material.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:islami/settings/language.dart';
import 'package:islami/settings/theme_buttom.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var appLocalizations = AppLocalizations.of(context);


    return Column(


      children: [

        SizedBox(height: 100,),
        Center(
          child: Container(

            margin: EdgeInsets.only(top: 50, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text(appLocalizations!.language),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 40,
                  width: 300,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: InkWell(
                    onTap: () {
                      showLanguageBottomSheet();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          provider.appLanguage == 'en'
                              ? appLocalizations.english
                              : appLocalizations.arabic,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 100,),


                Container(
                  margin: EdgeInsets.only(left: 10),
                    child: Text('Theme')),

                Container(
                  padding: EdgeInsets.all(8),
                  height: 40,
                  width: 300,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: InkWell(
                    onTap: () {
                      showThemeBottomSheet();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          provider.isDarkMode()?
                             AppLocalizations.of(context)!.dark
                              :AppLocalizations.of(context)!.light,
                          style: Theme.of(context).textTheme.titleSmall,

                        ),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
              ],
            ),

          ),
        ),
      ],
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: ((context) => LanguageBottom()),
    );
  }

  void showThemeBottomSheet() {

    showModalBottomSheet(context: context, builder: (context)=>ThemeBottom()
    );
  }
}
