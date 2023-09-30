import 'package:flutter/material.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottom extends StatefulWidget {
  @override
  State<ThemeBottom> createState() => _ThemeBottomState();
}

class _ThemeBottomState extends State<ThemeBottom> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    Widget getThemeItem(ThemeMode themeMode, String themeName) {
      bool isSelected = provider.appTheme == themeMode;
      return InkWell(
        onTap: () {
          provider.changeTheme(themeMode);
        },
        child: Column(
          children: [
            Text(
              themeName,
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
          getThemeItem(ThemeMode.light, 'Light '),
          SizedBox(height: 8), // Add spacing between theme items
          getThemeItem(ThemeMode.dark, 'Dark '),
        ],
      ),
    );
  }
}
