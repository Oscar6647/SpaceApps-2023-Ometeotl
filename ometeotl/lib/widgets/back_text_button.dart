import 'package:flutter/material.dart';
import 'package:ometeotl/constants.dart';

class BackTextButton extends StatelessWidget {
  const BackTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            BackButton(
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Text("Back", style: defaultStyleWhite),
          ],
        ),
      ],
    );
  }
}
