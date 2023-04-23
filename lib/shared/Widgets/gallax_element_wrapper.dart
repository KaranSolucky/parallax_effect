import 'package:flutter/material.dart';
import 'package:gallax/shared/Widgets/gallax_element.dart';

Widget getGallaxElementWrapper({
  required GallaxElement child,
  required Stream<double>? scrollPositionStream,
}) => StreamBuilder<double>(
  stream: scrollPositionStream,
  builder: (context, snapshot) => Positioned(
    top: -1 * (snapshot.data ?? 0.0),
    child: child,
  ),
);