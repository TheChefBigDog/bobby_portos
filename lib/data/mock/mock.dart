import 'package:bobby_portfolio/constant/app_asset.dart';

class Company {
  final String name;
  final String? subtitle;
  final String asset;
  const Company({required this.name, this.subtitle, required this.asset});
}

class Tech {
  final String name;
  final String asset;
  const Tech({required this.name, required this.asset});
}

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
