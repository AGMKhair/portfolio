import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/navigation_provider.dart';

class AppMenu extends StatelessWidget {
  const AppMenu({super.key});

  final List<String> items = const [
    'Home',
    'About',
    'Projects',
    'Blog',
    'Services',
    'Contact'
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NavigationProvider>();

    return Row(
      children: List.generate(
        items.length,
        (index) {
          return TextButton(
            onPressed: () => context.read<NavigationProvider>().setIndex(index),
            child: Text(
              items[index],
              style: TextStyle(
                color: provider.currentIndex == index
                    ? Colors.amber
                    : Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        AppMenu(),
      ],
    );
  }
}
