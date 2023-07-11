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
    Paint redCirclePaint = Paint()
      ..color = Colors.redAccent.shade200.withOpacity(0.5)
      ..strokeWidth = 25
      ..strokeJoin = StrokeJoin.bevel
      ..style = PaintingStyle.stroke;
    Paint blueCirclePaint = Paint()
      ..color = Colors.blueAccent.shade200.withOpacity(0.5)
      ..strokeWidth = 25
      ..strokeJoin = StrokeJoin.bevel
      ..style = PaintingStyle.stroke;
    Paint greenCirclePaint = Paint()
      ..color = Colors.greenAccent.shade200.withOpacity(0.5)
      ..strokeWidth = 25
      ..strokeJoin = StrokeJoin.bevel
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2,
        redCirclePaint);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2),
        (size.width / 2) * 0.8, blueCirclePaint);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2),
        (size.width / 2) * 0.6, greenCirclePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return true;
  }
}
