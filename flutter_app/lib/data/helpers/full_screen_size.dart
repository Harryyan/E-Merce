import 'package:flutter/material.dart';

class FullSizeConfig {
  static MediaQueryData _mediaQueryData;
  double screenWidth;
  double screenHeight;
  static double _defaultSize;
  static Orientation _orientation;
  static FullSizeConfig _instance;

  factory FullSizeConfig(BuildContext context) => _getInstance(context);
  static FullSizeConfig get instance => _instance;

  FullSizeConfig._(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    _orientation = _mediaQueryData.orientation;
  }

  static FullSizeConfig _getInstance(BuildContext context) {
    if (_instance == null) {
      _instance = new FullSizeConfig._(context);
    }
    return _instance;
  }

  static double getProportionateScreenHeight(double inputHeight) {
    double screenHeight = _instance.screenHeight;
    return (inputHeight / 812.0) * screenHeight;
  }

  static double getProportionateScreenWidth(double inputWidth) {
    double screenWidth = _instance.screenWidth;
    return (inputWidth / 375.0) * screenWidth;
  }
}