// ignore_for_file: prefer_const_constructors

import 'package:cybersafe_mx/pages/bottomPage.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // init the hive
  await Hive.initFlutter();

  // open a box
  var sectionsBox = await Hive.openBox('sectionsBox');
  var questionsBox = await Hive.openBox('questionsBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomMenu(),
    );
  }
}
