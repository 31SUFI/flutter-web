import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimatedSection extends StatefulWidget {
  final Widget child;
  final bool fadeIn;
  final bool slideIn;

  const AnimatedSection({
    super.key,
    required this.child,
    this.fadeIn = true,
    this.slideIn = true,
  });

  @override
  State<AnimatedSection> createState() => _AnimatedSectionState();
}

class _AnimatedSectionState extends State<AnimatedSection> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !isVisible) {
          setState(() {
            isVisible = true;
          });
        }
      },
      child: widget.child
          .animate(target: isVisible ? 1 : 0)
          .fadeIn(duration: const Duration(milliseconds: 800))
          .slideY(begin: 0.2, end: 0),
    );
  }
}
