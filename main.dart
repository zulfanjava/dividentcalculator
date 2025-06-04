// lib/main.dart
import 'package:flutter/material.dart';
import 'mainPage.dart';
import 'homePage.dart';
import 'aboutPage.dart';
import 'info.dart';
import 'calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MainPage(),
    );
  }
}
