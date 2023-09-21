import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/hadeth/hadeth_tab.dart';
import 'package:islami/hadeth/item_hadeth_details.dart';
import 'package:islami/hadeth/item_hadeth_name.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/quran/item_sura_details.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadeth_details_screen';

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;

    return Stack(children: [
      Image.asset(
        'assets/images/main_background.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            args.title,
            style: MyTheme.LightTheme.textTheme.titleLarge,
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: MyTheme.whiteColor,
            borderRadius: BorderRadius.circular(25),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.08,
          ),
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(
                color: Theme.of(context).primaryColor,
                thickness: 2,
              );
            },
            itemBuilder: ((context, index) {
              return ItemHadethDetails(content:args.content[index]);
            }),
            itemCount: args.content.length,
          ),
        ),
      )
    ]);
  }
}
