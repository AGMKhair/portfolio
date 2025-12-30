import 'package:flutter/material.dart';
import 'package:portfolio/utils/size_extensions.dart';

class FeatureCard extends StatefulWidget {
  final String title;
  final String description;

  const FeatureCard({
    required this.title,
    required this.description,
  });

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    final icon = _iconForTitle(widget.title);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedScale(
        scale: _hovered && !isMobile ? 1.04 : 1.0,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: isMobile ? double.infinity : 260,
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(_hovered ? 0.12 : 0.06),
                blurRadius: _hovered ? 22 : 14,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ===== ICON =====
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: _hovered
                      ? Colors.blueGrey.shade100
                      : Colors.blueGrey.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 30,
                  color: Colors.blueGrey.shade800,
                ),
              ),

              const SizedBox(height: 18),

              // ===== TITLE =====
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // ===== DESCRIPTION =====
              Text(
                widget.description,
                textAlign: TextAlign.center,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  height: 1.5,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= ICON MAPPER =================

  IconData _iconForTitle(String title) {
    final t = title.toLowerCase();

    if (t.contains('flutter')) return Icons.flutter_dash;
    if (t.contains('android')) return Icons.android;
    if (t.contains('website')) return Icons.language;
    if (t.contains('backend') || t.contains('api')) return Icons.cloud;
    if (t.contains('enterprise') || t.contains('industry'))
      return Icons.business;
    if (t.contains('research')) return Icons.science;
    if (t.contains('deployment') || t.contains('support'))
      return Icons.support_agent;
    if (t.contains('consultation') || t.contains('planning'))
      return Icons.psychology;

    return Icons.star;
  }
}
