import 'package:flutter/material.dart';
import 'package:portfolio/ui/views/home_screen.dart';
import 'package:portfolio/ui/views/projects_screen.dart';
import 'package:portfolio/utils/responsive_builder.dart';
import 'package:portfolio/ui/views/about_screen.dart';
import 'package:portfolio/widgets/app_menu.dart';
import 'package:portfolio/widgets/social_links.dart';
import 'package:provider/provider.dart';
import 'providers/navigation_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
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
      title: 'Responsive Portfolio',
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  static final pages = [
    HomeScreen(),
    AboutScreen(),
    ProjectsScreen(),
    // BlogPage(),
    // ServicesPage(),
    // ContactPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<NavigationProvider>().currentIndex;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
        actions: ResponsiveBuilder.isMobile(context) ? null : const [AppMenu(), SocialLinks()],
      ),
      drawer: ResponsiveBuilder.isMobile(context) ? const Drawer(child: DrawerMenu()) : null,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: pages[currentIndex],
      ),
    );
  }
}
