import 'package:flutter/material.dart';
import 'package:portfolio/providers/navigation_provider.dart';
import 'package:provider/provider.dart';

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
          final bool isSelected = provider.currentIndex == index;

          return TextButton(
            onPressed: () => context.read<NavigationProvider>().setIndex(index),
            style: ButtonStyle(
              // Change background/overlay color on hover
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return Colors.amber.withOpacity(0.2); // Your hover color here
                  }
                  return null; // default
                },
              ),
              foregroundColor: MaterialStateProperty.all<Color>(
                isSelected ? Colors.amber : Colors.white,
              ),
            ),
            child: Text(items[index]),
          );
        },
      ),
    );
  }
}
