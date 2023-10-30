import 'package:codefactory_riverpod/layout/default_layout.dart';
import 'package:codefactory_riverpod/riverpod/family_modifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FamilyModifierScreen extends ConsumerWidget {
  static const routeName = "/FamilyModifierScreen";

  const FamilyModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(familyModifierProvider(3));
    return DefaultLayout(
      title: 'FamilyModifierScreen',
      body: Center(
        child: state.when(
          data: (data) => Text(data.toString()),
          error: (error, stack) => Text(error.toString()),
          loading: () => CircularProgressIndicator()
        )
      )
    );
  }
}