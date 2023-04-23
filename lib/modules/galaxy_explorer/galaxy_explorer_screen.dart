import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gallax/shared/components.dart';
import 'package:gallax/shared/constants.dart';

class GalaxyExplorer extends StatefulWidget {
  const GalaxyExplorer({Key? key}) : super(key: key);

  @override
  State<GalaxyExplorer> createState() => _GalaxyExplorerState();
}

class _GalaxyExplorerState extends State<GalaxyExplorer> {
  ScrollController controller = ScrollController();
  late Size size;
  late double itemWidth;
  int currIndex = 0;

  @override
  void initState() {
    super.initState();
    // controller.addListener(() {
    //   setState(() {
    //     print(controller.offset);
    //     if (controller.offset % (size.width) == (2 * size.width / 3) &&
    //         controller.offset <= 3 * (2 * size.width / 3)) {
    //       controller.animateTo(
    //         controller.offset + 274,
    //         duration: const Duration(milliseconds: 200),
    //         curve: Curves.ease,
    //       );
    //     }
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    this.size = size;
    itemWidth = 2 * size.width / 3;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1A71B8),
              Color(0xFF2D1C6A),
            ],
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: size.height / 10),
            const Text(
              'Galaxy Explorer',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 60,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: size.height / 20),
            SizedBox(
              height: 3 * size.height / 5,
              child: NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  // final ScrollDirection direction = notification.direction;
                  // if (direction == ScrollDirection.reverse && currIndex != 4) {
                  //   _animateToIndex(++currIndex);
                  // } else if (direction == ScrollDirection.forward &&
                  //     currIndex != 0) {
                  //   _animateToIndex(--currIndex);
                  // }
                  // print('Scroll direction is $direction');
                  return true;
                },
                child: ListView.builder(
                  controller: controller,
                  itemBuilder: (context, index) => Align(
                    // widthFactor: 0.7,
                    child: buildTaskItem(
                      context,
                      size.width,
                      index,
                    ),
                  ),
                  itemCount: planetsList.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void _animateToIndex(int index) {
  //   if (index == 1) {
  //     controller.animateTo(
  //       index * (itemWidth) - 10,
  //       duration: const Duration(milliseconds: 500),
  //       curve: Curves.ease,
  //     );
  //   } else {
  //     controller.animateTo(
  //       index * (itemWidth + 40),
  //       duration: const Duration(milliseconds: 500),
  //       curve: Curves.ease,
  //     );
  //   }
  // }
}
