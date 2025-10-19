class CompanyItem {
  final String name;
  final String subtitle;
  final String assetPath;
  final String? url;

  CompanyItem({
    required this.name,
    required this.subtitle,
    required this.assetPath,
    this.url,
  });
}
