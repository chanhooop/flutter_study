import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverless_example/utils/firebase/firebase_main.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'app/router/AppRouter.dart';

void main() async{
  usePathUrlStrategy();
  await FirebaseMain().firebaseInitializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appGorouterProvider);
    return MaterialApp.router(
      title: 'Serverless App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
