import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/providers/blog_provider.dart';
import 'package:portfolio/ui/views/home_screen.dart';
import 'package:portfolio/ui/views/portfolio_screen.dart';
import 'package:portfolio/ui/views/projects_screen.dart';
import 'package:portfolio/utils/AppRoutes.dart';
import 'package:portfolio/utils/responsive_builder.dart';
import 'package:portfolio/ui/views/about_screen.dart';
import 'package:portfolio/widgets/app_menu.dart';
import 'package:portfolio/widgets/social_links.dart';
import 'package:provider/provider.dart';
import 'providers/navigation_provider.dart';

void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => BlogProvider()),
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
      title: 'My Platform',
      initialRoute: AppRoutes.home, // Use route from AppRoutes
      routes: AppRoutes.getRoutes(), // Use routes from AppRoutes
    );
  }
}
