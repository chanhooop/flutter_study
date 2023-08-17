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
      final factor = _position.value.isNegative ? -1 : 1;
      // whenComplete = 에니메이션이 끝난후 작동
      _position.animateTo(dropZone * factor).whenComplete(() {
        _position.value = 0;
        setState(() {
          _index = _index == 4 ? 1 : _index + 1;
        });
      });
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

  // 카드 인덱스
  int _index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swiping Card'),
      ),
      body: Column(
        children: [
          /// 카드
          SizedBox(
            height: 500,
            child: AnimatedBuilder(
              animation: _position,
              builder: (context, child) {
                // 카드 넘어가는 각도
                final angle = _rotation
                    .transform((_position.value + size.width / 2) / size.width);

                // 뒷부분 카드 스케일
                // min함수 최솟값을 정해서 최소값이상으로 값이 상승시 최소값 표시
                final scale = _scale
                    .transform(min(_position.value.abs() / size.width, 1.0));

                return Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: 100,
                      child: Transform.scale(
                          scale: scale,
                          child: Card(index: _index == 4 ? 1 : _index + 1)),
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
                              child: Card(index: _index)),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          /// 버튼
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(50),
                  ),
                )
              ],
            ),
          )
        ],
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
        child: Image.asset(
          'assets/covers/${index}.jpeg',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
