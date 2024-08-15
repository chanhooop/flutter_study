

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serverless_example/app/view/test_view.dart';
import 'package:serverless_example/app/view/test_view_2.dart';

final appGorouterProvider = Provider<GoRouter>((ref) {

  ref.onCancel(() {
    print(' appGorouterProvider onCancel' );
  });

  ref.onDispose(() {
    print(' appGorouterProvider onDispose' );
  });

  ref.onResume(() {
    print(' appGorouterProvider onResume' );
  });

  ref.onAddListener(() {
    print(' appGorouterProvider onAddListener' );
  });


  return GoRouter(
      initialLocation: '/', // 시작 주소
      redirect: (context, state) async {
    // 리다이렉트 로직들
  }, 
    routes: [
      GoRoute(path: '/', name: 'TestView', builder: (context, routerState) => TestView()),
      GoRoute(path: '/TestView2', name: 'TestView2', builder: (context, routerState) => TestView2()),
    ],
  // refreshListenable: // 리스너
  // routes: [
  //
  // ],
  );
});
