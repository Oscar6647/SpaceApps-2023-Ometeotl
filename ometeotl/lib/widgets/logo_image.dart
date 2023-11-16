import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 12 / 9,
      child: Image.asset('assets/logoChanged.png'),
    );
  }
}
