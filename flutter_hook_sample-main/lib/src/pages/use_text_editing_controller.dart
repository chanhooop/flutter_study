import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// class UseTextEditingControllerPage extends StatefulWidget {
//   const UseTextEditingControllerPage({super.key});

//   @override
//   State<UseTextEditingControllerPage> createState() =>
//       _UseTextEditingControllerPageState();
// }

// class _UseTextEditingControllerPageState
//     extends State<UseTextEditingControllerPage> {
//   final TextEditingController _textEditingController = TextEditingController();

//   @override
//   void dispose() {
//     _textEditingController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:
//           AppBar(title: Text('TextEditingController StatefulWidget Example')),
//       body: Center(
//         child: TextField(
//           controller: _textEditingController,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.send),
//         onPressed: () {
//           print('Submitted Text: ${_textEditingController.text}');
//         },
//       ),
//     );
//   }
// }

class UseTextEditingControllerPage extends HookWidget {
  const UseTextEditingControllerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('useTextEditingController')),
      body: Center(
        child: TextField(
          controller: textEditingController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: () {
          print('Submitted Text: ${textEditingController.text}');
        },
      ),
    );
  }
}
