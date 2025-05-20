import 'package:flutter/material.dart';
import 'package:portfolio/providers/navigation_provider.dart';
import 'package:portfolio/ui/views/about_screen.dart';
import 'package:portfolio/ui/views/blog/blog_screen.dart';
import 'package:portfolio/ui/views/contact/contact_screen.dart';
import 'package:portfolio/ui/views/home_screen.dart';
import 'package:portfolio/ui/views/projects_screen.dart';
import 'package:portfolio/ui/views/service/service_screen.dart';
import 'package:portfolio/utils/size_extensions.dart';
import 'package:portfolio/widgets/app_menu.dart';
import 'package:portfolio/widgets/drawer_menu.dart';
import 'package:portfolio/widgets/social_links.dart';
import 'package:provider/provider.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  static final pages = [
    HomeScreen(),
    AboutScreen(),
    ProjectsScreen(),
    BlogScreen(),
    ServicesScreen(),
    ContactScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<NavigationProvider>().currentIndex;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'AGM Khair Sabbir Portfolio',
          style:
              TextStyle(color: Colors.white, fontSize: context.isMobile ? context.contentSize : context.titleSizeWebsite),
        ),
        actions: context.isMobile ? null : const [AppMenu(), SocialLinks()],
      ),
      drawer: context.isMobile ? const Drawer(child: DrawerMenu()) : null,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: pages[currentIndex],
      ),
    );
  }
}
