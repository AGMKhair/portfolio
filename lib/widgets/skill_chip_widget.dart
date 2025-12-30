import 'package:flutter/material.dart';

class SkillChip extends StatelessWidget {
  final String label;

  const SkillChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      backgroundColor: Colors.blueGrey.shade50,
      side: BorderSide(color: Colors.blueGrey.shade100),
    );
  }
}
