import 'package:flutter/material.dart';

class ResponsiveWidget {
  static double dynamicWidth(BuildContext context, {double percent = 0.1}) {
    return MediaQuery.of(context).size.width * percent;
  }

  static double dynamicHeight(BuildContext context, {double percent = 0.1}) {
    return MediaQuery.of(context).size.height * percent;
  }

  static double dynamicSize(BuildContext context, {double size = 0.1}) {
    return MediaQuery.of(context).size.width * size;
  }
}
