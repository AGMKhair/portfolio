import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    const primaryColor = Color(0xFF1A237E);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedScale(
        scale: _hovered && !isMobile ? 1.04 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: isMobile ? double.infinity : 280,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _hovered ? primaryColor.withOpacity(0.3) : Colors.transparent,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(_hovered ? 0.15 : 0.08),
                blurRadius: _hovered ? 25 : 15,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ===== ICON =====
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _hovered
                      ? primaryColor.withOpacity(0.1)
                      : Colors.blueGrey.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color: _hovered ? primaryColor : Colors.blueGrey.shade700,
                ),
              ),

              const SizedBox(height: 20),

              // ===== TITLE =====
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: _hovered ? primaryColor : Colors.black87,
                ),
              ),

              const SizedBox(height: 12),

              // ===== DESCRIPTION =====
              Text(
                widget.description,
                textAlign: TextAlign.center,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: 13.5,
                  height: 1.6,
                  color: Colors.grey.shade600,
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
