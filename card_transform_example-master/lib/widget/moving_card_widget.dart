import 'dart:math';

import 'package:flutter/material.dart';

class MovingCardWidget extends StatefulWidget {
  final String urlFront;
  final String urlBack;

  const MovingCardWidget({
    @required this.urlFront,
    @required this.urlBack,
    Key key,
  }) : super(key: key);

  @override
  _MovingCardWidgetState createState() => _MovingCardWidgetState();
}

class _MovingCardWidgetState extends State<MovingCardWidget>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  bool isFront = true;
  double verticalDrag = 0;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onVerticalDragStart: (details) {
          print('클릭1');
          controller.reset();

          setState(() {
            isFront = isFront;
            verticalDrag = 0;
          });
        },
        onVerticalDragUpdate: (details) {
          print('클릭2');
          print('details : ${details.delta.dy}');
          setState(() {
            verticalDrag += details.delta.dy;
            verticalDrag %= 360;

            setImageSide();
          });
        },
        onVerticalDragEnd: (details) {
          print('클릭3');
          final double end = 360 - verticalDrag >= 180 ? 0 : 360;

          animation =
              Tween<double>(begin: verticalDrag, end: end).animate(controller)
                ..addListener(() {
                  setState(() {
                    verticalDrag = animation.value;
                    setImageSide();
                  });
                });
          controller.forward();
        },
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(verticalDrag / 180 * pi),
          alignment: Alignment.center,
          child: isFront
              ? Image.asset(widget.urlFront)
              : Transform(
                  transform: Matrix4.identity()..rotateX(pi),
                  alignment: Alignment.center,
                  child: Image.asset(widget.urlBack),
                ),
        ),
      );

  void setImageSide() {
    print('verticalDrag : ${verticalDrag}');
    if (verticalDrag <= 90 || verticalDrag >= 270) {
      isFront = true;
    } else {
      isFront = false;
    }
    // isFront = !isFront;
  }
}
