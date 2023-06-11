import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(0.5 % 360);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: CardWidget(),
      ),
    );
  }
}

class CardWidget extends StatefulWidget {
  const CardWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  bool isFront = true;
  double horizontalDrag = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (details) {
        // controller.reset();

        setState(() {
          // isFront = true;
          // horizontalDrag = 0;
        });
      },
      onHorizontalDragUpdate: (details) {
        print('클릭2');
        print('test : ${0 % 360}');
        setState(() {
          horizontalDrag -= details.delta.dx;
          horizontalDrag %= 360;
          print('details.delta.dx : ${details.delta.dx}');
          print('horizontalDrag : ${horizontalDrag}');

          setImageSide();
        });
      },
      onHorizontalDragEnd: (details) {
        print('클릭3');
        final double end = 360 - horizontalDrag >= 180 ? 0 : 360;

        animation =
            Tween<double>(begin: horizontalDrag, end: end).animate(controller)
              ..addListener(() {
                setState(() {
                  horizontalDrag = animation.value;
                  setImageSide();
                });
              });
        // controller.forward();
      },
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(horizontalDrag / 180 * pi),
        alignment: Alignment.center,
        child: Container(
          width: 100,
          height: 100,
          color: isFront ? Colors.red : Colors.blue,
        ),
      ),
    );
  }

  void setImageSide() {
    // print(verticalDrag);
    if (horizontalDrag <= 90 || horizontalDrag >= 270) {
      isFront = true;
    } else {
      isFront = false;
    }
  }
}
