import 'package:flutter/material.dart';
import 'package:islami/hadeth/hadeth_tab.dart';
import 'package:islami/hadeth/item_hadeth_details.dart';
import 'package:islami/hadeth/item_hadeth_name.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/quran/item_sura_details.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart'; // Import your provider

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadeth_details_screen';

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context); // Access your provider

    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;

    return Scaffold(
      extendBodyBehindAppBar: true, // Allow body to extend behind AppBar
      appBar: AppBar(
        title: Text(
          args.title,
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
              'assets/images/bg.png', // Dark mode background image
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            )
          else
            Image.asset(
              'assets/images/main_background.png', // Light mode background image
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),

          Container(
            decoration: BoxDecoration(
              color: provider.isDarkMode()?
    Theme.of(context).primaryColor
        :Theme.of(context).dividerColor,
              borderRadius: BorderRadius.circular(25),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.2,
            ),
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  color: provider.isDarkMode()?
                  Theme.of(context).dividerColor

                      :  Theme.of(context).primaryColor,
                  thickness: 3,

                );
              },
              itemBuilder: ((context, index) {
                return ItemHadethDetails(content: args.content[index]);
              }),
              itemCount: args.content.length,
            ),
          ),
        ],
      ),
    );
  }
}
