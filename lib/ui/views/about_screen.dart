// screens/about_screen.dart
import 'package:flutter/material.dart';
import 'package:portfolio/utils/responsive_builder.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double padding = ResponsiveBuilder.dynamicSize(context, size: 0.05);
    final double spacing = ResponsiveBuilder.dynamicSize(context, size: 0.02);
    final double titleSize = ResponsiveBuilder.dynamicSize(context, size: 0.06);
    final double sectionTitleSize = ResponsiveBuilder.dynamicSize(context, size: 0.045);
    final double contentSize = ResponsiveBuilder.dynamicSize(context, size: 0.035);

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'About Me',
                style: TextStyle(
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: spacing),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: ResponsiveBuilder.dynamicSize(context, size: 0.15),
                    backgroundImage: AssetImage('assets/profile.jpg'), // Replace with your image asset
                  ),
                  SizedBox(height: spacing),
                  Text(
                    'A.G.M. Khair Sabbir',
                    style: TextStyle(
                      fontSize: sectionTitleSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Software Engineer',
                    style: TextStyle(
                      fontSize: contentSize,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: spacing * 2),
            Text(
              'Introduction',
              style: TextStyle(
                fontSize: sectionTitleSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: spacing),
            Text(
              'Assalamu Alaikum. I am a software engineer with over 5 years of experience in mobile and backend development, specializing in Flutter, Spring Boot, and Native Android using Java and Kotlin.',
              style: TextStyle(fontSize: contentSize),
            ),
            SizedBox(height: spacing * 2),
            Text(
              'Education',
              style: TextStyle(
                fontSize: sectionTitleSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: spacing),
            Text(
              '- M.Sc. in Computer Science, Jahangirnagar University\n- B.Sc. in Computer Science, Daffodil International University',
              style: TextStyle(fontSize: contentSize),
            ),
            SizedBox(height: spacing * 2),
            Text(
              'Career Journey',
              style: TextStyle(
                fontSize: sectionTitleSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: spacing),
            Text(
              'Started as an Android Developer in 2019 at Robi 10 Minute School. Later worked at SecureSoft and CIBL Technology, contributing to banking apps for Prime Bank, NRBC, and Meghna Bank. Currently, I am a Full Stack Software Engineer at Islami Bank Bangladesh PLC, developing financial apps like CellFin and the Agent Banking Merchant App.',
              style: TextStyle(fontSize: contentSize),
            ),
            SizedBox(height: spacing * 2),
            Text(
              'Projects & Achievements',
              style: TextStyle(
                fontSize: sectionTitleSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: spacing),
            Text(
              'Developed various projects during student life, including mobile apps and an IoT-based automation system. Received awards for a university automation project and a campus guide app.',
              style: TextStyle(fontSize: contentSize),
            ),
            SizedBox(height: spacing * 2),
            Text(
              'Personal Interests',
              style: TextStyle(
                fontSize: sectionTitleSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: spacing),
            Text(
              'Passionate about technology, I enjoy building personal projects, exploring new tools, and continuously improving my skills. I am also actively involved in charity organizations.',
              style: TextStyle(fontSize: contentSize),
            ),
            SizedBox(height: spacing * 2),
            Center(
              child: Text(
                '“My dream is to become a world-class software engineer, In shaa Allah — someone who builds useful software and makes a positive difference in the world.”',
                style: TextStyle(
                  fontSize: contentSize,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: spacing * 2),
            Divider(),
            SizedBox(height: spacing),
            Center(
              child: Text(
                'Contact: your.email@example.com | LinkedIn | GitHub | Facebook | Instagram',
                style: TextStyle(fontSize: contentSize),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
