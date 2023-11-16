import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final Widget nextScreen;
  const NextButton({required this.nextScreen, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => nextScreen,
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Next",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 22, color: Colors.white),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
