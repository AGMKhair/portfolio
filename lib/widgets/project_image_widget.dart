import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/models/project.dart';
import 'package:shimmer/shimmer.dart';

class ProjectImage extends StatelessWidget {
  final Project project;

  const ProjectImage({required this.project});

  @override
  Widget build(BuildContext context) {
    final bool isAsset = project.imageUrl.startsWith('assets/');

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
      child: Stack(
        children: [
          SizedBox(
            height: 180,
            width: double.infinity,
            child: isAsset
                ? Image.asset(
              project.imageUrl,
              fit: BoxFit.fill,
              errorBuilder: (_, __, ___) => _placeholder(), // ✅ FIX
            )
                : CachedNetworkImage(
              imageUrl: project.imageUrl,
              fit: BoxFit.fill,
              placeholder: (_, __) => _shimmer(),
              errorWidget: (_, __, ___) => _placeholder(),
            ),
          ),

          if (project.isPlayStore)
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.green.shade600,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Play Store',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // ===== SHIMMER =====
  Widget _shimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: 180,
        color: Colors.white,
      ),
    );
  }

  // ===== PLACEHOLDER =====
  Widget _placeholder() {
    return Container(
      height: 180,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueGrey, Colors.black87],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.image_not_supported_outlined,
          size: 46,
          color: Colors.white70,
        ),
      ),
    );
  }
}
