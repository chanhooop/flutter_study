import 'dart:math';

import 'package:flutter/material.dart';

class AppleWatchScreen extends StatefulWidget {
  const AppleWatchScreen({Key? key}) : super(key: key);

  @override
  State<AppleWatchScreen> createState() => _AppleWatchScreenState();
}

class _AppleWatchScreenState extends State<AppleWatchScreen>
    with SingleTickerProviderStateMixin {
  final random = Random();
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 2000),
  )..forward();

  late CurvedAnimation _curve =
      CurvedAnimation(parent: _animationController, curve: Curves.bounceInOut);
  final redEndNum = Random().nextDouble() * 2;
  late Animation<double> _redProgress;
  late Animation<double> _blueProgress;
  late Animation<double> _greenProgress;

  @override
  void initState() {
    super.initState();
    final redEndNum = random.nextDouble() * 2;
    final blueEndNum = random.nextDouble() * 2;
    final greenEndNum = random.nextDouble() * 2;
    _redProgress = Tween(begin: 0.005, end: redEndNum).animate(_curve);
    _blueProgress = Tween(begin: 0.005, end: blueEndNum).animate(_curve);
    _greenProgress = Tween(begin: 0.005, end: greenEndNum).animate(_curve);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

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
        child: AnimatedBuilder(
          builder: (context, snapshot) {
            return CustomPaint(
              painter: AppleWatchPaintr(progress: [
                _redProgress.value,
                _blueProgress.value,
                _greenProgress.value
              ]),
              size: Size(300, 300),
            );
          },
          animation: _curve,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _animateValues();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  void _animateValues() {
    final newRedBegin = _redProgress.value;
    final newBlueBegin = _blueProgress.value;
    final newGreenBegin = _greenProgress.value;
    final double newRedEnd = random.nextDouble() * 2;
    final double newBlueEnd = random.nextDouble() * 2;
    final double newGreenEnd = random.nextDouble() * 2;

    setState(() {
      _redProgress = Tween(begin: newRedBegin, end: newRedEnd).animate(_curve);
      _blueProgress =
          Tween(begin: newBlueBegin, end: newBlueEnd).animate(_curve);
      _greenProgress =
          Tween(begin: newGreenBegin, end: newGreenEnd).animate(_curve);
    });
    _animationController.forward(from: 0);
  }
}

class AppleWatchPaintr extends CustomPainter {
  final List<double> progress;
  AppleWatchPaintr({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double redCircleRadius = size.width / 2;
    double blueCircleRadius = (size.width / 2) * 0.8;
    double greenCircleRadius = (size.width / 2) * 0.6;

    Rect redArcRect = Rect.fromCircle(center: center, radius: redCircleRadius);
    Rect blueArcRect =
        Rect.fromCircle(center: center, radius: blueCircleRadius);
    Rect greenArcRect =
        Rect.fromCircle(center: center, radius: greenCircleRadius);

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
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), redCircleRadius,
        redCirclePaint);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), blueCircleRadius,
        blueCirclePaint);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2),
        greenCircleRadius, greenCirclePaint);

    canvas.drawArc(
        redArcRect, 3 * pi / 2, progress[0] * pi, false, redArcPaint);
    canvas.drawArc(
        blueArcRect, 3 * pi / 2, progress[1] * pi, false, blueArcPaint);
    canvas.drawArc(
        greenArcRect, 3 * pi / 2, progress[2] * pi, false, greenArcPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return true;
  }
}
