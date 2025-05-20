import 'package:flutter/material.dart';

double dynamicSize(BuildContext context, double size) {
  final screenWidth = MediaQuery.of(context).size.width;
  return screenWidth * size;
}

bool isMobileSize(BuildContext context) {
  return  MediaQuery.sizeOf(context).width < 800;
}

extension SizeExtension on BuildContext {
  double get padding => dynamicSize(this, 0.05);
  double get spacing => dynamicSize(this, 0.02);
  double get titleSize => dynamicSize(this, 0.06);
  double get sectionTitleSize => dynamicSize(this, 0.045);
  double get contentSize => dynamicSize(this, 0.035);
  double get titleSizeWebsite => dynamicSize(this, 0.02);
  bool get isMobile => isMobileSize(this);
}
