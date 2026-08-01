import 'package:flutter/material.dart';
import 'package:portfolio/core/models/product.dart';

final List<Product> products = [
  Product(
    name: 'SponT Books',
    tagline: 'Accounting & Bookkeeping App',
    description:
        'Accounting and bookkeeping application for individuals and small businesses featuring income & expense tracking, multi-account management, PDF reports, cloud sync, and subscription support.',
    status: 'Live',
    icon: Icons.account_balance_wallet_rounded,
    accentColor: const Color(0xFF7C3AED),
    technologies: ['Flutter', 'Firebase', 'SQLite', 'REST APIs'],
    features: [
      'Income & expense tracking',
      'Multi-account management',
      'PDF financial reports',
      'Cloud data synchronization',
      'Google Play store app',
    ],
  ),
  Product(
    name: 'BD BAZAR',
    tagline: 'Multi-Vendor eCommerce Platform',
    description:
        'Multi-vendor eCommerce platform with product catalog, shopping cart, order management, user authentication, and REST API integration.',
    status: 'Live',
    icon: Icons.shopping_bag_rounded,
    accentColor: const Color(0xFFEC4899),
    technologies: ['Flutter', 'REST APIs', 'MySQL', 'Firebase'],
    features: [
      'Multi-vendor catalog',
      'Shopping cart & checkout',
      'Real-time order tracking',
      'User authentication',
      'REST API backend',
    ],
  ),
  Product(
    name: 'SponT TV',
    tagline: 'Live TV & IPTV Media Player',
    description:
        'Live TV and IPTV media player supporting custom M3U playlists, favorites, Material 3 UI, and optimized video playback.',
    status: 'Live',
    icon: Icons.tv_rounded,
    accentColor: const Color(0xFFEF4444),
    technologies: ['Flutter', 'Firebase', 'ExoPlayer', 'HLS Streaming'],
    features: [
      'Custom M3U playlist support',
      'Favorite channels manager',
      'Material 3 UI design',
      'Optimized video player',
    ],
  ),
  Product(
    name: 'Alphie Game',
    tagline: '2D Adventure & Puzzle Game',
    description:
        '2D adventure and puzzle game developed using Flutter and the Flame Game Engine with optimized rendering and engaging gameplay.',
    status: 'Live',
    icon: Icons.sports_esports_rounded,
    accentColor: const Color(0xFFF59E0B),
    technologies: ['Flutter', 'Flame Engine', 'Dart'],
    features: [
      'Flame Game Engine graphics',
      'Custom game loop & physics',
      '2D level designs',
      'Interactive controls',
    ],
  ),
  Product(
    name: 'Campus Blood Donor',
    tagline: 'DIU Blood Donor Management',
    description:
        'Blood donor management application for Daffodil International University, enabling students to find blood donors quickly during emergencies.',
    status: 'Live',
    icon: Icons.favorite_rounded,
    accentColor: const Color(0xFF10B981),
    technologies: ['Flutter', 'Firebase', 'Cloud Messaging'],
    features: [
      'Real-time donor search',
      'Emergency blood request alerts',
      'Campus student community',
      'Location filtering',
    ],
  ),
  Product(
    name: 'Daily Deen Companion',
    tagline: 'Islamic Lifestyle Companion',
    description:
        'Islamic lifestyle application featuring prayer times, Quran, Hadith, Duas, Islamic calendar, and Firebase cloud integration.',
    status: 'Live',
    icon: Icons.menu_book_rounded,
    accentColor: const Color(0xFF06B6D4),
    technologies: ['Flutter', 'Firebase', 'SQLite'],
    features: [
      'Accurate prayer times',
      'Quran & Hadith resources',
      'Daily Dua collection',
      'Hijri calendar integration',
    ],
  ),
  Product(
    name: 'Kobi – AI Story Maker',
    tagline: 'AI-Powered Story Generator',
    description:
        'AI-powered story generation application integrating GPT-based content generation with multilingual support and voice synthesis.',
    status: 'Live',
    icon: Icons.auto_awesome_rounded,
    accentColor: const Color(0xFF8B5CF6),
    technologies: ['Flutter', 'AI APIs', 'GPT Models'],
    features: [
      'AI story creation engine',
      'Multilingual generation',
      'Text-to-speech voice synthesis',
    ],
  ),
];
