import 'package:flutter/material.dart';
import 'package:gallax/shared/components.dart';
import '../../shared/constants.dart';

Widget buildBenefitsSubScreen({required ScrollController? controller}) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 200.0),
        Text('All inclusive estate'.toUpperCase(),
            style: TextStyle(
              fontFamily: "NunitoBold",
              color: GallaxColors.textRed,
              fontSize: 19,
              fontWeight: FontWeight.w900,
            )),
        const SizedBox(height: 22),
        Text(
          'Benefits',
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
          'Get the most out of your buck,\nwe know the best spots.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: GallaxColors.text,
            fontSize: 25,
            fontWeight: FontWeight.w600,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 50),
        Text(
          'We don\'t just find prime quality \nfor affordable prices, we also find\n the right community for you.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: GallaxColors.text,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 45),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            createSvgLabel(
              height: 10.0,
              width: 90.0,
              assetName: 'assets/svg/venus.svg',
              label: 'Hot \nVenus',
            ),
            createSvgLabel(
              height: 10.0,
              width: 90.0,
              assetName: 'assets/svg/neptune.svg',
              label: 'Cold \nNeptune',
            ),
            createSvgLabel(
              height: 10.0,
              width: 90.0,
              assetName: 'assets/svg/planets.svg',
              label: 'Many \nmore',
            ),
          ],
        ),
        const SizedBox(height: 90),
        Align(
          alignment: const Alignment(.8, 0.0),
          child: drawGallaxButton(
            text: 'Get in touch',
            minWidth: 200.0,
            onPressed: () {
              controller!.animateTo(
                0,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.ease,
              );
            },
          ),
        ),
        const SizedBox(height: 200),
      ],
    );
