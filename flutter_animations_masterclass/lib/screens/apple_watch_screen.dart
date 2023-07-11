import 'dart:math';

import 'package:flutter/material.dart';

class AppleWatchScreen extends StatefulWidget {
  const AppleWatchScreen({Key? key}) : super(key: key);

  @override
  State<AppleWatchScreen> createState() => _AppleWatchScreenState();
}

class _AppleWatchScreenState extends State<AppleWatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text('Apple Watch'),
      ),
      body: Center(
        child: CustomPaint(
          painter: AppleWatchPaintr(),
          size: Size(300, 300),
        ),
      ),
    );
  }
}

class AppleWatchPaintr extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    Paint redCirclePaint = Paint()
      ..color = Colors.redAccent.shade200.withOpacity(0.5)
      ..strokeWidth = 25
      ..strokeJoin = StrokeJoin.bevel
      ..style = PaintingStyle.stroke;
    Paint redArcPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 25
      ..strokeJoin = StrokeJoin.bevel
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    Paint blueCirclePaint = Paint()
      ..color = Colors.blueAccent.shade200.withOpacity(0.5)
      ..strokeWidth = 25
      ..strokeJoin = StrokeJoin.bevel
      ..style = PaintingStyle.stroke;
    Paint blueArcPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 25
      ..strokeJoin = StrokeJoin.bevel
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    Paint greenCirclePaint = Paint()
      ..color = Colors.greenAccent.shade200.withOpacity(0.5)
      ..strokeWidth = 25
      ..strokeJoin = StrokeJoin.bevel
      ..style = PaintingStyle.stroke;
    Paint greenArcPaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 25
      ..strokeJoin = StrokeJoin.bevel
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2,
        redCirclePaint);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2),
        (size.width / 2) * 0.8, blueCirclePaint);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2),
        (size.width / 2) * 0.6, greenCirclePaint);

    canvas.drawArc(rect, 3 * pi / 2, pi, false, redArcPaint);
    canvas.drawArc(rect, 3 * pi / 2, pi, false, blueArcPaint);
    canvas.drawArc(rect, 3 * pi / 2, pi, false, greenArcPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return true;
  }
}
