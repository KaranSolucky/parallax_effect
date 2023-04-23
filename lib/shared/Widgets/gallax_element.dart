import 'package:flutter/material.dart';

class GallaxElement extends StatelessWidget {
  const GallaxElement({
    Key? key,
    this.scrollDuration = const Duration(),
    required this.child,
  }) : super(key: key);

  final Duration scrollDuration;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
