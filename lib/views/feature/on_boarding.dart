import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bobby_portfolio/constant/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OnBoardingSection extends StatefulWidget {
  final VoidCallback? onDownPressed;

  const OnBoardingSection({super.key, this.onDownPressed});

  @override
  State<OnBoardingSection> createState() => _OnBoardingSectionState();
}

class _OnBoardingSectionState extends State<OnBoardingSection> with SingleTickerProviderStateMixin {
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
    final size = MediaQuery.of(context).size;
    final isNarrow = size.width < 900;

    final h1Style = TextStyle(
      fontFamily: 'Roboto',
      fontSize: isNarrow ? 28 : 36,
      fontWeight: FontWeight.w800,
      color: Colors.white,
      height: 1.2,
      shadows: const [Shadow(blurRadius: 6, color: Colors.black54)],
    );

    final roleBase = TextStyle(
      fontFamily: 'Roboto',
      fontSize: isNarrow ? 18 : 22,
      fontWeight: FontWeight.w700,
      height: 1.3,
    );

    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(color: Colors.black),

          Align(
            alignment: Alignment.centerRight,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                bottomLeft: Radius.circular(24),
              ),
              child: Image.asset(AppAssets.bobbyAI, height: size.height * 0.9, fit: BoxFit.cover),
            ),
          ),

          Positioned.fill(
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      Colors.black.withOpacity(0.55),
                      Colors.transparent,
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.35, 1.0],
                  ),
                ),
              ),
            ),
          ),

          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isNarrow ? 20 : 48),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: isNarrow
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _HeroText(
                            h1: h1Style,
                            roleBase: roleBase,
                            isNarrow: isNarrow,
                            openWhatsApp: _openWhatsApp,
                          ),
                          const SizedBox(height: 24),
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: _HeroText(
                                h1: h1Style,
                                roleBase: roleBase,
                                isNarrow: isNarrow,
                                openWhatsApp: _openWhatsApp,
                              ),
                            ),
                          ),
                          const Spacer(flex: 4),
                        ],
                      ),
              ),
            ),
          ),

          Positioned(
            bottom: size.height * 0.11,
            left: 0,
            right: 0,
            child: Center(
              child: AnimatedBuilder(
                animation: _bounceAnimation,
                builder: (context, _) => Transform.translate(
                  offset: Offset(0, -_bounceAnimation.value),
                  child: IconButton(
                    onPressed: widget.onDownPressed,
                    icon: const Icon(Icons.keyboard_arrow_down, size: 48, color: Colors.red),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroText extends StatelessWidget {
  const _HeroText({
    required this.h1,
    required this.roleBase,
    required this.isNarrow,
    required this.openWhatsApp,
  });

  final TextStyle h1;
  final TextStyle roleBase;
  final bool isNarrow;
  final Future<void> Function() openWhatsApp;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Hey, I'm Bobby Ryan Hartono.", style: h1),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text("I'm a ", style: roleBase.copyWith(color: Colors.white70)),
              DefaultTextStyle(
                style: roleBase.copyWith(color: Colors.red, decoration: TextDecoration.underline),
                child: AnimatedTextKit(
                  repeatForever: true,
                  pause: const Duration(milliseconds: 900),
                  animatedTexts: [
                    TyperAnimatedText(
                      'builder of digital experiences',
                      speed: Duration(milliseconds: 90),
                    ),
                    TyperAnimatedText('developer', speed: Duration(milliseconds: 90)),
                    TyperAnimatedText('tech explorer', speed: Duration(milliseconds: 90)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[900],
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 6,
                ),
                onPressed: openWhatsApp,
                child: const Text(
                  'Contact Me',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
