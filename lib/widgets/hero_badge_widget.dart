
import 'package:flutter/material.dart';

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
      duration: const Duration(milliseconds: 500),
    );

    _fade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.25),
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
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: SlideTransition(
        position: _slide,
        child: FadeTransition(
          opacity: _fade,
          child: AnimatedScale(
            scale: _hovered ? 1.06 : 1.0,
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOut,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
              decoration: BoxDecoration(
                color: _hovered
                    ? Colors.blueGrey.shade100
                    : Colors.blueGrey.shade50,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: _hovered
                      ? Colors.blueGrey.shade300
                      : Colors.blueGrey.shade100,
                ),
              ),
              child: Text(
                widget.text,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}