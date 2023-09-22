import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseSingleTickerProviderPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var tabController =
        useTabController(initialLength: 2, vsync: useSingleTickerProvider());
    return Scaffold(
      appBar: AppBar(
        title: const Text('useSingleTickerProvider'),
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.settings)),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          Center(child: Text('Home')),
          Center(child: Text('Settings')),
        ],
      ),
    );
  }
}
