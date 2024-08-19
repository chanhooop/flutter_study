import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serverless_example/app/service/repository/fetch_repository/activity_provider.dart';
import 'package:serverless_example/app/service/repository/fetch_repository/home_news.dart';
import 'package:serverless_example/app/view/test_view_model.dart';

class TestView extends ConsumerWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('TestView widget build');
    // final testViewNotifier = ref.watch(activityProvider(arg: 'TestView'));
    final testViewModel = ref.watch(testViewAsyncNotifierProvider);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child:
              // testViewModel.when(
              //   data: (value)=>RefreshIndicator(
              //     onRefresh: () {
              //       return ref.read(testViewAsyncNotifierProvider.notifier).changeTestViewModel('str');
              //     },
              //     child: SingleChildScrollView(
              //       physics: AlwaysScrollableScrollPhysics(),
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           GestureDetector(
              //               // onTap: ()=>ref.read(testViewAsyncNotifierProvider.notifier).changeTestViewModel('test'),
              //               onTap: ()=>ref.invalidate(activityProvider),
              //               child: Text(value.txt)),
              //           TextButton(
              //             onPressed: ()=>context.go('/TestViewSecond'),
              //             child: Text('다음 페이지로'),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              //   error: (error, stack)=>Text('Error : $error'),
              //   loading: ()=>Text('Loading...'),
              // ),
              RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(homeNewsProvider);
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // GestureDetector(
                  //     onTap: ()=>context.goNamed('TestView2'),
                  //     child: Text('${activity.valueOrNull ?? 'null'}')),
                  Text('isLoading : ${testViewModel.isLoading}'),
                  Text('isRefreshing : ${testViewModel.isRefreshing}'),
                  Text('isReloading : ${testViewModel.isReloading}'),
                  Text('hasValue : ${testViewModel.hasValue}'),
                  Text('hasError : ${testViewModel.hasError}'),
                  Text('hashCode : ${testViewModel.hashCode}'),
                  TextButton(
                    child: Text('changeTestViewModel'),
                    onPressed: () => ref
                        .read(testViewAsyncNotifierProvider.notifier)
                        .changeTestViewModel('test'),
                  ),
                  GestureDetector(
                    onTap: () => ref.invalidate(homeNewsProvider),
                    child: Text('${testViewModel.value ?? 'null'}'),
                  ),
                  GestureDetector(
                    onTap: () => context.goNamed('TestView2'),
                    child: Text('${testViewModel.value ?? 'null'}'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
