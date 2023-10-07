import 'package:flutter/material.dart';
import 'package:ometeotl/constants.dart';

class SignUpEntry extends StatelessWidget {
  final String text;
  final IconData icon;
  const SignUpEntry({required this.text, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                cursorColor: Colors.white,
                style: smallerDefaultStyleWhite,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: text,
                  hintStyle: smallerDefaultStyleWhite,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(
          color: Colors.white,
        ),
      ],
    );
  }
}
