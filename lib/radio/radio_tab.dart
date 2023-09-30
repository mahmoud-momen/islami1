import 'package:flutter/material.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          // Conditional background image
          provider.isDarkMode()
              ? Image.asset(
            'assets/images/radark.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          )
              : Image.asset(
            'assets/images/rad.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),

          // Add your radio tab content here
          // ...
        ],
      ),
    );
  }
}
