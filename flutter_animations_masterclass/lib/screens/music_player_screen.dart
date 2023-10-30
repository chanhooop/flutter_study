import 'dart:ui';

import 'package:flutter/material.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({Key? key}) : super(key: key);

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  final PageController _pageController = PageController(
    viewportFraction: 0.8,
  );

  int _curruntPage = 0;

  void _onPageChanged(int newPage) {
    print('newPage : $newPage');
    setState(() {
      _curruntPage = newPage;
    });
  }

  ValueNotifier<double> _scroll = ValueNotifier(0.0);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      print(_pageController.page);
      if (_pageController.page == null) return;
      _scroll.value = _pageController.page!;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: Container(
              key: ValueKey(_curruntPage),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage("assets/covers/${_curruntPage + 1}.jpeg"),
                      fit: BoxFit.cover)),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 15,
                  sigmaY: 15,
                ),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          PageView.builder(
            onPageChanged: _onPageChanged,
            controller: _pageController,
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ValueListenableBuilder(
                    valueListenable: _scroll,
                    builder: (BuildContext context, value, Widget? child) {
                      return Container(
                        height: 350,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset: Offset(0, 8))
                            ],
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/covers/${index + 1}.jpeg"),
                                fit: BoxFit.fitHeight)),
                      );
                    },
                  ),
                  SizedBox(height: 35),
                  Text(
                    'Interstellar',
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Hans Zimmer',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
