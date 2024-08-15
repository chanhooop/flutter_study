import 'dart:async';
import 'dart:ffi';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverless_example/app/repository/fetch_repository/activity_provider.dart';
import 'package:serverless_example/app/repository/model/activity.dart';

part 'test_view_model.freezed.dart';

part 'test_view_model.g.dart';

@freezed
class TestViewModel with _$TestViewModel {
  factory TestViewModel({
    required String txt,
  }) = _TestViewModel;
}

@riverpod
class TestViewNotifier extends _$TestViewNotifier {
  @override
   build() {
    print('TestViewNotifier build');

    // await ref.watch(activityProvider(arg: 'TestViewNotifier'));

    // ref.keepAlive();

    ref.onDispose(() {
      print('TestViewNotifier onDispose : $state');
    });

    ref.onCancel(() {
      print('TestViewNotifier onCancel : $state');
    });

    ref.onResume(() {
      print('TestViewNotifier onResume : $state');
    });
    // return AsyncValue.data(TestViewModel(txt: 'txt'));

    return TestViewModel(txt: 'txt');
  }


  void changeTestViewModel(String str){
    state = TestViewModel(txt: str);
  }

}

@riverpod
class TestViewAsyncNotifier extends _$TestViewAsyncNotifier {

  @override
  FutureOr<TestViewModel> build() async {

    print('TestViewAsyncNotifier build ');

    ref.onDispose(() {
      print('TestViewAsyncNotifier onDispose');
    });

    ref.onCancel(() {
      print('TestViewAsyncNotifier onCancel');
    });

    ref.onResume(() {
      print('TestViewAsyncNotifier onResume');
    });

    print('11111');
    await Future.delayed(Duration(milliseconds: 1000));

    final activity = await ref.watch(activityNullProvider(arg: '여기 테스트').future);
    print('22222');
    // return activity.when(
    //     data: (value)=> TestViewModel(txt: value.activity),
    //     error: (error, stack)=>throw Exception('activity Error : $error'),
    //     loading: () => TestViewModel(txt: 'asdfasdf')
    // );

    // throw Exception('test exception');
    print('test 확인 : ${activity}');
    return TestViewModel(txt: '${activity}');
  }

  Future<void> changeTestViewModel(String str) async{
    // ref.invalidateSelf();
    await Future.delayed(Duration(milliseconds: 1000));
    state = AsyncValue.data(TestViewModel(txt: str)) ;
    await state;
  }

}
