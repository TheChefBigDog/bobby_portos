import 'package:bobby_portfolio/constant/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BloodSection extends StatefulWidget {
  final VoidCallback? onDownPressed;

  const BloodSection({Key? key, this.onDownPressed}) : super(key: key);

  @override
  State<BloodSection> createState() => _BloodSectionState();
}

class _BloodSectionState extends State<BloodSection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 800), vsync: this)
      ..repeat(reverse: true);

    _bounceAnimation = Tween<double>(
      begin: 0,
      end: 12,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _openWhatsApp() async {
    final uri = Uri.parse('https://wa.me/62859211150899');
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;
    final screenW = MediaQuery.of(context).size.width;

    return SizedBox(
      width: double.infinity,
      height: screenH,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(color: Colors.black),
          Image.asset(AppAssets.bobbyAI, fit: BoxFit.contain, alignment: Alignment.centerRight),
          Positioned(
            top: screenH * 0.35,
            child: SizedBox(
              width: screenW * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Guilt can be a killer.',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [Shadow(blurRadius: 6, color: Colors.black54)],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '~Bobby Ryan Hartono, 2025',
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[900],
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      elevation: 6,
                    ),
                    onPressed: _openWhatsApp,
                    child: const Text(
                      'Contact Me',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: screenH * 0.110,
            left: 0,
            right: 0,
            child: Center(
              child: AnimatedBuilder(
                animation: _bounceAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, -_bounceAnimation.value),
                    child: IconButton(
                      onPressed: widget.onDownPressed,
                      icon: const Icon(Icons.keyboard_arrow_down, size: 48, color: Colors.red),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
