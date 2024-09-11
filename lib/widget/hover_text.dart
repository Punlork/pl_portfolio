import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class HoverText extends StatefulWidget {
  const HoverText({super.key, required this.text});

  final String text;

  @override
  State<HoverText> createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  bool _isHovered = false;
  int isAnimating = -1;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (_) {
        if (isAnimating == 0) {
          isAnimating = Random().nextInt(100) + 1;
          setState(() {});
        }
      },
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
              height: 1,
              letterSpacing: 15,
              fontWeight: FontWeight.w600,
              fontFamily: 'Horizon',
              color: _isHovered ? Colors.yellowAccent : null,
            ),
        child: AnimatedTextKit(
          key: ValueKey(isAnimating),
          animatedTexts: [
            TypewriterAnimatedText(
              widget.text,
              speed: const Duration(milliseconds: 500),
            ),
          ],
          onFinished: () {
            print("RUN");
            isAnimating = 0;
          },
          totalRepeatCount: 1000,
          repeatForever: false,
          isRepeatingAnimation: false,
        ),
      ),
    );
  }
}
