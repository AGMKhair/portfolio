// ================= PROJECT CARD =================

import 'package:flutter/material.dart';
import 'package:portfolio/core/models/project.dart';
import 'package:portfolio/widgets/project_image_widget.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  final Function(String) onLaunch;

  const ProjectCard({
    required this.project,
    required this.onLaunch,
  });

  @override
  State<ProjectCard> createState() => ProjectCardState();
}

class ProjectCardState extends State<ProjectCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: hover
            ? (Matrix4.identity()..translate(0, -6))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(hover ? 0.12 : 0.08),
              blurRadius: 22,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProjectImage(project: widget.project),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.project.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  if (widget.project.company != null)
                    Text(
                      widget.project.company!,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),

                  const SizedBox(height: 8),

                  Text(
                    widget.project.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    widget.project.tech,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                    ),
                  ),

                  const SizedBox(height: 14),

                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: widget.project.links.map((link) {
                      return OutlinedButton.icon(
                        onPressed: () => widget.onLaunch(link.url),
                        icon: Icon(link.icon, size: 18),
                        label: Text(link.label),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}