import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gallax/shared/constants.dart';

Widget buildParallaxGalaxySubScreen({required ScrollController? controller}) {
  WidgetsBinding.instance.addPostFrameCallback(
    (_) => controller!.animateTo(
      -10,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    ),
  );
  // if (controller!.hasClients) {
  //   controller.animateTo(
  //     1000,
  //     duration: const Duration(milliseconds: 1000),
  //     curve: Curves.ease,
  //   );
  // }
  return Column(
    mainAxisSize: MainAxisSize.max,
    children: [
      const SizedBox(height: 200),
      // const SizedBox(height: 40),
      // Padding(
      //   padding: const EdgeInsets.only(right: 20.0),
      //   child: Align(
      //     alignment: AlignmentDirectional.centerEnd,
      //     child: SvgPicture.asset(
      //       'assets/svg/planets.svg',
      //       width: 120,
      //     ),
      //   ),
      // ),
      // const SizedBox(height: 40),
      Text(
        'Lots. For little'.toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "NunitoBold",
          color: GallaxColors.textRed,
          fontSize: 19,
          fontWeight: FontWeight.w900,
        ),
      ),
      const SizedBox(height: 22),
      // Container(
      //   height: 100.0,
      //   child: Row(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       SvgPicture.asset('assets/svg/meteor.svg',width: 100.0),
      //       const SizedBox(width: 10),
      //       Text(
      //         'Parallax \nGalaxy',
      //         textAlign: TextAlign.center,
      //         style: TextStyle(
      //           fontFamily: 'Poppins',
      //           color: GallaxColors.headerText,
      //           fontSize: 60,
      //           fontWeight: FontWeight.w800,
      //           height: .9,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      Text(
        'Parallax \nGalaxy',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Poppins',
          color: GallaxColors.headerText,
          fontSize: 60,
          fontWeight: FontWeight.w800,
          height: .9,
        ),
      ),
      const SizedBox(height: 20),
      SizedBox(
        width: 150,
        height: 5,
        child: Container(
          decoration: BoxDecoration(
            color: GallaxColors.red,
            borderRadius: const BorderRadius.all(Radius.circular(2.0)),
          ),
        ),
      ),
      const SizedBox(height: 25),
      Text(
        'Location matters as much as \nyour house, we focus on the \nwhole experience of real estate.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: GallaxColors.text,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
      ),
      const SizedBox(height: 10),
      TextButton(
        onPressed: () {
          controller!.animateTo(
            1540,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.ease,
          );
        },
        child: Text(
          'Show more',
          style: TextStyle(
            color: GallaxColors.red,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            height: 1.2,
          ),
        ),
      ),
      const SizedBox(height: 330),
      _buildExteriorInfoSection(),
      const SizedBox(height: 370),
    ],
  );
}

Widget _buildExteriorInfoSection() => Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Earth is\nmoving on',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: "Poppins",
                color: GallaxColors.headerText,
                fontSize: 28,
                fontWeight: FontWeight.w800,
                height: 1,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Hurry up,\nget yourself\nanother home.',
                  style: TextStyle(
                    color: GallaxColors.text,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SvgPicture.asset(
                  'assets/svg/sick_earth.svg',
                  width: 80.0,
                ),
              ],
            ),
            // Text(
            //   'Hurry up, \nget yourself \nanother home.',
            //   style: TextStyle(
            //     color: GallaxColors.text,
            //     fontSize: 20,
            //     fontWeight: FontWeight.w500,
            //     height: 1.2,
            //   ),
            // ),
          ],
        ),
      ),
    );
