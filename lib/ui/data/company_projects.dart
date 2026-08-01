import 'package:flutter/material.dart';
import 'package:portfolio/core/models/project.dart';

final companyProjects = [
  Project(
    title: 'CellFin – Digital Banking Platform',
    company: 'Islami Bank Bangladesh PLC',
    description:
        'Secure mobile banking platform featuring Account Transfer, RTGS, NPSB, Binimoy, FDR/DPS opening, QR payments, bill payments, and merchant banking modules.',
    tech: 'Flutter • Spring Boot • Oracle DB',
    imageUrl: 'assets/images/cellfin.png',
    isPlayStore: true,
    links: [
      ProjectLink(
          'Play Store',
          'https://play.google.com/store/apps/details?id=com.ibbl.cellfin',
          Icons.shop),
    ],
  ),
  Project(
    title: 'REDCUBE BUSINESS',
    company: 'Red Technologies Ltd',
    description:
        'Enterprise ERP application for SMEs featuring inventory, sales, customer management, invoicing, expense tracking, and payment modules.',
    tech: 'Flutter • Riverpod • REST API',
    imageUrl: 'assets/images/red_cube.png',
    isPlayStore: true,
    links: [
      ProjectLink(
          'Play Store',
          'https://play.google.com/store/apps/details?id=co.uk.redcube.merchant',
          Icons.shop),
    ],
  ),
  Project(
    title: 'Agent Banking – Merchant App',
    company: 'Islami Bank Bangladesh PLC',
    description:
        'Merchant onboarding, PR account management, and secure financial transaction workflows for agent banking operations across Bangladesh.',
    tech: 'Flutter • Oracle DB • REST API',
    imageUrl: 'assets/images/cellfin.png',
    isPlayStore: true,
    links: [
      ProjectLink(
          'Play Store',
          'https://play.google.com/store/apps/details?id=com.ibbl.cellfin',
          Icons.shop),
    ],
  ),
  Project(
    title: 'Enterprise Banking Backend Systems',
    company: 'Islami Bank Bangladesh PLC',
    description:
        'Secure backend microservices powering mobile banking API integrations, payment gateways, and banking security compliance.',
    tech: 'Java • Spring Boot • Oracle DB',
    imageUrl: 'assets/images/cellfin.png',
    isPlayStore: false,
    links: [],
  ),
  Project(
    title: 'MyPrime Mobile Banking',
    company: 'CIBL (Prime Bank PLC)',
    description:
        'Secure internet mobile banking app for Prime Bank PLC customers with biometric login and fund transfer.',
    tech: 'Native Android • Java • Kotlin',
    imageUrl: 'assets/images/prime_bank.png',
    isPlayStore: true,
    links: [
      ProjectLink(
          'Play Store',
          'https://play.google.com/store/apps/details?id=bd.com.primebank.pib.altitudemobile',
          Icons.shop),
    ],
  ),
  Project(
    title: 'ONE Bank App',
    company: 'CIBL (ONE Bank PLC)',
    description:
        'Mobile internet banking platform for ONE Bank PLC featuring bill payment and account management.',
    tech: 'Native Android • Java',
    imageUrl: 'assets/images/one_bank.jpg',
    isPlayStore: true,
    links: [
      ProjectLink(
          'Play Store',
          'https://play.google.com/store/apps/details?id=com.cibl.obl',
          Icons.shop),
    ],
  ),
  Project(
    title: 'NRBC PLANET & Meghna i-Banking',
    company: 'CIBL Technology Consultants',
    description:
        'Secure mobile banking solutions delivered for NRBC Bank PLC and Meghna Bank PLC.',
    tech: 'Flutter • Java • Kotlin',
    imageUrl: 'assets/images/nrbc.png',
    isPlayStore: true,
    links: [
      ProjectLink(
          'Play Store',
          'https://play.google.com/store/apps/details?id=com.cibl.plannet',
          Icons.shop),
    ],
  ),
  Project(
    title: '10 Minute School EduTech Platform',
    company: 'Robi 10 Minute School',
    description:
        'High-traffic EdTech learning platform app serving over 1M+ active students with live classes and educational videos.',
    tech: 'Java • Flutter • Android SDK',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/3/32/10minutesschool.png',
    isPlayStore: true,
    links: [
      ProjectLink(
          'Play Store',
          'https://play.google.com/store/apps/details?id=com.a10minuteschool.tenminuteschool',
          Icons.shop),
    ],
  ),
];
