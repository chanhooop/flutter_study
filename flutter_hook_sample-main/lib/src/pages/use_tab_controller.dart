import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// class useTabControllerPage extends StatefulWidget {
//   @override
//   State<useTabControllerPage> createState() => _useTabControllerPageState();
// }

// class _useTabControllerPageState extends State<useTabControllerPage>
//     with TickerProviderStateMixin {
//   late TabController tabController;
//   @override
//   void initState() {
//     super.initState();
//     tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   void dispose() {
//     tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('tabController'),
//         bottom: TabBar(
//           controller: tabController,
//           tabs: const [
//             Tab(icon: Icon(Icons.home)),
//             Tab(icon: Icon(Icons.settings)),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: tabController,
//         children: const [
//           Center(child: Text('Home')),
//           Center(child: Text('Settings')),
//         ],
//       ),
//     );
//   }
// }

class useTabControllerPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var tabController = useTabController(initialLength: 2);
    return Scaffold(
      appBar: AppBar(
        title: const Text('tabController'),
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
