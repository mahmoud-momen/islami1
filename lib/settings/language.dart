import 'package:flutter/material.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottom extends StatefulWidget {
  @override
  State<LanguageBottom> createState() => _LanguageBottomState();
}

class _LanguageBottomState extends State<LanguageBottom> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    Widget getLanguageItem(String languageCode, String languageName) {
      bool isSelected = provider.appLanguage == languageCode;
      return InkWell(
        onTap: () {
          provider.changeLanguage(languageCode);
        },
        child: Column(
          children: [
            Text(
              languageName,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Colors.black,
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check,
                color: Theme.of(context).primaryColor,
              ),
          ],
        ),
      );
    }

    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getLanguageItem('en', 'English'),
          SizedBox(height: 8), // Add spacing between language items
          getLanguageItem('ar', 'Arabic'),
        ],
      ),
    );
  }
}
