import 'package:bobby_portfolio_package/navbar/index.dart';
import 'package:flutter/material.dart';

class PortfolioHeader extends StatelessWidget {
  final double heightFraction;
  final String? logoAsset;

  const PortfolioHeader({super.key, this.heightFraction = 0.12, this.logoAsset});

  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;
    final headerH = screenH * heightFraction;
    final logoH = headerH * 1.5;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      elevation: 0,
      toolbarHeight: headerH,
      leadingWidth: logoH + 32,
      leading: Padding(
        padding: const EdgeInsets.only(left: 32),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxH = constraints.maxHeight;
            final logoSize = maxH * 0.7;

            return logoAsset != null
                ? Image.asset(logoAsset!, height: logoSize, width: logoSize, fit: BoxFit.contain)
                : const FlutterLogo();
          },
        ),
      ),
      flexibleSpace: const DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(color: Colors.black, offset: Offset(0, 4), blurRadius: 10, spreadRadius: 1),
          ],
        ),
      ),
      actions: [
        const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.only(right: 32),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              NavButton(title: "Showcase"),
              const SizedBox(width: 30),
              NavButton(title: "Contact Me"),
            ],
          ),
        ),
      ],
    );
  }
}
