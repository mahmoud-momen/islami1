import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/hadeth/item_hadeth_name.dart';
import 'package:islami/hadeth/item_hadeth_details.dart';
import 'package:islami/hadeth/hadeth_details_screen.dart';
import 'package:islami/hadeth/hadeth_tab.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    if (ahadethList.isEmpty) {
      loadHadethFile();
    }
    return Column(
      children: [
        Expanded(flex: 1, child: Image.asset('assets/images/hadeth_logo.png')),
        Divider(
          color: provider.isDarkMode()?
          Theme.of(context).dividerColor

              :  Theme.of(context).primaryColor,
          thickness: 3,

        ),
        Text(
          'Hadeth Name',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Divider(
          color: provider.isDarkMode()?
          Theme.of(context).dividerColor

              :  Theme.of(context).primaryColor,
          thickness: 3,

        ),
        if (ahadethList.isEmpty)
          Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          ),
        Expanded(
          flex: 2,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(
                color: provider.isDarkMode()?
                Theme.of(context).dividerColor

                    :  Theme.of(context).primaryColor,
                thickness: 3,

              );
            },
            itemBuilder: (context, index) {
              return ItemHadethName(hadeth:ahadethList[index],);
            },
            itemCount: ahadethList.length,
          ),
        ),
      ],
    );
  }

  void loadHadethFile() async {
    String ahadethContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadethList = ahadethContent.split('#\r\n');
    for (int i = 0; i < hadethList.length; i++) {
      List<String> hadethLines = hadethList[i].split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: hadethLines);
      ahadethList.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;
  List<String> content;
  Hadeth({required this.title, required this.content});
}
