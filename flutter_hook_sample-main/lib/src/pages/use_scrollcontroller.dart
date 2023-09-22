import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// class UseScrollControllerPage extends StatefulWidget {
//   const UseScrollControllerPage({super.key});

//   @override
//   State<UseScrollControllerPage> createState() =>
//       _UseScrollControllerPageState();
// }

// class _UseScrollControllerPageState extends State<UseScrollControllerPage> {
//   late ScrollController _scrollController;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('ScrollController StatefulWidget Example')),
//       body: ListView.builder(
//         controller: _scrollController,
//         itemCount: 100,
//         itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.arrow_upward),
//         onPressed: () {
//           _scrollController.animateTo(
//             0.0,
//             duration: Duration(seconds: 1),
//             curve: Curves.easeInOut,
//           );
//         },
//       ),
//     );
//   }
// }

class UseScrollControllerPage extends HookWidget {
  const UseScrollControllerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    return Scaffold(
      appBar: AppBar(title: Text('UseScrollController')),
      body: ListView.builder(
        controller: scrollController,
        itemCount: 100,
        itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          scrollController.animateTo(
            0.0,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}
