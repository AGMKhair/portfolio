import 'package:flutter/material.dart';
import '../ui/views/home_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive App',
      home: HomeView(),
    );
  }
}
