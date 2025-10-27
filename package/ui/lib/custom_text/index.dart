import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class HeroText extends StatelessWidget {
  final TextStyle h1;
  final TextStyle roleBase;
  final bool isNarrow;
  final VoidCallback? url;

  const HeroText({
    super.key,
    required this.h1,
    required this.roleBase,
    required this.isNarrow,
    this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Hey, I'm Bobby Ryan.", style: h1),
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
        ],
      ),
    );
  }
}
