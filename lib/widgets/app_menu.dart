import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    const primaryColor = Color(0xFF1A237E);

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

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: TextButton(
            onPressed: () => context.read<NavigationProvider>().setIndex(index),
            style: TextButton.styleFrom(
              foregroundColor: isSelected ? Colors.white : Colors.white70,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ).copyWith(
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (states) {
                  if (states.contains(MaterialState.hovered)) {
                    return Colors.white.withOpacity(0.05);
                  }
                  return isSelected ? primaryColor.withOpacity(0.08) : null;
                },
              ),
            ),
            child: Text(
              items[index],
              style: GoogleFonts.poppins(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
        );
      }),
    );
  }
}
