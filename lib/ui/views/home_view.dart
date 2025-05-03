import 'package:flutter/material.dart';
import '../../core/widgets/screen_type_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Scaffold(
        appBar: AppBar(title: Text('Mobile View')),
        body: Center(child: Text('This is the mobile layout')),
      ),
      tablet: Scaffold(
        appBar: AppBar(title: Text('Tablet View')),
        body: Center(child: Text('This is the tablet layout')),
      ),
      desktop: Scaffold(
        appBar: AppBar(title: Text('Desktop View')),
        body: Center(child: Text('This is the desktop layout')),
      ),
    );
  }
}
