

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final appGorouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      initialLocation: '/', // 시작 주소
      redirect: (context, state) async {
    // 리다이렉트 로직들
  }, 
    routes: [
      GoRoute(path: '/', builder: (context, routerState) => Container())
    ],
  // refreshListenable: // 리스너
  // routes: [
  //
  // ],
  );
});
