import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseStreamPage extends StatefulWidget {
  @override
  _UseStreamPageState createState() => _UseStreamPageState();
}

class _UseStreamPageState extends State<UseStreamPage> {
  Stream<int> countStream() {
    return Stream<int>.periodic(const Duration(seconds: 1), (i) => i + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('useEffect'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: countStream(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasError) {
              return ErrorWidget(snapshot.error!);
            } else if (snapshot.hasData) {
              return Text(
                '${snapshot.data}',
                style: const TextStyle(fontSize: 80),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

// class UseStreamPage extends HookWidget {
//   Stream<int> countStream() {
//     return Stream<int>.periodic(const Duration(seconds: 1), (i) => i + 1)
//         .take(10);
//   }

//   @override
//   Widget build(BuildContext context) {
//     var stream = useMemoized(() => countStream());
//     var snapshot = useStream<int>(stream);
//     print('build');
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('useStream'),
//       ),
//       body: Center(
//         child: snapshot.hasError
//             ? ErrorWidget(snapshot.error!)
//             : snapshot.hasData
//                 ? Text(
//                     '${snapshot.data}',
//                     style: const TextStyle(fontSize: 80),
//                   )
//                 : const CircularProgressIndicator(),
//       ),
//     );
//   }
// }
