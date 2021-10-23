import 'package:flutter/material.dart';

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight,
    {required BuildContext context}) {
  final mediaQueryData = MediaQuery.of(context);
  final screenHeight = mediaQueryData.size.height;
  return inputHeight * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth,
    {required BuildContext context}) {
  final mediaQueryData = MediaQuery.of(context);
  final screenWidth = mediaQueryData.size.width;
  return inputWidth * screenWidth;
}
