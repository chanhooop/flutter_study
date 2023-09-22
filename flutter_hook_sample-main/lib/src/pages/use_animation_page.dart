import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// class UseAnimationPage extends StatefulWidget {
//   const UseAnimationPage({super.key});

//   @override
//   State<UseAnimationPage> createState() => _UseAnimationPageState();
// }

// class _UseAnimationPageState extends State<UseAnimationPage>
//     with SingleTickerProviderStateMixin {
//   AnimationController? _controller;
//   Animation<double>? _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );

//     _animation = Tween(begin: 0.0, end: 1.0).animate(_controller!)
//       ..addListener(() {
//         setState(() {});
//       });

//     _controller!.forward();
//   }

//   @override
//   void dispose() {
//     _controller!.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('UseAnimation')),
//       body: Center(
//         child: Opacity(
//           opacity: _animation!.value,
//           child: Container(
//             width: 100.0,
//             height: 100.0,
//             color: Colors.blue,
//           ),
//         ),
//       ),
//     );
//   }
// }

class UseAnimationPage extends HookWidget {
  const UseAnimationPage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(seconds: 2),
    );

    final animation = useAnimation(
      Tween(begin: 0.0, end: 1.0).animate(controller),
    );

    useEffect(() {
      controller.forward();
    }, const []);

    return Scaffold(
      appBar: AppBar(title: Text('UseAnimation')),
      body: Center(
        child: Opacity(
          opacity: animation,
          child: Container(
            width: 100.0,
            height: 100.0,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
