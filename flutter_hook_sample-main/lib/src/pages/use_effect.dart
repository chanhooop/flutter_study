import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// useEffect는 키가 지정되지 않는 한 모든 빌드에서 동기식으로 호출됩니다. 이 경우 키 내부의 값이 변경된 경우에만 useEffect가 다시 호출됩니다.

class UseEffectPage extends HookWidget {
  UseEffectPage({super.key});
  int specificValue = 0;

  void test() {
    print('test 호출');
  }

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);

    /// Fuction을 return 한다. 빈 배열을 넣어주면 initState()와 같은 효과, 최초한번 실행
    useEffect(() {
      print('useEffect 발동!!');
      return () {};
    }, [specificValue]);

    /// 배열값에 아무것도 안넣으면 매번 호출과 동일한 효과 (useEffect((){}) = test())
    // useEffect(() {
    //   print('useEffect 발동!!');
    //   return () {};
    // });
    // test();
    print('화면 갱신 됩니다.');
    return Scaffold(
      appBar: AppBar(
        title: const Text('useEffect'),
      ),
      body: Center(
          child: Text(
        counter.value.toString(),
        style: const TextStyle(fontSize: 80),
      )),
      floatingActionButton: FloatingActionButton(onPressed: () {
        counter.value++;
        if (counter.value % 5 == 0) {
          specificValue++;
        }
      }),
    );
  }
}
