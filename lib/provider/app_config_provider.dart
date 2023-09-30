import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/settings/language.dart';

class AppConfigProvider extends ChangeNotifier{

  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.dark;


  void changeLanguage(String newLanguage){
    if(appLanguage == newLanguage){
      return;
    }

    appLanguage = newLanguage;
    notifyListeners();
  }

  void changeTheme(ThemeMode newMode){

    if(appTheme == newMode){
      return ;
    }
    appTheme = newMode;
    notifyListeners();
  }

  bool isDarkMode(){
    return appTheme == ThemeMode.dark;
  }
}