import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiver/core.dart' as quiver;

class GallaxSvgBackground extends StatefulWidget {
  const GallaxSvgBackground({
    required this.svgAssetName,
    this.disableDeepEffect = false,
    this.disableShadow = false,
    this.translationOffset = Offset.zero,
    this.settings,
    this.autoXScale = false,
    this.autoYScale = false,
    Key? key,
  }) : super(key: key);

  final bool disableDeepEffect;
  final bool disableShadow;
  final String svgAssetName;
  final Offset translationOffset;
  final GallaxBackgroundSettings? settings;
  final bool autoXScale;
  final bool autoYScale;

  @override
  State<GallaxSvgBackground> createState() => _GallaxSvgBackgroundState();
}

class _GallaxSvgBackgroundState extends State<GallaxSvgBackground> {
  GallaxBackgroundSettings get settings =>
      widget.settings ?? _predefinedSettings;
  bool _needsRepaint = false;
  final GallaxBackgroundSettings _predefinedSettings =
      GallaxBackgroundSettings.predefined();

  @override
  void didUpdateWidget(GallaxSvgBackground oldWidget) {
    super.didUpdateWidget(oldWidget);
    _needsRepaint = widget.disableDeepEffect != oldWidget.disableDeepEffect ||
        widget.disableShadow != oldWidget.disableShadow ||
        widget.svgAssetName != oldWidget.svgAssetName ||
        oldWidget.settings != settings;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadSvg(),
      builder: (context, AsyncSnapshot<DrawableRoot> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Container();
        }

        Widget result = RepaintBoundary(
          child: CustomPaint(
            isComplex: true,
            willChange: false,
            painter: _GallaxBackgroundPainter(
              drawableRoot: snapshot.data,
              translationOffset: widget.translationOffset,
              disableDeepEffect: widget.disableDeepEffect,
              disableShadow: widget.disableShadow,
              settings: widget.settings,
              needsRepaint: _needsRepaint,
              autoXScale: widget.autoXScale,
              autoYScale: widget.autoYScale,
              screenSize: MediaQuery.of(context).size,
            ),
          ),
        );

        if (_needsRepaint == true) {
          WidgetsBinding.instance.addPostFrameCallback(
                  (_) => setState(() => _needsRepaint = false));
        }
        return result;
      },
    );
  }

  Future<DrawableRoot> _loadSvg() => DefaultAssetBundle.of(context)
      .loadString(widget.svgAssetName)
      .then<DrawableRoot>((svgName) => svg.fromSvgString(svgName, svgName));
}

class GallaxBackgroundSettings {
  const GallaxBackgroundSettings({
    this.deepEffectMatrix,
    this.shadowSigma = 0.0,
    this.shadowColor = Colors.transparent,
  });

  final Float64List? deepEffectMatrix;
  final double shadowSigma;
  final Color shadowColor;

  static GallaxBackgroundSettings predefined() => GallaxBackgroundSettings(
        deepEffectMatrix: (Matrix4.identity()
              ..scale(1.02, 1.01)
              ..translate(-9.0, 2))
            .storage,
        shadowColor: const Color.fromARGB(110, 0, 0, 0),
        shadowSigma: 12,
      );

  @override
  bool operator ==(Object other) =>
      (other is GallaxBackgroundSettings) &&
      deepEffectMatrix == other.deepEffectMatrix &&
      shadowSigma == other.shadowSigma &&
      shadowColor == other.shadowColor;

  @override
  int get hashCode => quiver.hash3(
      deepEffectMatrix.hashCode, shadowColor.hashCode, shadowSigma.hashCode);
}

class _GallaxBackgroundPainter extends CustomPainter {
  const _GallaxBackgroundPainter({
    this.disableDeepEffect,
    this.disableShadow,
    this.needsRepaint,
    this.drawableRoot,
    this.translationOffset,
    this.settings,
    this.autoXScale,
    this.autoYScale,
    this.screenSize,
  });

  final bool? disableDeepEffect;
  final bool? disableShadow;
  final bool? needsRepaint;
  final DrawableRoot? drawableRoot;
  final Offset? translationOffset;
  final GallaxBackgroundSettings? settings;
  final bool? autoXScale;
  final bool? autoYScale;
  final Size? screenSize;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    if (translationOffset != null) {
      canvas.translate(translationOffset!.dx, translationOffset!.dy);
    }

    double scaleXFactor = 1;
    double scaleYFactor = 1;

    if (autoXScale == true) {
      scaleXFactor = screenSize!.width / drawableRoot!.viewport.width;
    }
    if (autoYScale == true) {
      scaleYFactor = screenSize!.height / drawableRoot!.viewport.height;
    }

    canvas.scale(scaleXFactor, scaleYFactor);

    drawableRoot!.clipCanvasToViewBox(canvas);
    _drawPath(canvas, drawableRoot!);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  _drawPath(Canvas canvas, DrawableRoot drawable) {
    Float64List deepEffectMatrix =
        settings?.deepEffectMatrix ?? Matrix4.identity().storage;

    // Draw shadow
    if (disableShadow != true) {
      var shadowDrawable = drawable.mergeStyle(
        DrawableStyle(
          fill: DrawablePaint(
            PaintingStyle.fill,
            color: settings!.shadowColor,
            maskFilter:
            MaskFilter.blur(BlurStyle.normal, settings!.shadowSigma),
          ),
        ),
      );

      canvas.save();

      canvas.transform(deepEffectMatrix);
      shadowDrawable.draw(canvas, Rect.zero);

      canvas.restore();
    }

    if (disableDeepEffect != true) {
      var deepDrawable = drawable.mergeStyle(
        const DrawableStyle(
          fill: DrawablePaint(
            PaintingStyle.fill,
            color: Color.fromARGB(40, 0, 0, 0),
          ),
        ),
      );

      canvas.save();

      canvas.transform(deepEffectMatrix);
      drawable.draw(canvas, Rect.zero);
      deepDrawable.draw(canvas, Rect.zero);

      canvas.restore();
    }

    drawable.draw(canvas, Rect.zero);
  }
}
