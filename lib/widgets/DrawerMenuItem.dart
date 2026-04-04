import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerMenuItem extends StatefulWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const DrawerMenuItem({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<DrawerMenuItem> createState() => _DrawerMenuItemState();
}

class _DrawerMenuItemState extends State<DrawerMenuItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF1A237E);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: InkWell(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: widget.isSelected
                ? primaryColor.withOpacity(0.12)
                : _hovered
                ? Colors.black.withOpacity(0.05)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 4,
                height: widget.isSelected ? 20 : 0,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(width: widget.isSelected ? 12 : 0),
              Text(
                widget.text,
                style: GoogleFonts.poppins(
                  color: widget.isSelected
                      ? primaryColor
                      : Colors.blueGrey.shade700,
                  fontSize: 16,
                  fontWeight: widget.isSelected ? FontWeight.bold : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
