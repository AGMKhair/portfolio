import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/providers/theme_provider.dart';
import 'package:portfolio/utils/size_extensions.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/widgets/section_header.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    final isDark = context.watch<ThemeProvider>().isDark;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        isMobile ? 24 : 80,
        120,
        isMobile ? 24 : 80,
        80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            tag: 'Contact',
            title: "Let's Connect &\nBuild Together",
            subtitle:
                'Open for Senior Software Engineering roles, FinTech consulting, and enterprise partnerships.',
          ),
          const SizedBox(height: 60),
          isMobile
              ? Column(
                  children: [
                    _ContactInfo(isDark: isDark),
                    const SizedBox(height: 40),
                    _ContactForm(isDark: isDark),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _ContactInfo(isDark: isDark)),
                    const SizedBox(width: 60),
                    Expanded(child: _ContactForm(isDark: isDark)),
                  ],
                ),
        ],
      ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  final bool isDark;
  const _ContactInfo({required this.isDark});

  @override
  Widget build(BuildContext context) {
    final textMuted = isDark ? AppColors.textMuted : AppColors.textLightMuted;

    const links = [
      (Icons.email_rounded, 'Email', 'agmkhair@gmail.com',
          'mailto:agmkhair@gmail.com', AppColors.accent),
      (Icons.phone_rounded, 'Phone / WhatsApp', '+880 1823-585800',
          'https://wa.me/8801823585800', Color(0xFF25D366)),
      (Icons.language_rounded, 'Website', 'agmkhair.com',
          'https://www.agmkhair.com', AppColors.accentTeal),
      (Icons.people_rounded, 'LinkedIn', 'linkedin.com/in/agmkhair',
          'https://linkedin.com/in/agmkhair', Color(0xFF0077B5)),
      (Icons.code_rounded, 'GitHub', 'github.com/AGMKhair',
          'https://github.com/AGMKhair', AppColors.textMuted),
      (Icons.shop_rounded, 'Google Play Developer', 'SponT IT Store',
          'https://play.google.com/store/apps/developer?id=SponT+IT', Color(0xFFF59E0B)),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Availability
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.statusActive.withOpacity(0.05),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: AppColors.statusActive.withOpacity(0.2)),
          ),
          child: Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.statusActive,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available for Senior Roles & FinTech Projects',
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.statusActive,
                      ),
                    ),
                    Text(
                      'Based in Dhaka, Bangladesh (Open for remote & hybrid roles)',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: textMuted,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        // Links
        ...links.map(
          (link) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _ContactLinkItem(
              icon: link.$1,
              label: link.$2,
              value: link.$3,
              url: link.$4,
              color: link.$5,
              isDark: isDark,
            ),
          ),
        ),
      ],
    );
  }
}

class _ContactLinkItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final String value;
  final String url;
  final Color color;
  final bool isDark;

  const _ContactLinkItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.url,
    required this.color,
    required this.isDark,
  });

  @override
  State<_ContactLinkItem> createState() => _ContactLinkItemState();
}

class _ContactLinkItemState extends State<_ContactLinkItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = widget.isDark;
    final bgColor = isDark ? AppColors.bgCard : AppColors.bgLightSurface;
    final borderColor = _hovered
        ? widget.color.withOpacity(0.3)
        : (isDark ? AppColors.border : AppColors.borderLight);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => launch(widget.url),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(widget.icon, color: widget.color, size: 18),
              ),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.label,
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      color: isDark ? AppColors.textMuted : AppColors.textLightMuted,
                    ),
                  ),
                  Text(
                    widget.value,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: _hovered
                          ? widget.color
                          : (isDark
                              ? AppColors.textSecondary
                              : AppColors.textLightSecondary),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_rounded,
                size: 16,
                color: _hovered ? widget.color : AppColors.textHint,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────
// CONTACT FORM
// ─────────────────────────────────────────────────────────
class _ContactForm extends StatefulWidget {
  final bool isDark;
  const _ContactForm({required this.isDark});

  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _subjectCtrl = TextEditingController();
  final _messageCtrl = TextEditingController();
  bool _submitted = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _subjectCtrl.dispose();
    _messageCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_nameCtrl.text.isEmpty || _emailCtrl.text.isEmpty) return;
    final body = Uri.encodeComponent(
        'Name: ${_nameCtrl.text}\nEmail: ${_emailCtrl.text}\nSubject: ${_subjectCtrl.text}\n\n${_messageCtrl.text}');
    launch('mailto:agmkhair@gmail.com?subject=${_subjectCtrl.text}&body=$body');
    setState(() => _submitted = true);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.isDark;
    final bgColor = isDark ? AppColors.bgCard : AppColors.bgLightSurface;
    final borderColor = isDark ? AppColors.borderStrong : AppColors.borderLight;
    final textColor = isDark ? AppColors.textPrimary : AppColors.textLightPrimary;
    final hintColor = isDark ? AppColors.textHint : AppColors.textLightMuted;

    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: isDark ? AppColors.bgSurface : AppColors.bgLightCard,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.accent, width: 1.5),
      ),
      hintStyle: GoogleFonts.inter(fontSize: 14, color: hintColor),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor),
      ),
      child: _submitted
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check_circle_rounded,
                      color: AppColors.statusActive, size: 48),
                  const SizedBox(height: 16),
                  Text(
                    "Message sent!",
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "I'll get back to you shortly.",
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: isDark ? AppColors.textMuted : AppColors.textLightMuted,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Send a Message',
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Directly reaches agmkhair@gmail.com",
                  style: GoogleFonts.inter(
                      fontSize: 13,
                      color: isDark
                          ? AppColors.textMuted
                          : AppColors.textLightMuted),
                ),
                const SizedBox(height: 28),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _nameCtrl,
                        style: GoogleFonts.inter(fontSize: 14, color: textColor),
                        decoration:
                            inputDecoration.copyWith(hintText: 'Your Name'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: _emailCtrl,
                        style: GoogleFonts.inter(fontSize: 14, color: textColor),
                        decoration:
                            inputDecoration.copyWith(hintText: 'Email Address'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _subjectCtrl,
                  style: GoogleFonts.inter(fontSize: 14, color: textColor),
                  decoration: inputDecoration.copyWith(hintText: 'Subject'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _messageCtrl,
                  style: GoogleFonts.inter(fontSize: 14, color: textColor),
                  maxLines: 5,
                  decoration:
                      inputDecoration.copyWith(hintText: 'Your message...'),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: _submit,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        gradient: AppColors.accentGradient,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.accent.withOpacity(0.3),
                            blurRadius: 16,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Send Message',
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
