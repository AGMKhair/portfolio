import 'package:flutter/material.dart';
import 'package:portfolio/core/models/project.dart';


final clientProjects = [
  Project(
    title: 'প্রতিদিনের দ্বীনের সাথী',
    company: 'SponT IT',
    description:
    'An Islamic lifestyle application providing daily religious guidance and essential Islamic resources for everyday life.',
    imageUrl: 'assets/images/islamic.png',
    tech: 'Flutter • SQLite',
    isPlayStore: true,
    links: [
      ProjectLink(
        'Play Store',
        'https://play.google.com/store/apps/details?id=com.agmkhair.spontit.protidinerddinersathi&pcampaignid=web_share',
        Icons.shop,
      ),
    ],
  ),

  Project(
    title: 'BD Bazar',
    company: 'SponT IT',
    description:
    'A full-featured e-commerce mobile application enabling users to browse products, manage carts, and place online orders.',
    imageUrl: 'assets/images/bd_bazar.png',
    tech: 'Flutter',
    isPlayStore: true,
    links: [
      ProjectLink(
        'Play Store',
        'https://play.google.com/store/apps/details?id=com.bdbazare.userapp&pcampaignid=web_share',
        Icons.shop,
      ),
    ],
  ),


  Project(
    title: 'Fund Tracker',
    company: 'SponT IT',
    description:
    'This project helps financial freedom and tracking to solve the plan.',
    imageUrl: 'assets/images/fund.png',
    tech: 'Flutter',
    isPlayStore: true,
    links: [
      ProjectLink(
        'Play Store',
        'https://play.google.com/store/apps/details?id=com.agmkhair.carrental&pcampaignid=web_share',
        Icons.shop,
      ),
    ],
  ),



  Project(
    title: 'Car Rental',
    company: 'SponT IT',
    description:
    'Car Order Project',
    imageUrl: 'assets/images/car_rant.png',
    tech: 'Flutter',
    isPlayStore: true,
    links: [
      ProjectLink(
        'Play Store',
        'https://play.google.com/store/apps/details?id=com.agmkhair.carrental&pcampaignid=web_share',
        Icons.shop,
      ),
    ],
  ),


  Project(
    title: 'Pharmacy Management',
    company: 'SponT IT',
    description:
    'AponSeba Pharmacy Management',
    imageUrl: 'assets/images/pharmacy.png',
    tech: 'Flutter',
    isPlayStore: true,
    links: [
      ProjectLink(
        'Play Store',
        'https://play.google.com/store/apps/details?id=com.spontit.aponseba&pcampaignid=web_share',
        Icons.shop,
      ),
    ],
  ),



];