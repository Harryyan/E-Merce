import 'package:emerce_components/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/app/pages/guides/guide_view.dart';
import 'package:flutter_app/data/helpers/full_screen_size.dart';

class Splash extends StatelessWidget {
  static String routeName = "/splash";

  const Splash({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FullSizeConfig(context);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: kPrimaryColor, statusBarColor: Colors.white));

    return Scaffold(body: GuidePages());
  }
}