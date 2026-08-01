class Experience {
  final String company;
  final String role;
  final String duration;
  final String location;
  final String? logoPath;
  final List<String> responsibilities;
  final List<String> achievements;
  final List<String> technologies;
  final bool isCurrent;

  const Experience({
    required this.company,
    required this.role,
    required this.duration,
    required this.location,
    this.logoPath,
    required this.responsibilities,
    required this.achievements,
    required this.technologies,
    this.isCurrent = false,
  });
}
