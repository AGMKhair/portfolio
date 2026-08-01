import 'package:portfolio/core/models/blog_post.dart';

final List<BlogPost> blogPosts = [
  const BlogPost(
    title: 'Clean Architecture in Flutter: A Practical Guide',
    excerpt:
        'How I structure large-scale Flutter apps using clean architecture, why separation of concerns matters in production, and the patterns that have saved my team countless hours.',
    category: 'Architecture',
    date: 'Jul 2025',
    readTime: '8 min read',
    tags: ['Flutter', 'Clean Architecture', 'MVVM', 'Dart'],
  ),
  const BlogPost(
    title: 'Building a FinTech App in Flutter: Security Patterns That Matter',
    excerpt:
        'Lessons from building mobile banking apps for millions of users — biometric auth, certificate pinning, secure storage, and the critical mistakes to avoid.',
    category: 'FinTech',
    date: 'Jun 2025',
    readTime: '12 min read',
    tags: ['Flutter', 'FinTech', 'Security', 'Banking'],
  ),
  const BlogPost(
    title: 'From Employee to Founder: My Journey Building SponT IT',
    excerpt:
        'Why I decided to build my own products while working full-time, the challenges of being a founder-engineer, and what I\'ve learned building 6 products from scratch.',
    category: 'Startup',
    date: 'May 2025',
    readTime: '10 min read',
    tags: ['Startup', 'Entrepreneurship', 'Product'],
  ),
  const BlogPost(
    title: 'Flutter Riverpod vs Provider: Which Should You Use in 2025?',
    excerpt:
        'A practical comparison based on real production usage — performance, testability, code organization, and when each state management approach truly shines.',
    category: 'Flutter',
    date: 'Apr 2025',
    readTime: '7 min read',
    tags: ['Flutter', 'Riverpod', 'Provider', 'State Management'],
  ),
  const BlogPost(
    title: 'CI/CD for Flutter: Automating Releases with GitHub Actions',
    excerpt:
        'A step-by-step guide to setting up fully automated Flutter builds and Play Store deployments — including signing, testing, and staged rollouts.',
    category: 'DevOps',
    date: 'Mar 2025',
    readTime: '9 min read',
    tags: ['CI/CD', 'GitHub Actions', 'Flutter', 'DevOps'],
  ),
  const BlogPost(
    title: 'Spring Boot + Flutter: Building a Production-Ready Mobile Backend',
    excerpt:
        'The architecture decisions, API design patterns, and deployment strategies I use when building backends for Flutter apps that need to scale.',
    category: 'Backend',
    date: 'Feb 2025',
    readTime: '11 min read',
    tags: ['Spring Boot', 'Flutter', 'REST API', 'Backend'],
  ),
];
