import 'package:flutter/material.dart';
import 'package:volley_log/features/score/score_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScorePage.create(),
      debugShowCheckedModeBanner: false,
    );
  }
}
