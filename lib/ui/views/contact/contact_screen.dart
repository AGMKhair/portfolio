import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/providers/contact_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  Future<void> _sendEmail({
    required String name,
    required String email,
    required String message,
  }) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'agmkhair@gmail.com',
      queryParameters: {
        'subject': 'Contact from Portfolio Website',
        'body': '''
Name: $name
Email: $email

Message:
$message
'''
      },
    );

    if (!await launchUrl(emailUri)) {
      throw 'Could not launch email client';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    const primaryColor = Color(0xFF1A237E);
    const secondaryColor = Color(0xFFFFC107);

    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final messageController = TextEditingController();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 140,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ===== HEADER =====
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: Column(
              children: [
                Text(
                  'Get In Touch',
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 32 : 48,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: 80,
                  height: 4,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: isMobile ? double.infinity : 700,
                  child: Text(
                    'Have a project in mind or want to work together? '
                    'Let’s discuss your idea and build something great together.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 15 : 18,
                      color: Colors.blueGrey.shade700,
                      height: 1.6,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 80),

          // ===== CONTENT =====
          isMobile
              ? Column(
                  children: [
                    _contactInfo(context, primaryColor, isMobile),
                    const SizedBox(height: 60),
                    _contactForm(
                      context,
                      nameController,
                      emailController,
                      messageController,
                      primaryColor,
                      isMobile,
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // LEFT INFO
                    Expanded(
                      flex: 2,
                      child: FadeInLeft(
                        duration: const Duration(milliseconds: 800),
                        child: _contactInfo(context, primaryColor, isMobile),
                      ),
                    ),
                    const SizedBox(width: 80),
                    // RIGHT FORM
                    Expanded(
                      flex: 3,
                      child: FadeInRight(
                        duration: const Duration(milliseconds: 800),
                        child: _contactForm(
                          context,
                          nameController,
                          emailController,
                          messageController,
                          primaryColor,
                          isMobile,
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  // ================= CONTACT INFO =================

  Widget _contactInfo(BuildContext context, Color primaryColor, bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 180,
          width: 180,
          child: Lottie.asset('assets/lottie/contact.json'),
        ),
        const SizedBox(height: 24),
        Text(
          'Let’s build something great',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'I am open to freelance projects, full-time roles, and long-term collaborations. '
          'Feel free to reach out for mobile app development, Flutter consulting, or any technical discussion.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.inter(fontSize: 15, height: 1.7, color: Colors.blueGrey.shade800),
        ),
        const SizedBox(height: 40),
        _infoCard(Icons.email, 'Email Me', 'agmkhair@gmail.com', primaryColor),
        const SizedBox(height: 20),
        _infoCard(Icons.location_on, 'Location', 'Dhaka, Bangladesh', primaryColor),
        const SizedBox(height: 20),
        _infoCard(Icons.work_outline, 'Availability', 'Available for Remote & On-site', primaryColor),
      ],
    );
  }

  Widget _infoCard(IconData icon, String title, String value, Color primaryColor) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: primaryColor, size: 24),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey.shade400,
                ),
              ),
              Text(
                value,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ================= FORM =================

  Widget _contactForm(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController emailController,
    TextEditingController messageController,
    Color primaryColor,
    bool isMobile,
  ) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 24 : 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send a Message',
            style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: primaryColor),
          ),
          const SizedBox(height: 32),
          _inputField(
            controller: nameController,
            label: 'Your Name',
            icon: Icons.person_outline,
            primaryColor: primaryColor,
          ),
          const SizedBox(height: 20),
          _inputField(
            controller: emailController,
            label: 'Your Email',
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            primaryColor: primaryColor,
          ),
          const SizedBox(height: 20),
          _inputField(
            controller: messageController,
            label: 'Your Message',
            icon: Icons.chat_bubble_outline,
            maxLines: 5,
            primaryColor: primaryColor,
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                if (nameController.text.isEmpty ||
                    emailController.text.isEmpty ||
                    messageController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill all fields')),
                  );
                  return;
                }

                try {
                  await _sendEmail(
                    name: nameController.text,
                    email: emailController.text,
                    message: messageController.text,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Email client opened. Please send the message.'),
                    ),
                  );

                  nameController.clear();
                  emailController.clear();
                  messageController.clear();
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Could not open email app')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 22),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
              ),
              child: Text(
                'Send Message',
                style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= INPUT =================

  Widget _inputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required Color primaryColor,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.blueGrey.shade700,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          style: GoogleFonts.inter(fontSize: 16),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: primaryColor.withOpacity(0.5)),
            filled: true,
            fillColor: Colors.blueGrey.shade50,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: primaryColor, width: 2),
            ),
            contentPadding: const EdgeInsets.all(20),
          ),
        ),
      ],
    );
  }
}
