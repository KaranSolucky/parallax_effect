import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constants.dart';

Widget createSvgLabel({
  required assetName,
  required label,
  required width,
  required height,
}) =>
    Column(
      children: [
        SvgPicture.asset(
          assetName,
          width: width,
        ),
        SizedBox(height: height),
        Text(
          label.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'NunitoBold',
            color: GallaxColors.textRed,
            fontSize: 17,
            fontWeight: FontWeight.w700,
            height: .9,
          ),
        ),
      ],
    );

Widget drawGallaxButton({
  required text,
  required onPressed,
  minWidth = 135.0,
  height = 62.0,
}) =>
    ButtonTheme(
      minWidth: minWidth,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 20.0,
            ),
            backgroundColor: GallaxColors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            elevation: 0,
            textStyle: const TextStyle(color: Colors.white)),
        onPressed: onPressed,
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );

Widget buildTaskItem(context, width, index) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            alignment: AlignmentDirectional.center,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            width: 1 * width / 2,
            // padding: const EdgeInsets.all(20.0),
            // child: Text(
            //   (index + 1).toString(),
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     fontFamily: 'Poppins',
            //     fontSize: 200.0,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.grey[200],
            //   ),
            // ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
            ),
            width: 1 * width / 2,
            height: 2 * width / 3,
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Text(
                (index + 1).toString(),
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 150.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[200],
                ),
              ),
            ),
          ),
          Text(
            '${planetsList[index]['name']}',
            style: const TextStyle(
              fontFamily: 'NunitoBold',
              fontWeight: FontWeight.bold,
              fontSize: 40.0,
              color: Color(0xFF2D1C6A),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: SvgPicture.asset(
              planetsList[index]['img']!,
              width: 150.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: drawGallaxButton(text: 'View', onPressed: () {}),
            ),
          ),
        ],
      ),
    );
