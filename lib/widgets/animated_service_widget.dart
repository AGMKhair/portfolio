import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedServiceCard extends StatefulWidget {
  final Map<String, dynamic> service;
  final int delay;

  const AnimatedServiceCard({
    required this.service,
    required this.delay,
  });

  @override
  State<AnimatedServiceCard> createState() => _AnimatedServiceCardState();
}

class _AnimatedServiceCardState extends State<AnimatedServiceCard>
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

    _fade = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _slide =
        Tween(begin: const Offset(0, 0.08), end: Offset.zero).animate(_controller);

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _controller.forward();
    });
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
      child: FadeTransition(
        opacity: _fade,
        child: SlideTransition(
          position: _slide,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: _hovered ? primaryColor.withOpacity(0.1) : Colors.transparent,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(_hovered ? 0.08 : 0.04),
                  blurRadius: _hovered ? 30 : 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.service['lottie'] != null)
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: Lottie.asset(
                      widget.service['lottie'],
                      repeat: true,
                    ),
                  )
                else
                  Icon(
                    widget.service['icon'],
                    size: 40,
                    color: primaryColor,
                  ),
                const SizedBox(height: 16),
                Text(
                  widget.service['title'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.service['description'],
                  textAlign: TextAlign.center,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.6,
                    color: Colors.blueGrey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
