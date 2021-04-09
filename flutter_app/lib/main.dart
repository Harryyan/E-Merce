import 'package:flutter/material.dart';
import 'package:flutter_app/app/widgets/splash_screen.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'app/constant/strings.dart';
import 'app/constant/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  // BuildContext其实就是当前widget的element对象
  // Widget只是配置信息，element可修改

  @override
  Widget build(BuildContext context) {
    FlutterCleanArchitecture.debugModeOn();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appName,
        theme: appTheme,
        home: Splash());
  }
}
