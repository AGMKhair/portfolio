import 'package:flutter/material.dart';
import 'package:portfolio/ui/views/blog/add_blog_screen.dart';
import 'package:portfolio/ui/views/blog/blog_details_screen.dart';
import 'package:portfolio/ui/views/contact/contact_screen.dart';
import 'package:portfolio/ui/views/portfolio_screen.dart';
import 'package:portfolio/ui/views/service/add_services_screen.dart';
import 'package:portfolio/ui/views/service/service_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String blogDetails = '/blog-details';
  static const String addBlog = '/add-blog';
  static const String services = '/services';
  static const String addService = '/add-Service';
  static const String contact = '/contact';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => const PortfolioScreen(),
      blogDetails: (context) => const BlogDetailScreen(),
      addBlog: (context) => const AddBlogScreen(),
      services: (context) => const ServicesScreen(),
      addService: (context) => const AddServiceScreen(),
      contact: (context) => const ContactScreen(),
    };
  }
}