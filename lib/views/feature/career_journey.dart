import 'package:bobby_portfolio/data/mock/mock.dart';
import 'package:bobby_portfolio_package/custom_list/index.dart';
import 'package:flutter/material.dart';

class CareerJourneySection extends StatelessWidget {
  const CareerJourneySection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final horizontalPadding = screenW * 0.1;
    final isNarrow = screenW < 600;
    final tileWidth = isNarrow ? (screenW - horizontalPadding * 2) : (screenW * 0.25);

    return Container(
      width: double.infinity,
      color: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Career Journey',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.redAccent),
          ),
          const SizedBox(height: 12),
          const Text(
            "The skill set that I have acquired and learnt was actually from the work experience I got.\n"
            "Below here, you may see my work experience:",
            style: TextStyle(fontSize: 18, color: Colors.white70, height: 1.5),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Current Work Experience',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.redAccent),
            ),
          ),
          const SizedBox(height: 40),

          Center(
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: companies
                  .map(
                    (c) => CustomTile(
                      asset: c.asset,
                      name: c.name,
                      subtitle: c.subtitle,
                      width: tileWidth,
                      showSubtitle: true,
                    ),
                  )
                  .toList(growable: false),
            ),
          ),

          const SizedBox(height: 60),
          const Center(
            child: Text(
              'Tech Stack',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.redAccent),
            ),
          ),
          const SizedBox(height: 24),

          Center(
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: techStack
                  .map((t) => CustomTile(asset: t.asset, name: t.name, width: tileWidth))
                  .toList(growable: false),
            ),
          ),
        ],
      ),
    );
  }
}
