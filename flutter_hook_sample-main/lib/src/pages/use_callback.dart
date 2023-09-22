import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseCallBackPage extends HookWidget {
  UseCallBackPage({super.key});

  int add(int i, int j) {
    return i + j;
  }

  @override
  Widget build(BuildContext context) {
    var count = useState(0);
    var callback = useMemoized(() {
      print('memorize');
      return add(2, 5);
    }, []);
    // var callback = useCallback(() {
    //   print('callback');
    //   return add(1, 2);
    // }, []);

    print('rebuild');
    return Scaffold(
      appBar: AppBar(
        title: const Text('useCallback'),
      ),
      body: Center(
        child: Text(
          callback.toString(),
          style: const TextStyle(fontSize: 80),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        count.value++;
      }),
    );
  }
}
