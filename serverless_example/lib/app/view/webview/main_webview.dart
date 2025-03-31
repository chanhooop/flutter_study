import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverless_example/app/view/layout/main_layout.dart';

class MainWebView extends ConsumerWidget {
  const MainWebView({super.key});

  static final routeName = '/MainWebView';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainLayout(
        body: Column(
      children: [
        Container(
          width: 200,
          height: 200,
          color: Colors.blue,
        ),
        // Container(
        //   width: 200,
        //   height: 200,
        //   color: Colors.yellow,
        // ),
        // Container(
        //   width: 200,
        //   height: 200,
        //   color: Colors.grey,
        // ),
        // Container(
        //   width: 200,
        //   height: 200,
        //   color: Colors.black,
        // ),
      ],
    ));
  }
}
