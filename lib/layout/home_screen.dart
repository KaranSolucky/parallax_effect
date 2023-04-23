import 'package:flutter/material.dart';
import 'package:gallax/shared/Widgets/gallax_scroll.dart';
import 'package:gallax/shared/Widgets/gallax_svg_background.dart';
import 'package:gallax/shared/constants.dart';

import '../modules/benefits/benefits_subscreen.dart';
import '../modules/parallax_gallaxy/parallax_galaxy_subscreen.dart';
import '../shared/Widgets/gallax_element.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController controller = ScrollController();
  bool _disable3D = true;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: GallaxColors.backgroundRed,
        child: GallaxScroll(
          controller: controller,
          physics: const ClampingScrollPhysics(),
          backgroundChildren: _buildGallaxElements(),
          foregroundChildren: [
            GallaxElement(
              child: _buildEffectToggle(),
            ),
          ],
          children: [
            buildParallaxGalaxySubScreen(controller: controller),
            buildBenefitsSubScreen(controller: controller),
          ],
        ),
      ),
    );
  }

  List<GallaxElement> _buildGallaxElements() => [
        GallaxElement(
          scrollDuration: const Duration(milliseconds: 230),
          child: GallaxSvgBackground(
            disableDeepEffect: _disable3D,
            settings: GallaxBackgroundSettings.predefined(),
            svgAssetName: 'assets/svg/layer3.svg',
            translationOffset: Constants.svgLayersOffset,
          ),
        ),
        GallaxElement(
          scrollDuration: const Duration(milliseconds: 150),
          child: GallaxSvgBackground(
            disableDeepEffect: _disable3D,
            settings: GallaxBackgroundSettings.predefined(),
            svgAssetName: 'assets/svg/layer2.svg',
            translationOffset: Constants.svgLayersOffset,
          ),
        ),
        GallaxElement(
          scrollDuration: const Duration(milliseconds: 40),
          child: GallaxSvgBackground(
            disableDeepEffect: _disable3D,
            settings: GallaxBackgroundSettings.predefined(),
            svgAssetName: 'assets/svg/layer1.svg',
            translationOffset: Constants.svgLayersOffset,
          ),
        ),
      ];

  Widget _buildEffectToggle() => IconButton(
        icon: Icon(
          !_disable3D ? Icons.blur_off : Icons.blur_on,
          color: GallaxColors.red3,
          size: 30,
        ),
        tooltip: 'On/Off 3D effect',
        onPressed: () {
          setState(() => _disable3D = !_disable3D);
        },
      );
}
