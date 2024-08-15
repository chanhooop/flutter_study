import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serverless_example/app/view/test_view_model.dart';

class TestView extends ConsumerWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('TestView widget build');
    // final testViewNotifier = ref.watch(activityProvider(arg: 'TestView'));
    final testViewModel = ref.watch(testViewAsyncNotifierProvider);
    return Scaffold(
      body: Center(
        child:
          testViewModel.when(
            data: (value)=>RefreshIndicator(
              onRefresh: () {
                return ref.read(testViewAsyncNotifierProvider.notifier).changeTestViewModel('str');
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: ()=>ref.read(testViewAsyncNotifierProvider.notifier).changeTestViewModel('test'),
                        child: Text(value.txt)),
                    TextButton(
                      onPressed: ()=>context.pushNamed('/TestView2'),
                      child: Text('다음 페이지로'),
                    ),
                  ],
                ),
              ),
            ),
            error: (error, stack)=>Text('Error : $error'),
            loading: ()=>Text('Loading...'),
          ),
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     // GestureDetector(
        //     //     onTap: ()=>context.goNamed('TestView2'),
        //     //     child: Text('${activity.valueOrNull ?? 'null'}')),
        //     Text('isLoading : ${testViewModel.isLoading}'),
        //     Text('isRefreshing : ${testViewModel.isRefreshing}'),
        //     Text('isReloading : ${testViewModel.isReloading}'),
        //     Text('hasValue : ${testViewModel.hasValue}'),
        //     Text('hasValue : ${testViewModel.hasError}'),
        //     Text('hasValue : ${testViewModel.hashCode}'),
        //     TextButton(
        //       child: Text('changeTestViewModel'),
        //       onPressed: () => ref.read(testViewAsyncNotifierProvider.notifier).changeTestViewModel('test'),
        //       // onPressed: () => context.pop(),
        //     ),
        //     GestureDetector(
        //       onTap: ()=>context.goNamed('TestView2'),
        //         child: Text('${testViewModel.value ?? 'null'}'),
        //     ),
        //
        //   ],
        // ),
      ),
    );
  }
}
