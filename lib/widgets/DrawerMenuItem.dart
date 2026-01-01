import 'package:flutter/material.dart';

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
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          color: widget.isSelected
              ? Colors.amber.withOpacity(0.25)
              : _hovered
              ? Colors.white.withOpacity(0.12)
              : Colors.transparent,
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.isSelected
                  ? Colors.amber
                  : Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
