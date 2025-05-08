import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  Widget _buildProjectCard({
    required String title,
    required String description,
    required List<Widget> media,
    String? playStoreUrl,
    String? apkUrl,
    String? videoUrl,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: media,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                if (playStoreUrl != null)
                  ElevatedButton.icon(
                    onPressed: () => _launchURL(playStoreUrl),
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Play Store'),
                  ),
                if (apkUrl != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ElevatedButton.icon(
                      onPressed: () => _launchURL(apkUrl),
                      icon: const Icon(Icons.download),
                      label: const Text('Download APK'),
                    ),
                  ),
                if (videoUrl != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ElevatedButton.icon(
                      onPressed: () => _launchURL(videoUrl),
                      icon: const Icon(Icons.video_library),
                      label: const Text('Watch Demo'),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildProjectCard(
          title: 'Campus Guide App',
          description: 'Award-winning student app. Maps, notices, utilities.',
          media: [
            Image.network('https://yourserver.com/campus1.jpg'),
            Image.network('https://yourserver.com/campus2.jpg'),
          ],
          playStoreUrl: 'https://play.google.com/store/apps/details?id=com.example.campus',
        ),
        _buildProjectCard(
          title: 'Banking App',
          description: 'Mobile banking for NRBC & Prime Bank. Kotlin + Flutter.',
          media: [
            Image.network('https://yourserver.com/bank_ui1.png'),
            InkWell(
              onTap: () => _launchURL('https://drive.google.com/file/d/yourVideoId/view'),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network('https://yourserver.com/bank_thumbnail.jpg'),
                  const Icon(Icons.play_circle_fill, size: 50, color: Colors.white),
                ],
              ),
            )
          ],
          apkUrl: 'https://drive.google.com/uc?export=download&id=yourApkId',
          videoUrl: 'https://drive.google.com/file/d/yourVideoId/view',
        ),
        _buildProjectCard(
          title: 'IoT Automation System',
          description: 'Control home devices via app + Firebase + ESP8266.',
          media: [
            Image.network('https://yourserver.com/iot1.png'),
            Image.network('https://yourserver.com/iot2.png'),
          ],
        ),
      ],
    );
  }
}
