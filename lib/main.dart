import 'package:flutter/material.dart';
import 'package:portfolio/providers/blog_provider.dart';
import 'package:portfolio/providers/contact_provider.dart';
import 'package:portfolio/providers/service_provider.dart';
import 'package:portfolio/utils/AppRoutes.dart';
import 'package:provider/provider.dart';

import 'providers/navigation_provider.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => BlogProvider()),
        ChangeNotifierProvider(create: (_) => ServiceProvider()),
        ChangeNotifierProvider(create: (_) => ContactProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AGM Khair Sabbir',
      initialRoute: AppRoutes.home, // Use route from AppRoutes
      routes: AppRoutes.getRoutes(), // Use routes from AppRoutes
    );
  }
}
