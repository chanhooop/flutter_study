import 'package:codefactory_riverpod/layout/default_layout.dart';
import 'package:codefactory_riverpod/screen/auto_dispose_modifier_screen.dart';
import 'package:codefactory_riverpod/screen/family_modifier_screen.dart';
import 'package:codefactory_riverpod/screen/future_provider_screen.dart';
import 'package:codefactory_riverpod/screen/listen_provider_screen.dart';
import 'package:codefactory_riverpod/screen/provider_screen.dart';
import 'package:codefactory_riverpod/screen/select_provider_screen.dart';
import 'package:codefactory_riverpod/screen/state_notifier_provider.dart';
import 'package:codefactory_riverpod/screen/state_provider_screen.dart';
import 'package:codefactory_riverpod/screen/stream_provider_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "HomeScreen",
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(StateProviderScreen.routeName);
            },
            child: Text('StateProviderScreen')
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(StateNotifierProviderScreen.routeName);
            },
            child: Text('StateNotifierProviderScreen')
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(FutureProviderScreen.routeName);
            },
            child: Text('FutureProviderScreen')
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(StreamProviderScreen.routeName);
              },
              child: Text('StreamProviderScreen')
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(FamilyModifierScreen.routeName);
              },
              child: Text('FamilyModifierScreen')
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AutoDisposeModifierScreen.routeName);
              },
              child: Text('AutoDisposeModifierScreen')
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ListenProviderScreen.routeName);
              },
              child: Text('ListenProviderScreen')
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SelectProviderScreen.routeName);
              },
              child: Text('SelectProviderScreen')
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ProviderScreen.routeName);
              },
              child: Text('ProviderScreen')
          ),
        ],
      )
    );
  }
}