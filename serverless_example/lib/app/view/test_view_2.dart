import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serverless_example/app/repository/fetch_repository/activity_provider.dart';
import 'package:serverless_example/app/view/test_view_model.dart';


class TestView2 extends ConsumerWidget {
  const TestView2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('TestView2 화면빌드');
    final activity = ref.watch(activityProvider(arg: 'TestView2'));

    return Scaffold(
      body: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(activity.isLoading)...[
              Text('loading...'),
            ],
            if(activity.hasValue)...[
              Text('${activity.value}'),
              TextButton(
                child: Text('뒤로가기'),
                onPressed: () => context.goNamed('TestView'),
                // onPressed: () => context.pop(),
              ),
              TextButton(
                child: Text('changeTestViewModel'),
                onPressed: () => ref.read(testViewNotifierProvider.notifier).changeTestViewModel('test'),
                // onPressed: () => context.pop(),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
