import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import '../../generated/fonts.gen.dart';
import '../../src/data/local/datasources/sharedpref/constants/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme(String locale) => ThemeData.light(useMaterial3: false).copyWith(
    colorScheme: ColorScheme.light(
        primary: AppColors.lightPrimary,
        secondary: AppColors.lightAccent,
        onSecondary: AppColors.lightAccent,
        background: AppColors.lightBG
    ).copyWith(background: AppColors.lightBG),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.lightBG,
      iconTheme: IconThemeData(color: AppColors.lightAccent),
      titleTextStyle: TextStyle(
        color: AppColors.darkBG,
        fontSize: 18.0.sp,
        fontWeight: FontWeight.w800,
        fontFamily: locale == "ar" ? FontFamily.plexSansArabic:  FontFamily.montserrat,
      ),
    ),
    // scaffoldBackgroundColor: AppColors.lightBG,
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.lightAccent,
        selectionColor: AppColors.lightAccent,
        selectionHandleColor: AppColors.lightAccent),
    datePickerTheme: DatePickerThemeData(
      dayStyle: TextStyle(color: Colors.red),
      headerBackgroundColor: AppColors.lightAccent,
      // backgroundColor: AppColors.lightAccent,
      confirmButtonStyle: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(AppColors.lightAccent)),
      cancelButtonStyle: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(AppColors.lightAccent)),
      // headerForegroundColor: AppColors.lightAccent,
      surfaceTintColor: AppColors.lightAccent,
    ),
    // cursorColor: AppColors.lightAccent,
    brightness: Brightness.light,
    platform: TargetPlatform.iOS,
    textTheme: ThemeData.light().textTheme.apply(
      fontFamily:
      locale == "ar" ? FontFamily.plexSansArabic :  FontFamily.montserrat,
      bodyColor:Color(0xff151515)
    ),
  );
  static ThemeData darkTheme(String locale) => ThemeData.dark(useMaterial3: false).copyWith(
    colorScheme: ColorScheme.dark(
      primary:  AppColors.darkPrimary,
      secondary: AppColors.lightAccent,
      onSecondary: AppColors.lightAccent,
    ).copyWith(),
    // scaffoldBackgroundColor: AppColors.darkBG,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.darkBG,
      iconTheme: IconThemeData(color: AppColors.lightAccent),
      titleTextStyle: TextStyle(
        // color: AppColors.darkBG,
        fontSize: 18.0.sp,
        fontWeight: FontWeight.w700,
        fontFamily:
        locale == "ar" ? FontFamily.plexSansArabic :   FontFamily.montserrat,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.darkAccent,
        selectionColor: AppColors.darkAccent,
        selectionHandleColor: AppColors.darkAccent),
    datePickerTheme: DatePickerThemeData(
      dayStyle: TextStyle(color: Colors.red),
      headerBackgroundColor: AppColors.lightAccent,
      // backgroundColor: AppColors.lightAccent,
      confirmButtonStyle: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(AppColors.lightAccent)),
      cancelButtonStyle: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(AppColors.lightAccent)),
      // headerForegroundColor: AppColors.lightAccent,
      surfaceTintColor: AppColors.lightAccent,
    ),
    // cursorColor: AppColors.lightAccent,
    platform: TargetPlatform.iOS,
    textTheme: ThemeData.light().textTheme.apply(
      fontFamily: locale == "ar" ? FontFamily.plexSansArabic : FontFamily.montserrat,
        //
        // displayColor: Colors.white,
        bodyColor: Color(0xffFFFFFF)
    ),
  );

  static ThemeData yellowTheme(String locale)  => ThemeData.light(useMaterial3: false).copyWith(
    colorScheme: ColorScheme.light(
        primary: AppColors.lightPrimary,
        secondary: AppColors.yellowAccent,
        onSecondary: AppColors.yellowAccent,
        background: AppColors.lightBG
    ).copyWith(background: AppColors.lightBG,),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.yellowAccent,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 18.0.sp,
        fontWeight: FontWeight.w800,
        fontFamily: locale == "ar" ? FontFamily.plexSansArabic:  FontFamily.montserrat,
      ),
    ),
    // scaffoldBackgroundColor: AppColors.lightBG,
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.yellowAccent,
        selectionColor: AppColors.yellowAccent,
        selectionHandleColor: AppColors.yellowAccent),
    datePickerTheme: DatePickerThemeData(
      dayStyle: TextStyle(color: Colors.red),
      headerBackgroundColor: AppColors.yellowAccent,
      // backgroundColor: AppColors.lightAccent,
      confirmButtonStyle: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(AppColors.yellowAccent)),
      cancelButtonStyle: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(AppColors.yellowAccent)),
      // headerForegroundColor: AppColors.lightAccent,
      surfaceTintColor: AppColors.yellowAccent,
    ),
    // cursorColor: AppColors.lightAccent,
    brightness: Brightness.light,
    platform: TargetPlatform.iOS,
    textTheme: ThemeData.light().textTheme.apply(
        fontFamily:
        locale == "ar" ? FontFamily.plexSansArabic :  FontFamily.montserrat,
        bodyColor:Color(0xff151515)
    ),
  );

  static ThemeData redTheme(String locale) => ThemeData.light(useMaterial3: false).copyWith(
    colorScheme: ColorScheme.light(
        primary: AppColors.lightPrimary,
        secondary: AppColors.redAccent,
        onSecondary: AppColors.redAccent,
        background: AppColors.lightBG
    ).copyWith(background: AppColors.lightBG,),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.redAccent,
      titleTextStyle: TextStyle(
        fontSize: 18.0.sp,
        fontWeight: FontWeight.w800,
        fontFamily: locale == "ar" ? FontFamily.plexSansArabic:  FontFamily.montserrat,
      ),
    ),
    // scaffoldBackgroundColor: AppColors.lightBG,
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.redAccent,
        selectionColor: AppColors.redAccent,
        selectionHandleColor: AppColors.redAccent),
    datePickerTheme: DatePickerThemeData(
      dayStyle: TextStyle(color: Colors.red),
      headerBackgroundColor: AppColors.redAccent,
      // backgroundColor: AppColors.lightAccent,
      confirmButtonStyle: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(AppColors.redAccent)),
      cancelButtonStyle: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(AppColors.redAccent)),
      // headerForegroundColor: AppColors.lightAccent,
      surfaceTintColor: AppColors.redAccent,
    ),
    // cursorColor: AppColors.lightAccent,
    brightness: Brightness.light,
    platform: TargetPlatform.iOS,
    textTheme: ThemeData.light().textTheme.apply(
        fontFamily:
        locale == "ar" ? FontFamily.plexSansArabic :  FontFamily.montserrat,
        bodyColor:Color(0xff151515)
    ),
  );


  static void changeAppTheme(String value) async {
    var prefs = await SharedPreferences.getInstance();
    switch(value){
      case "dark":
        await prefs.setString(Preferences.theme_mode, value);
        Get.changeTheme(AppTheme.darkTheme(prefs.getString('language_code')??"en"));
        Get.forceAppUpdate();
        break;
      case "light":
        await prefs.setString(Preferences.theme_mode, value);
        Get.changeTheme(AppTheme.lightTheme(prefs.getString('language_code')??"en"));
        Get.forceAppUpdate();
        break;
      case "red":
        await prefs.setString(Preferences.theme_mode, value);
        Get.changeTheme(AppTheme.redTheme(prefs.getString('language_code')??"en"));
        Get.forceAppUpdate();
        break;
      case "yellow":
        await prefs.setString(Preferences.theme_mode, value);
        Get.changeTheme(AppTheme.yellowTheme(prefs.getString('language_code')??"en"));
        Get.forceAppUpdate();
        break;
      default:
        await prefs.setString(Preferences.theme_mode, value);
        Get.changeTheme(AppTheme.lightTheme(prefs.getString('language_code')??"en"));
        Get.forceAppUpdate();
        break;
    }
  }

  static ThemeData getAppThem(String value){
    switch(value){
      case "dark":
        return darkTheme(Get.deviceLocale?.languageCode??'en');
      case "light":
        return lightTheme(Get.deviceLocale?.languageCode??'en');
      case "red":
        return redTheme(Get.deviceLocale?.languageCode??'en');
      case "yellow":
        return yellowTheme(Get.deviceLocale?.languageCode??'en');
      default:
        return darkTheme(Get.deviceLocale?.languageCode??'en');
    }
  }

  static const List<Shadow> textShadow = <Shadow>[
    Shadow(
      offset: Offset(1.0, 1.0),
      blurRadius: 3.0,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    Shadow(
      offset: Offset(1.0, 1.0),
      blurRadius: 8.0,
      color: Color.fromARGB(125, 0, 0, 0),
    ),
  ];

  static getChosenColor(String value) {
    switch(value){
      case "dark":
        return Colors.black;
      case "light" :
        return Colors.white;
      case "red":
        return Colors.white;;
      case "yellow":
        return Colors.white;;
      default:
        return Colors.white;
    }
  }

}

class ThemeModel{
  Color color = Colors.white;
  String? key = "light";
  RxBool isSelected = false.obs;
  ThemeModel({this.color = Colors.white , this.key = "light", bool isSelected = false}){
    this.isSelected.value = isSelected;
  }

  static List<ThemeModel> themesList = [
    ThemeModel(color: Colors.white,key: "light",isSelected: false),
    ThemeModel(color: Colors.black,key: "dark",isSelected: false),
    ThemeModel(color: Colors.red,key: "red",isSelected: false),
    ThemeModel(color: Colors.yellow,key: "yellow",isSelected: false),
  ];

}

