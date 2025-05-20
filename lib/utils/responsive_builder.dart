import 'package:flutter/material.dart';

mixin ResponsiveBuilder {
   double dynamicWidth(BuildContext context, {double percent = 0.035}) {
    return MediaQuery.of(context).size.width * percent;
  }

   double dynamicHeight(BuildContext context, {double percent = 0.035}) {
    return MediaQuery.of(context).size.height * percent;
  }

   double dynamicSize(BuildContext context, {double size = 0.035}) {
    return MediaQuery.of(context).size.width * size;
  }



}
