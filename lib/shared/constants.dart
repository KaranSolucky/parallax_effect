import 'dart:ui';

class Constants {
  static Offset svgLayersOffset = const Offset(0, -134);
  static Offset svgBackgroundIconsOffset = const Offset(0, 914);
  static Offset svgLayer2IconsOffset = const Offset(0, 126);
  static Offset svgLayer3IconsOffset = const Offset(0, 592);
}

class GallaxColors {
  static Color text = const Color.fromARGB(255, 65, 62, 62);
  static Color headerText = const Color.fromARGB(255, 36, 36, 36);
  static Color textRed = const Color(0xffe9161d);
  static Color red = const Color(0xffEA2027);
  static Color backgroundRed = const Color(0xff2f0406);
  static Color red2 = const Color(0xffe9161d);
  static Color red3 = const Color(0xfff37279);
}

List<Map<String, String>> planetsList = [
  {
    'name': 'Venus',
    'description': 'Venus is the second planet',
    'img': 'assets/svg/venus.svg'
  },
  {
    'name': 'Earth',
    'description': 'Earth is the third planet',
    'img': 'assets/svg/sick_earth.svg'
  },
  {
    'name': 'Neptune',
    'description': 'Neptune is the eighth planet',
    'img': 'assets/svg/neptune.svg'
  },
];
