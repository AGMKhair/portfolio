import 'package:flutter/material.dart';
import 'package:portfolio/providers/service_provider.dart';
import 'package:provider/provider.dart';

class AddServiceScreen extends StatelessWidget {
  const AddServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServiceProvider>(context);
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final iconUrlController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Add New Service')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Service Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: iconUrlController,
              decoration: const InputDecoration(
                labelText: 'Icon URL (optional)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (titleController.text.isNotEmpty && descriptionController.text.isNotEmpty) {
                  await serviceProvider.addService(
                    titleController.text,
                    descriptionController.text,
                    iconUrlController.text.isEmpty ? null : iconUrlController.text,
                  );
                  Navigator.pop(context);
                }
              },
              child: const Text('Add Service'),
            ),
          ],
        ),
      ),
    );
  }
}