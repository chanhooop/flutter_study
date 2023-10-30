import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({
    required this.title,
    required this.body,
    this.actions,
    Key? key,
  }) : super(key: key);

  final String title;
  final Widget body;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: body
      )
    );
  }
}