import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseStatePage extends HookWidget {
  const UseStatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = useState(0); // 여러가지 타입으로 useState설정 가능
    return Scaffold(
      appBar: AppBar(
        title: const Text('useState'),
      ),
      body: Center(
          child: Text(
        counter.value.toString(), // 사용시에는 .value로 호출
        style: const TextStyle(fontSize: 80),
      )),
      floatingActionButton: FloatingActionButton(onPressed: () {
        counter.value++; // 사용시에는 .value로 호출
      }),
    );
  }
}

// class UseStatePage extends StatefulWidget {
//   const UseStatePage({super.key});
//
//   @override
//   State<UseStatePage> createState() => _UseStatePageState();
// }
//
// class _UseStatePageState extends State<UseStatePage> {
//   int counter = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('useState'),
//       ),
//       body: Center(
//           child: Text(
//         counter.toString(),
//         style: const TextStyle(fontSize: 80),
//       )),
//       floatingActionButton: FloatingActionButton(onPressed: () {
//         counter++;
//         setState(() {});
//       }),
//     );
//   }
// }
