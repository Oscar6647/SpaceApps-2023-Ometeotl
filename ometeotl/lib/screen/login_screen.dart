import 'package:flutter/material.dart';
import 'package:ometeotl/screen/explain_screen.dart';
import 'package:ometeotl/widgets/background_scaffold.dart';
import 'package:ometeotl/widgets/next_button.dart';
import 'package:ometeotl/widgets/signin_box.dart';
import 'package:ometeotl/widgets/signup_box.dart';

import '../widgets/logo_image.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return const BackgroundScaffold(
      imgPath: "assets/stars.jpeg",
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LogoImage(),
            SignUpBox(),
            NextButton(nextScreen: ExplainScreen()),
          ],
        ),
      ),
    );
  }
}

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundScaffold(
      imgPath: "assets/stars.jpeg",
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LogoImage(),
            SignInBox(),
            NextButton(nextScreen: ExplainScreen())
          ],
        ),
      ),
    );
  }
}
