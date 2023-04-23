import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'gallax_element.dart';
import 'gallax_element_wrapper.dart';

class GallaxScroll extends StatefulWidget {
  const GallaxScroll({
    Key? key,
    this.children = const [],
    this.backgroundChildren = const [],
    this.foregroundChildren = const [],
    this.controller,
    this.physics,
  }) : super(key: key);

  final List<Widget> children;
  final List<GallaxElement> backgroundChildren;
  final List<GallaxElement> foregroundChildren;
  final ScrollController? controller;
  final ScrollPhysics? physics;

  @override
  State<GallaxScroll> createState() => _GallaxScrollState();
}

class _GallaxScrollState extends State<GallaxScroll> {
  final _scrollSubject = BehaviorSubject<double>();
  final Map<Duration, Stream<double>> _scrollStream = {};

  @override
  void dispose() {
    _scrollSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ..._buildGallaxElements(widget.backgroundChildren),
        NotificationListener<ScrollNotification>(
          onNotification: _onScrollUpdate,
          child: SingleChildScrollView(
            controller: widget.controller,
            physics: widget.physics,
            child: Column(
              children: widget.children,
            ),
          ),
        ),
        ..._buildGallaxElements(widget.foregroundChildren),
      ],
    );
  }

  List _buildGallaxElements(List<GallaxElement> elements) {
    List elementsList = [];
    for (var element in elements) {
      elementsList.add(
        getGallaxElementWrapper(
          scrollPositionStream: _getDelayedScrollStream(
            element.scrollDuration,
          ),
          child: element,
        ),
      );
    }

    return elementsList;
  }

  Stream<double>? _getDelayedScrollStream(Duration duration) {
    if (!_scrollStream.containsKey(duration)) {
      _generateScrollStream(duration);
    }
    return _scrollStream[duration];
  }

  void _generateScrollStream(Duration duration) {
    _scrollStream.putIfAbsent(duration, () => _scrollSubject.delay(duration));
  }

  bool _onScrollUpdate(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      _scrollSubject.add(notification.metrics.pixels);
    }
    return true;
  }
}
