import 'package:flutter/widgets.dart';
import '../core/enums/device_screen_type.dart';
import '../core/models/sizing_information.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.width;

  if (deviceWidth > 950) {
    return DeviceScreenType.Desktop;
  } else if (deviceWidth > 600) {
    return DeviceScreenType.Tablet;
  } else {
    return DeviceScreenType.Mobile;
  }
}

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, SizingInformation sizingInformation) builder;

  const ResponsiveBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var sizingInformation = SizingInformation(
      orientation: mediaQuery.orientation,
      deviceType: getDeviceType(mediaQuery),
      screenSize: mediaQuery.size,
      localWidgetSize: Size.zero,
    );

    return builder(context, sizingInformation);
  }
}
