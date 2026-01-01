import 'package:flutter/material.dart';
import 'package:portfolio/providers/navigation_provider.dart';
import 'package:portfolio/utils/size_extensions.dart';
import 'package:portfolio/widgets/DrawerMenuItem.dart';
import 'package:provider/provider.dart';

class AppMenu extends StatelessWidget {
  const AppMenu({super.key});

  final List<String> items = const [
    'Home',
    'About',
    'Projects',
    'Blog',
    'Services',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NavigationProvider>();

    // 🔹 Drawer / Mobile
    if (context.isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(items.length, (index) {
          return DrawerMenuItem(
            text: items[index],
            isSelected: provider.currentIndex == index,
            onTap: () {
              context.read<NavigationProvider>().setIndex(index);
              Navigator.of(context).pop();
            },
          );
        }),
      );
    }

    // 🔹 Web / Desktop Top Menu
    return Row(
      children: List.generate(items.length, (index) {
        final bool isSelected = provider.currentIndex == index;

        return TextButton(
          onPressed: () =>
              context.read<NavigationProvider>().setIndex(index),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (states) {
                if (states.contains(MaterialState.hovered)) {
                  return Colors.amber.withOpacity(0.2);
                }
                return null;
              },
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              isSelected ? Colors.amber : Colors.white,
            ),
          ),
          child: Text(items[index]),
        );
      }),
    );
  }
}
