import 'package:flutter/material.dart';

class ImplicitAnimationsScreen extends StatefulWidget {
  const ImplicitAnimationsScreen({super.key});

  @override
  State<ImplicitAnimationsScreen> createState() =>
      _ImplicitAnimationsScreenState();
}

class _ImplicitAnimationsScreenState extends State<ImplicitAnimationsScreen> {
  bool _visible = true;

  void _trigger() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Implicit Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              tween: ColorTween(begin: Colors.yellow, end: Colors.red),
              curve: Curves.bounceInOut,
              duration: Duration(seconds: 5),
              builder: ((context, value, child) {
                return Image.network(
                  "https://pbs.twimg.com/media/Eu7kZRRWgAMJjj8.png",
                  color: value,
                  colorBlendMode: BlendMode.colorBurn,
                );
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                _trigger();
              },
              child: const Text('Go!'),
            )
          ],
        ),
      ),
    );
  }
}
