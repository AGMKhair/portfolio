import 'package:flutter/material.dart';
import 'package:portfolio/core/models/project.dart';

final clientProjects = [
  Project(
    title: 'SponT Books',
    company: 'SponT IT',
    description:
        'Accounting and bookkeeping application for individuals and small businesses featuring income & expense tracking, PDF reports, and cloud sync.',
    imageUrl: 'assets/images/fund.png',
    tech: 'Flutter • Firebase • SQLite',
    isPlayStore: true,
    links: [
      ProjectLink(
        'Play Store',
        'https://play.google.com/store/apps/details?id=com.agmkhair.spontit.accounting',
        Icons.shop,
      ),
    ],
  ),
  Project(
    title: 'BD BAZAR',
    company: 'SponT IT',
    description:
        'Multi-vendor eCommerce platform with product catalog, shopping cart, order management, user authentication, and REST API integration.',
    imageUrl: 'assets/images/bd_bazar.png',
    tech: 'Flutter • REST APIs • MySQL',
    isPlayStore: true,
    links: [
      ProjectLink(
        'Play Store',
        'https://play.google.com/store/apps/details?id=com.bdbazare.userapp',
        Icons.shop,
      ),
    ],
  ),
  Project(
    title: 'SponT TV',
    company: 'SponT IT',
    description:
        'Live TV and IPTV media player supporting custom M3U playlists, favorites, Material 3 UI, and video playback.',
    imageUrl: 'assets/images/placeholder.png',
    tech: 'Flutter • Firebase • IPTV',
    isPlayStore: true,
    links: [
      ProjectLink(
        'Play Store',
        'https://play.google.com/store/apps/details?id=com.hasib.sponttv',
        Icons.shop,
      ),
    ],
  ),
  Project(
    title: 'Alphie Game',
    company: 'SponT IT',
    description:
        '2D adventure and puzzle game developed using Flutter and the Flame Game Engine with custom mechanics.',
    imageUrl: 'assets/images/placeholder.png',
    tech: 'Flutter • Flame Engine',
    isPlayStore: true,
    links: [
      ProjectLink(
        'Play Store',
        'https://play.google.com/store/apps/details?id=com.agmkhair.spont_it.alphie',
        Icons.shop,
      ),
    ],
  ),
  Project(
    title: 'Daily Deen Companion',
    company: 'SponT IT',
    description:
        'Islamic lifestyle application featuring prayer times, Quran, Hadith, Duas, and Islamic calendar.',
    imageUrl: 'assets/images/islamic.png',
    tech: 'Flutter • Firebase • SQLite',
    isPlayStore: true,
    links: [
      ProjectLink(
        'Play Store',
        'https://play.google.com/store/apps/details?id=com.agmkhair.spontit.protidinerddinersathi',
        Icons.shop,
      ),
    ],
  ),
];

final socialProjects = [
  Project(
    title: 'Hilful Fuzul',
    company: 'Hilful Fuzul Organization',
    description:
        'Official app for Hilful Fuzul Samaj Kalyan Sangstha — goals, activities, routine updates, notices, and community support.',
    imageUrl: 'assets/images/hilfulfuzul.png',
    tech: 'Flutter • Firebase',
    isPlayStore: true,
    links: [
      ProjectLink(
        'Play Store',
        'https://play.google.com/store/apps/details?id=com.agmkhair.spontit.hilfulfuzul.hilful_fuzul_somaj_kollan_songstha',
        Icons.shop,
      ),
    ],
  ),
  Project(
    title: 'Campus Blood Donor',
    company: 'Daffodil International University',
    description:
        'Blood donor management application enabling students to find blood donors quickly during emergencies.',
    imageUrl: 'assets/images/diu.png',
    tech: 'Flutter • Firebase',
    isPlayStore: true,
    links: [
      ProjectLink(
        'Play Store',
        'https://play.google.com/store/apps/details?id=com.spontit.agmkhair.diu_life_save',
        Icons.shop,
      ),
    ],
  ),
];