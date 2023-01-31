import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}


double kHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 896.0) * screenHeight;
}


double kWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 414.0) * screenWidth;
}

double kTextSize(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  // 375 is the layout width that designer use
  return (inputWidth / (414.0+896.0)) * (screenWidth+screenHeight);
}





//  SizeConfig().init(context); emplement fist page.