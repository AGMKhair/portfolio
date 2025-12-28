import 'package:flutter/material.dart';
import 'package:portfolio/providers/contact_provider.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contactProvider = context.watch<ContactProvider>();
    final isMobile = MediaQuery.of(context).size.width < 900;

    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final messageController = TextEditingController();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 120,
        vertical: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ===== HEADER =====
          Text(
            'Contact Me',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Have a project in mind or want to work together? Let’s talk.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),

          const SizedBox(height: 40),

          // ===== CONTENT =====
          isMobile
              ? _contactForm(
            context,
            contactProvider,
            nameController,
            emailController,
            messageController,
          )
              : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // LEFT INFO
              Expanded(
                child: _contactInfo(context),
              ),
              const SizedBox(width: 60),
              // RIGHT FORM
              Expanded(
                child: _contactForm(
                  context,
                  contactProvider,
                  nameController,
                  emailController,
                  messageController,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ================= CONTACT INFO =================

  Widget _contactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Let’s build something great',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'I am open to freelance projects, full-time roles, and long-term collaborations. '
              'Feel free to reach out for mobile app development, Flutter consulting, or any technical discussion.',
          style: TextStyle(fontSize: 14, height: 1.6),
        ),
        SizedBox(height: 24),
        _InfoRow(icon: Icons.email, text: 'agmkhair@gmail.com'),
        SizedBox(height: 12),
        _InfoRow(icon: Icons.location_on, text: 'Dhaka, Bangladesh'),
        SizedBox(height: 12),
        _InfoRow(icon: Icons.work_outline, text: 'Available for Remote & On-site'),
      ],
    );
  }

  // ================= FORM =================

  Widget _contactForm(
      BuildContext context,
      ContactProvider provider,
      TextEditingController nameController,
      TextEditingController emailController,
      TextEditingController messageController,
      ) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Send a Message',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          _inputField(
            controller: nameController,
            label: 'Your Name',
            icon: Icons.person,
          ),
          const SizedBox(height: 16),

          _inputField(
            controller: emailController,
            label: 'Your Email',
            icon: Icons.email,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),

          _inputField(
            controller: messageController,
            label: 'Your Message',
            icon: Icons.message,
            maxLines: 5,
          ),
          const SizedBox(height: 30),

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
                  await provider.submitContactForm(
                    nameController.text,
                    emailController.text,
                    messageController.text,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Message sent successfully!')),
                  );

                  nameController.clear();
                  emailController.clear();
                  messageController.clear();
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: $e')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Send Message',
                style: TextStyle(fontSize: 16),
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
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

// ================= INFO ROW =================

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 10),
        Text(text, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
