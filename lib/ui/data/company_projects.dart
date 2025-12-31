import 'package:flutter/material.dart';
import 'package:portfolio/core/models/project.dart';

final companyProjects = [

  Project(
    title: 'REDCUBE BUSINESS',
    company: 'RED TECHNOLOGIES LTD',
    description: 'REDCUBE empowers Micro, Small & Medium Enterprises (SMEs)',
    tech: 'Flutter',
    imageUrl: 'assets/images/red_cube.png',
    isPlayStore: true,
    links: [
      ProjectLink('Play Store', 'https://play.google.com/store/apps/details?id=com.ibbl.cellfin&pcampaignid=web_share', Icons.shop),
    ],
  ),

  Project(
    title: 'CellFin',
    company: 'Islami Bank Bangladesh PLC',
    description: 'Digital Banking System',
    tech: 'Flutter',
    imageUrl: 'assets/images/cellfin.png',
    isPlayStore: true,
    links: [
      ProjectLink('Play Store', 'https://play.google.com/store/apps/details?id=com.ibbl.cellfin&pcampaignid=web_share', Icons.shop),
    ],
  ),

  Project(
    title: 'MyPrime',
    company: 'Prime Bank PLC',
    description: 'Internet Banking System',
    tech: 'Native',
    imageUrl: 'assets/images/prime_bank.png',
    isPlayStore: true,
    links: [
      ProjectLink('Play Store', 'https://play.google.com/store/apps/details?id=bd.com.primebank.pib.altitudemobile&pcampaignid=web_share', Icons.shop),
    ],
  ),

  Project(
    title: 'ONE Bank App',
    company: 'ONE Bank PLC',
    description: 'Internet Banking System',
    tech: 'Native',
    imageUrl: 'assets/images/one_bank.jpg',
    isPlayStore: true,
    links: [
      ProjectLink('Play Store', 'https://play.google.com/store/apps/details?id=com.cibl.obl&pcampaignid=web_share', Icons.shop),
    ],
  ),


  Project(
    title: 'mCash',
    company: 'Islami Bank Bangladesh PLC',
    description: 'Mobile Banking',
    tech: 'Native',
    imageUrl: 'assets/images/mcash.png',
    isPlayStore: true,
    links: [
      ProjectLink('Play Store', 'https://play.google.com/store/apps/details?id=com.ibbl.mcashcustomer&pcampaignid=web_share', Icons.shop),
    ],
  ),

  Project(
    title: 'NRBC PLANET',
    company: 'NRBC Bank PLC',
    description: 'internet Banking System',
    tech: 'Native',
    imageUrl: 'assets/images/nrbc.png',
    isPlayStore: true,
    links: [
      ProjectLink('Play Store', 'https://play.google.com/store/apps/details?id=com.cibl.plannet&pcampaignid=web_share', Icons.shop),
    ],
  ),

  Project(
    title: 'i-Banking',
    company: 'Meghna Bank PLC',
    description: 'internet Banking System',
    tech: 'Native',
    imageUrl: 'assets/images/megna_bank.png',
    isPlayStore: true,
    links: [
      ProjectLink('Play Store', 'https://play.google.com/store/apps/details?id=com.cibl.meghnabankltd&pcampaignid=web_share', Icons.shop),
    ],
  ),

  Project(
    title: '10 Minute School',
    company: 'Robi 10 Minute School',
    description:
    'Large-scale EdTech app with live classes and learning content.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/32/10minutesschool.png',
    tech: 'Native',
    isPlayStore: true,
    links: [
      ProjectLink(
        'Play Store',
        'https://play.google.com/store/apps/details?id=com.a10minuteschool.tenminuteschool&pcampaignid=web_share',
        Icons.shop,
      ),
    ],
  ),
];
