class Testimonial {
  final String name;
  final String role;
  final String company;
  final String text;
  final String? avatarPath;
  final int rating;

  const Testimonial({
    required this.name,
    required this.role,
    required this.company,
    required this.text,
    this.avatarPath,
    this.rating = 5,
  });
}
