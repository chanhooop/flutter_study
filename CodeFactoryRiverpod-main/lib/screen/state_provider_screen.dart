import 'package:codefactory_riverpod/layout/default_layout.dart';
import 'package:codefactory_riverpod/riverpod/state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateProviderScreen extends ConsumerWidget {
  static const routeName = "/StateProviderScreen";

  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);
    return DefaultLayout(
      title: 'StateProviderScreen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(provider.toString()),
            ElevatedButton(
              onPressed: () {
                ref.read(numberProvider.notifier).update((state) => state + 1);
              },
              child: const Text('Up!!!')
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(numberProvider.notifier).state = ref.read(numberProvider.notifier).state - 1;
              },
              child: const Text('Down!!!')
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => _NextScreen()));
              },
              child: const Text('Next Screen')
            )
          ],
        )
      )
    );
  }
}

class _NextScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);
    return DefaultLayout(
        title: 'NextScreen',
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(provider.toString()),
                ElevatedButton(
                    onPressed: (){
                      ref.read(numberProvider.notifier).update((state) => state + 1);
                    },
                    child: const Text('Up!!!')
                )
              ],
            )
        )
    );
  }
}