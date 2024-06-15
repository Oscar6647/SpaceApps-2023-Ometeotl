import 'package:flutter/material.dart';
import 'package:ometeotl/constants.dart';
import 'package:ometeotl/screen/explain_screen.dart';
import 'package:ometeotl/screen/login_screen.dart';
import 'package:ometeotl/widgets/signup_entry.dart';

class SignUpBox extends StatelessWidget {
  const SignUpBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 20,
              offset: const Offset(0, 0),
            )
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Name field
            const SignUpEntry(text: "Name", icon: Icons.person),
            // Email field
            const SignUpEntry(text: "Email", icon: Icons.email),
            // Password field
            const SignUpEntry(text: "Password", icon: Icons.key),
            // Confirm Password field
            const SignUpEntry(text: "Confirm Password", icon: Icons.key),
            // Account buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SignInScreen(),
                    ),
                  ),
                  child: Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: substitleStyle.fontSize,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ExplainScreen(),
                    ),
                  ),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: substitleStyle.fontSize,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
