import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:igameapp/src/di/getit/injection.dart';
import 'package:igameapp/src/utils/my_http_overrides.dart';
import 'src/app.dart';

//relative path
// import '../../../';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
//    DeviceOrientation.landscapeRight,
//    DeviceOrientation.landscapeLeft
  ]).then((_) async {
    HttpOverrides.global = MyHttpOverrides();
    await configureDependencies();
    runApp(App());
  });

}