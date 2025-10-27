import 'package:bobby_portfolio/constant/app_asset.dart';
import 'package:bobby_portfolio_package/index.dart';
import 'package:flutter/material.dart';

class OnBoardingSection extends StatefulWidget {
  final VoidCallback? onDownPressed;
  final VoidCallback? openWhatsApp;

  const OnBoardingSection({super.key, this.onDownPressed, this.openWhatsApp});

  @override
  State<OnBoardingSection> createState() => _OnBoardingSectionState();
}

class _OnBoardingSectionState extends State<OnBoardingSection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;

  get openWhatsApp => null;

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isNarrow = size.width < 900;

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
                          HeroText(
                            h1: h1Style,
                            roleBase: h3Style,
                            isNarrow: isNarrow,
                            url: () => openWhatsApp(),
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
                              child: HeroText(
                                h1: h1Style,
                                roleBase: h3Style,
                                isNarrow: isNarrow,
                                url: () => openWhatsApp(),
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
