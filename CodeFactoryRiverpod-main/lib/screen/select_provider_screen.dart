import 'package:codefactory_riverpod/layout/default_layout.dart';
import 'package:codefactory_riverpod/riverpod/select_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectProviderScreen extends ConsumerWidget {
  static const routeName = '/SelectProviderScreen';

  const SelectProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(selectProvider.select((value) => value.isSpicy));
    return DefaultLayout(title: 'SelectProviderScreen', body: Column(
      children: [
        // Text(state.name),
        // Text(state.isSpicy.toString()),
        // Text(state.hasBought.toString()),
        ElevatedButton(
          onPressed: (){
            ref.read(selectProvider.notifier).toggleIsSpicy();
          },
          child: Text('Spicy Toggle')
        ),
        ElevatedButton(
            onPressed: (){
              ref.read(selectProvider.notifier).toggleHasBought();
            },
            child: Text('Bought Toggle')
        )
      ]
    ));
  }
}