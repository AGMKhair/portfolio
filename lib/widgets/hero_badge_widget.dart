
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroBadge extends StatefulWidget {
  final String text;

  const HeroBadge(this.text);

  @override
  State<HeroBadge> createState() => HeroBadgeState();
}

class HeroBadgeState extends State<HeroBadge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;
  bool _hovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF1A237E);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: SlideTransition(
        position: _slide,
        child: FadeTransition(
          opacity: _fade,
          child: AnimatedScale(
            scale: _hovered ? 1.08 : 1.0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: _hovered ? primaryColor.withOpacity(0.1) : Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: _hovered ? primaryColor : Colors.blueGrey.shade100,
                  width: 1.5,
                ),
                boxShadow: [
                  if (_hovered)
                    BoxShadow(
                      color: primaryColor.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                ],
              ),
              child: Text(
                widget.text,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: _hovered ? primaryColor : Colors.blueGrey.shade800,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}