import 'package:flutter/widgets.dart';
import '../enums/device_screen_type.dart';
import '../models/sizing_information.dart';
import 'base_widget.dart';

class ScreenTypeLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ScreenTypeLayout({
    Key? key,
    required this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, sizingInformation) {
        switch (sizingInformation.deviceType) {
          case DeviceScreenType.Tablet:
            return tablet ?? mobile;
          case DeviceScreenType.Desktop:
            return desktop ?? mobile;
          default:
            return mobile;
        }
      },
    );
  }
}
