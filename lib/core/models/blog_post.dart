class BlogPost {
  final String title;
  final String excerpt;
  final String category;
  final String date;
  final String readTime;
  final String? url;
  final List<String> tags;

  const BlogPost({
    required this.title,
    required this.excerpt,
    required this.category,
    required this.date,
    required this.readTime,
    this.url,
    this.tags = const [],
  });
}
