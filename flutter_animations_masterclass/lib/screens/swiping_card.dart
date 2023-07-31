import 'dart:math';

import 'package:flutter/material.dart';

class SwipingCardScreen extends StatefulWidget {
  const SwipingCardScreen({super.key});

  @override
  State<SwipingCardScreen> createState() => _SwipingCardScreenState();
}

class _SwipingCardScreenState extends State<SwipingCardScreen>
    with SingleTickerProviderStateMixin {
  late final size = MediaQuery.of(context).size;

  late final AnimationController _position = AnimationController(
    vsync: this,
    duration: Duration(seconds: 1),
    lowerBound: size.width * -1 - 100,
    upperBound: size.width + 100,
    value: 0.0, // 초기값 설정, 설정 안할시 lowerBound가 초기값
  );

  late final Tween<double> _rotation = Tween(
    begin: -15,
    end: 15,
  );

  late final Tween<double> _scale = Tween(
    begin: 0.8,
    end: 1,
  );

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    _position.value += details.delta.dx;
  }

  void _onHorizontalDragEnd() {
    final bound = size.width - 200;
    final dropZone = size.width + 100;

    if (_position.value.abs() >= bound) {
      if (_position.value.isNegative) {
        _position.animateTo(dropZone * -1);
      } else {
        _position.animateTo(dropZone);
      }
    } else {
      _position.animateTo(0, curve: Curves.easeOut);
    }
  }

  @override
  void dispose() {
    // TODO: 디스포즈 해주지 않으면 오류가 생길 위험이 있음
    _position.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swiping Card'),
      ),
      body: AnimatedBuilder(
        animation: _position,
        builder: (context, child) {
          final angle = _rotation
              .transform((_position.value + size.width / 2) / size.width);
          print(angle);
          final scale = _scale.transform(_position.value.abs() / size.width);
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: 100,
                child: Transform.scale(
                  scale: scale,
                  child: Material(
                    elevation: 10,
                    color: Colors.blue.shade100,
                    child: SizedBox(
                      width: size.width * 0.8,
                      height: size.height * 0.5,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 100,
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    _onHorizontalDragUpdate(details);
                  },
                  onHorizontalDragEnd: (details) {
                    _onHorizontalDragEnd();
                  },
                  child: Transform.translate(
                    offset: Offset(_position.value, 0.0),
                    child: Transform.rotate(
                      angle: angle * (pi / 180),
                      child: Material(
                        elevation: 10,
                        color: Colors.red.shade100,
                        child: SizedBox(
                          width: size.width * 0.8,
                          height: size.height * 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class Card extends StatelessWidget {
  final int index;
  const Card({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      elevation: 10,
      child: SizedBox(
        width: size.width * 0.8,
        height: size.height * 0.5,
      ),
    );
  }
}
