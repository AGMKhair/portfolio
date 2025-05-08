import 'package:flutter/material.dart';
import 'package:portfolio/utils/responsive_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome to My Home Page',
        style: TextStyle(fontSize: ResponsiveBuilder.dynamicSize(context, size: 0.035)),
      ),
    );
  }
}
