import 'package:flutter/material.dart';
import 'package:ometeotl/explain_screen.dart';
import 'package:ometeotl/signup_screen.dart';
import 'package:ometeotl/widgets/background_scaffold.dart';
import 'package:ometeotl/widgets/logo_image.dart';
import 'package:ometeotl/widgets/signup_box.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BackgroundScaffold(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const LogoImage(),
            const SignUpBox(),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ExplainScreen(),
                  ),
                );
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Next",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: Colors.white),
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
            ),
          ],
        ),
      ),
    );
  }
}
