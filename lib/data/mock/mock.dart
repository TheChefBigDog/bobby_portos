import 'package:bobby_portfolio/constant/app_asset.dart';
import 'package:bobby_portfolio/data/model/company/model.dart';
import 'package:bobby_portfolio/data/model/social_link/model.dart';
import 'package:bobby_portfolio/data/model/tech/model.dart';

const companies = <Company>[
  Company(
    name: 'PT. Sarana Mobile Sentosa',
    subtitle: 'Building Indonesia Society 5.0',
    asset: AppAssets.mobilecomIcon,
  ),
  Company(
    name: 'PT. Sinarmas Multifinance',
    subtitle: 'Multifinance sinarmas',
    asset: AppAssets.sinarmasIcon,
  ),
];

const techStack = <Tech>[
  Tech(name: 'Java', asset: AppAssets.javaIcon),
  Tech(name: 'Dart', asset: AppAssets.dartIcon),
  Tech(name: 'React Native', asset: AppAssets.reactNativeIcon),
];

const socialLinks = <SocialLink>[
  SocialLink(label: 'WhatsApp', url: 'https://wa.me/62859211150899', asset: AppAssets.whatsappIcon),
  SocialLink(label: 'GitHub', url: 'https://github.com/TheChefBigDog', asset: AppAssets.githubIcon),
  // SocialLink(
  //   label: 'LinkedIn',
  //   url: 'https://www.linkedin.com/in/bobby-ryan-hartono',
  //   asset: AppAssets.linkedinIcon,
  // ),
];
