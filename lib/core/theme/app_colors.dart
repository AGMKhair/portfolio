import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── Primary Background (Deep SponT Navy / Midnight Slate from Logo)
  static const Color bgDark = Color(0xFF070C1E);
  static const Color bgSurface = Color(0xFF0F172A);
  static const Color bgCard = Color(0xFF131D38);
  static const Color bgCardHover = Color(0xFF1C2B50);

  // ── Accent (SponT IT Vibrant Orange & Warm Gold from Logo)
  static const Color accent = Color(0xFFFF6B00); // Signature SponT Orange
  static const Color accentSecondary = Color(0xFFFF9F1C); // Warm SponT Amber/Gold
  static const Color accentTeal = Color(0xFFFF8800);
  static const Color accentGlow = Color(0x33FF6B00);
  static const Color accentSecondaryGlow = Color(0x22FF9F1C);

  // ── Text
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFCBD5E1);
  static const Color textMuted = Color(0xFF94A3B8);
  static const Color textHint = Color(0xFF64748B);

  // ── Borders
  static const Color border = Color(0x1A38BDF8);
  static const Color borderStrong = Color(0x33FF6B00);
  static const Color borderAccent = Color(0x4DFF6B00);

  // ── Light mode equivalents
  static const Color bgLight = Color(0xFFF8FAFC);
  static const Color bgLightSurface = Color(0xFFFFFFFF);
  static const Color bgLightCard = Color(0xFFF1F5F9);
  static const Color textLightPrimary = Color(0xFF0F172A);
  static const Color textLightSecondary = Color(0xFF475569);
  static const Color textLightMuted = Color(0xFF64748B);
  static const Color borderLight = Color(0xFFE2E8F0);

  // ── Status colors
  static const Color statusActive = Color(0xFF10B981);
  static const Color statusBeta = Color(0xFFFF9F1C);
  static const Color statusSoon = Color(0xFF64748B);
  static const Color statusDev = Color(0xFF3B82F6);

  // ── Gradient stops (SponT Logo Orange Gradient)
  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFF5100), Color(0xFFFF9F1C)],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0F172A), Color(0xFF1C2B50)],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFFFF6B00), Color(0xFFFF9F1C)],
  );
}
