import 'package:flutter/material.dart';
import 'package:portfolio/app/app.dart';
import 'package:portfolio/app/app_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppViewModel(),
      child: MyApp(),
    ),
  );
}

