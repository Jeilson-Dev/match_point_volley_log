import 'package:flutter/material.dart';
import 'package:match_point_volley_log/features/single_match/single_match_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SingleMatchPage.create(),
      debugShowCheckedModeBanner: false,
    );
  }
}
