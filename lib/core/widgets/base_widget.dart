import 'package:flutter/widgets.dart';
import '../../utils/responsive_builder.dart';
import '../models/sizing_information.dart';

class BaseWidget extends StatelessWidget {
  final Widget Function(BuildContext context, SizingInformation sizingInformation) builder;

  const BaseWidget({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: builder);
  }
}
