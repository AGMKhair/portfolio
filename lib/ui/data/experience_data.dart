import 'package:portfolio/core/models/experience.dart';

final List<Experience> experiences = [
  Experience(
    company: 'Red Technologies Ltd',
    role: 'Senior Associate Software Engineer – Mobile App (FinTech)',
    duration: 'Nov 2025 – Present',
    location: 'Dhaka, Bangladesh',
    isCurrent: true,
    responsibilities: [
      'Develop and maintain enterprise Flutter applications for banking and enterprise customers using Clean Architecture and MVVM.',
      'Deliver production-ready payment modules used by thousands of banking customers.',
      'Integrate Firebase Authentication, Firestore, Cloud Messaging (FCM), Crashlytics, Analytics, and Remote Config.',
      'Optimize application performance, reducing app startup time and improving overall user experience.',
      'Perform code reviews, mentor junior developers, and collaborate with cross-functional teams using Agile methodologies.',
      'Manage production releases for Google Play Store and Apple App Store.',
    ],
    achievements: [
      'Delivered REDCUBE BUSINESS ERP & Payment Modules used by thousands of SMEs.',
      'Architected robust Riverpod & GetX state management structures for enterprise mobile apps.',
    ],
    technologies: [
      'Flutter', 'Dart', 'Java', 'Kotlin', 'Firebase', 'Riverpod', 'GetX', 'Provider', 'Clean Architecture', 'MVVM',
    ],
  ),
  Experience(
    company: 'Islami Bank Bangladesh PLC',
    role: 'Software Engineer – Full Stack Developer (Bank)',
    duration: 'May 2022 – Oct 2025',
    location: 'Dhaka, Bangladesh',
    isCurrent: false,
    responsibilities: [
      'Developed and maintained enterprise Flutter applications used in production by banking customers.',
      'Designed and implemented secure REST APIs and backend microservices using Spring Boot.',
      'Implemented Fund Transfer, RTGS, NPSB, Binimoy, QR Payment, Utility Bill Payment, Merchant Banking, and Digital Banking services.',
      'Integrated Payment Gateway solutions following enterprise banking security standards.',
      'Maintained Oracle database systems, optimized SQL queries, and participated in production deployments.',
      'Prepared technical documentation, reviewed code, and collaborated with QA teams to ensure software quality.',
    ],
    achievements: [
      'Engineered core banking modules for CellFin Digital Banking Platform & Agent Banking Merchant Application.',
      'Integrated national interoperable payment systems (RTGS, NPSB, Binimoy) following Bangladesh Bank compliance.',
    ],
    technologies: [
      'Flutter', 'Java', 'Spring Boot', 'Oracle Database', 'REST APIs', 'Spring Security', 'Microservices',
    ],
  ),
  Experience(
    company: 'CIBL Technology Consultants Ltd',
    role: 'Mobile App Developer (Banking Solutions)',
    duration: 'Jan 2021 – Apr 2022',
    location: 'Dhaka, Bangladesh',
    isCurrent: false,
    responsibilities: [
      'Developed secure mobile banking applications for Prime Bank PLC, Meghna Bank PLC, ONE Bank PLC, and NRBC Bank PLC.',
      'Integrated banking APIs and implemented secure authentication workflows.',
      'Collaborated with banking clients to deliver production-ready mobile applications.',
      'Participated in code reviews, debugging, testing, and production deployment.',
    ],
    achievements: [
      'Successfully built and delivered i-Banking mobile applications for 4 major commercial banks in Bangladesh.',
    ],
    technologies: [
      'Flutter', 'Java', 'Kotlin', 'REST APIs', 'Android SDK', 'Banking APIs',
    ],
  ),
  Experience(
    company: 'Robi 10 Minute School',
    role: 'Android Developer (EduTech)',
    duration: 'Oct 2019 – Dec 2020',
    location: 'Dhaka, Bangladesh',
    isCurrent: false,
    responsibilities: [
      'Developed and maintained Android application features using Java and Flutter.',
      'Integrated REST APIs and optimized application performance.',
      'Fixed production issues and improved application stability.',
      'Collaborated with backend and QA teams for feature delivery.',
    ],
    achievements: [
      'Contributed to the development and maintenance of high-traffic EdTech mobile application serving 1M+ active users.',
    ],
    technologies: [
      'Java', 'Flutter', 'Android SDK', 'REST APIs', 'Firebase',
    ],
  ),
];
