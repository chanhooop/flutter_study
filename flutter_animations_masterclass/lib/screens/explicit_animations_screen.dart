import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ExplicitAnimationsScreen extends StatefulWidget {
  const ExplicitAnimationsScreen({super.key});

  @override
  State<ExplicitAnimationsScreen> createState() =>
      _ExplicitAnimationsScreenState();
}

class _ExplicitAnimationsScreenState extends State<ExplicitAnimationsScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      reverseDuration: Duration(seconds: 1))
    ..addListener(() {
      _value.value = _animationController.value;
    });

  late final CurvedAnimation _curve = CurvedAnimation(
    parent: _animationController,
    curve: Curves.elasticOut,
    reverseCurve: Curves.bounceIn,
  );

  late final Animation<Decoration> _decoration = DecorationTween(
    begin: BoxDecoration(
      color: Colors.amber,
      borderRadius: BorderRadius.circular(20),
    ),
    end: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(120),
    ),
  ).animate(_curve);

  late final Animation<double> _rotation = Tween(
    begin: 0.0,
    end: 0.5,
  ).animate(_curve);

  late final Animation<double> _scale = Tween(
    begin: 1.0,
    end: 1.2,
  ).animate(_curve);

  late final Animation<Offset> _offset = Tween(
    begin: Offset.zero,
    end: Offset(0.0, -0.5),
  ).animate(_curve);

  void _play() {
    _animationController.forward();
  }

  void _pause() {
    _animationController.stop();
  }

  void _rewind() {
    _animationController.reverse();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  final ValueNotifier<double> _value = ValueNotifier(0.0);

  void _onChanged(double value) {
    _value.value = value;
    _animationController.value = value;
  }

  bool _looping = false;

  void _toggleLooping() {
    if (_looping) {
      _animationController.stop();
    } else {
      _animationController.repeat(reverse: true);
    }
    setState(() {
      _looping = !_looping;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
        appBar: AppBar(
          title: Text('Explicit animations'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // AnimatedBuilder(
              //   animation: _decoration,
              //   builder: (context, child) {
              //     return Container(
              //       width: 400,
              //       height: 400,
              //       decoration: _decoration.value,
              //     );
              //   },
              // ),

              SlideTransition(
                position: _offset,
                child: ScaleTransition(
                  scale: _scale,
                  child: RotationTransition(
                    turns: _rotation,
                    child: DecoratedBoxTransition(
                      decoration: _decoration,
                      child: SizedBox(
                        width: 300,
                        height: 300,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _play,
                    child: Text('Play'),
                  ),
                  ElevatedButton(
                    onPressed: _pause,
                    child: Text('Pause'),
                  ),
                  ElevatedButton(
                    onPressed: _rewind,
                    child: Text('Rewind'),
                  ),
                  ElevatedButton(
                    onPressed: _toggleLooping,
                    child: Text(_looping ? "Stop looping" : "Start looping"),
                  ),
                ],
              ),
              ValueListenableBuilder(
                  valueListenable: _value,
                  builder: (context, value, child) {
                    return Slider(value: value, onChanged: _onChanged);
                  })
            ],
          ),
        ));
  }
}
