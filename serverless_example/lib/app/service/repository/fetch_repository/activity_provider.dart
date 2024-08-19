import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverless_example/app/service/repository/model/activity.dart';
import 'package:serverless_example/app/view/test_view_model.dart';

// 코드 생성이 작동하는 데 필요합니다.
part 'activity_provider.g.dart';

/// 그러면 이 함수의 결과를 캐시할
/// `activityProvider`라는 provider가 생성됩니다.
///
@riverpod
Future<Activity?> activityNull(Ref ref, {String? arg}) async {
await Future.delayed(Duration(milliseconds: 1000)).then((value) => print('activity test : $arg'));
return null;
}

@riverpod
Future<Activity?> activity(ActivityRef ref, {String? arg}) async {
  // ref.keepAlive();
  ref.onCancel(() {
    // 리스너가 dispose 되기 전 단계
    print('activity onCancel [$arg]');
  });
  ref.onDispose(() {
    // 리스너가 dispose
    print('activity onDispose [$arg]');
  });
  ref.onResume(() {
    // 리스너가 keepAlive 상태에서 다시 리스너가 다시 활성화 된 경우
    print('activity onResume [$arg]');
  });

  await Future.delayed(Duration(milliseconds: 1000)).then((value) => print('activity test : $arg'));

  // throw Exception('activity exception');
  return Activity(key: '1', activity: 'activity', type: 'type', participants: 1, price: 1.1);
}
