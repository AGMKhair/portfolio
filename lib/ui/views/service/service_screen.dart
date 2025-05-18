import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/providers/service_provider.dart';
import 'package:portfolio/utils/AppRoutes.dart';
import 'package:provider/provider.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServiceProvider>(context);

    return Scaffold(
      body: FutureBuilder(
        future: serviceProvider.fetchServices(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error loading services'));
          }

          final services = serviceProvider.services;

          return services.isEmpty
              ? const Center(child: Text('No services available'))
              : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: services.length,
            itemBuilder: (context, index) {
              final service = services[index];
              return Card(
                child: ListTile(
                  leading: service['iconUrl'] != null && service['iconUrl'].isNotEmpty
                      ? CachedNetworkImage(
                    imageUrl: service['iconUrl'],
                    width: 40,
                    height: 40,
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  )
                      : const Icon(Icons.build, size: 40),
                  title: Text(
                    service['title'] ?? 'Untitled Service',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    service['description'] ?? 'No description',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, AppRoutes.addService),
        child: const Icon(Icons.add),
      ),
    );
  }
}
