import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animations_masterclass/screens/menu_screen.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  if (Platform.isWindows || Platform.isLinux) {
    // Initialize FFI
    sqfliteFfiInit();
  }
  databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Animations Masterclass',
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.light(
              primary: Colors.blue,
            )),
        home: const MenuScreen());
  }
}
