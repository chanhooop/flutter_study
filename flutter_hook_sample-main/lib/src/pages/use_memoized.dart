import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseMemoizedPage extends HookWidget {
  UseMemoizedPage({super.key});

  int value = 0;

  @override
  Widget build(BuildContext context) {
    var count = useState(value);
    final numbers = useState([1, 2, 3, 4, 5]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('useMemoized'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${count.value}',
              style: TextStyle(fontSize: 40),
            ),
            _DeepUseMemoizedPage(
              numbers: numbers.value,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        count.value++;
        if (count.value % 5 == 0) {
          numbers.value.add(count.value);
        }
      }),
    );
  }
}

class _DeepUseMemoizedPage extends HookWidget {
  final List<int> numbers;
  const _DeepUseMemoizedPage({super.key, required this.numbers});

  int calculateSum(List<int> numbers) {
    return numbers.reduce((a, b) => a + b);
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild = $numbers');
    final sum = useMemoized(() {
      print('고 차원의 연산 혹은 api 호출 ..');
      return calculateSum(numbers);
    }, [...numbers]);
    return Text(
      'Sum: $sum',
      style: TextStyle(fontSize: 60),
    );
  }
}
