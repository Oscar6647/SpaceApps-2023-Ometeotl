import 'package:flutter/material.dart';

class BackgroundScaffold extends StatelessWidget {
  final Widget child;
  const BackgroundScaffold({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/stars.jpeg"), fit: BoxFit.cover),
        ),
        child: SafeArea(child: child),
      ),
    );
  }
}
