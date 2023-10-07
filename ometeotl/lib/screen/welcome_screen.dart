import 'package:flutter/material.dart';
import 'package:ometeotl/constants.dart';
import 'package:ometeotl/screen/login_screen.dart';
import 'package:ometeotl/widgets/background_scaffold.dart';
import 'package:ometeotl/widgets/logo_image.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const LogoImage(),
            Padding(
              padding: const EdgeInsets.only(
                  top: 40.0, bottom: 40.0, left: 50.0, right: 50.0),
              child: GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SignUpScreen())),
                child: Container(
                  height: MediaQuery.of(context).size.width / 8,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      paleteLightBlue,
                      paleteBlue,
                    ]),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: const Center(
                    child: Text(
                      'Get Started',
                      style: smallerDefaultStyleWhite,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
