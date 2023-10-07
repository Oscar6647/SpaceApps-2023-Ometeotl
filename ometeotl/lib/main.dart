import 'package:flutter/material.dart';
import 'package:ometeotl/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ometeotl',
      theme: ThemeData(),
      home: const WelcomeScreen(),
    );
  }
}