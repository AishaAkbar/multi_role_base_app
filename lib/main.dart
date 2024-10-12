import 'package:flutter/material.dart';
import 'package:multi_roll_base_app/splash_screen.dart';

void main() {
  runApp(const MultiApp());
}

class MultiApp extends StatefulWidget {
  const MultiApp({super.key});

  @override
  State<MultiApp> createState() => _MultiAppState();
}

class _MultiAppState extends State<MultiApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multi Mode App',
      home: SplashScreen(),
    );
  }
}
