import 'package:codefactory_riverpod/layout/default_layout.dart';
import 'package:codefactory_riverpod/riverpod/provider.dart';
import 'package:codefactory_riverpod/riverpod/state_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderScreen extends ConsumerWidget {
  static const routeName = "/ProviderScreen";

  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(filteredShoppingListProvider);
    return DefaultLayout(
      title: 'ProviderScreen',
      actions:[
        PopupMenuButton<FilterState>(
          itemBuilder: (_) => FilterState.values.map(
            (e) => PopupMenuItem(
              value: e,
              child: Text(e.name)
            )
          ).toList(),
          onSelected: (value) {
            ref.read(filterProvider.notifier).update((state) => value);
          },
        )
      ],
      body: ListView(
        children: state.map((e) => CheckboxListTile(
          title: Text(e.name),
          value: e.hasBought,
          onChanged: (checked) {
            ref.read(shoppingListProvider.notifier).toggleHasBought(name: e.name);
          }
        )).toList(),
      ));
  }
}