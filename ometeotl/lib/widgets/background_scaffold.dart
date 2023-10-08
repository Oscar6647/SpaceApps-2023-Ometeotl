import 'package:flutter/material.dart';

class BackgroundScaffold extends StatelessWidget {
  final Widget child;
  final String imgPath;
  const BackgroundScaffold({required this.child, required this.imgPath, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imgPath), fit: BoxFit.cover),
        ),
        child: SafeArea(child: child),
      ),
    );
  }
}
