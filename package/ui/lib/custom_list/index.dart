import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final String asset;
  final String name;
  final String? subtitle;
  final double width;
  final bool showSubtitle;

  const CustomTile({
    super.key,
    required this.asset,
    required this.name,
    this.subtitle,
    required this.width,
    this.showSubtitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(8),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Image.asset(asset, filterQuality: FilterQuality.high),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          if (showSubtitle && subtitle != null) ...[
            const SizedBox(height: 6),
            Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.white70, height: 1.4),
            ),
          ],
        ],
      ),
    );
  }
}
