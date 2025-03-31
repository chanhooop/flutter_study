import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainLayout extends ConsumerWidget {
  const MainLayout({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
            print('constraints maxWidth 확인 : ${constraints.maxWidth}');
            print('constraints maxHeight 확인 : ${constraints.maxHeight}');
            print('MediaQuery size width 확인 : ${MediaQuery.of(context).size.width}');
            print('MediaQuery size height 확인 : ${MediaQuery.of(context).size.height}');
        
            return Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                color: Colors.red,
                child: body);
          },
        ),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.explore), label: 'Explore'),
        ],
      ),
    );
  }
}
