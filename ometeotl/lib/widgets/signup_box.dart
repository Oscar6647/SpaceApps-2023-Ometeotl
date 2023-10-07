import 'package:flutter/material.dart';
import 'package:ometeotl/signup_screen.dart';

class SignUpBox extends StatelessWidget {
  const SignUpBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: const BorderRadius.all(Radius.circular(25)),
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
              const Row(
                children: [
                  Icon(
                    Icons.mail_outline,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.white,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                        hintStyle:
                            TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(
                color: Colors.white,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.key,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      cursorColor: Colors.white,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle:
                            TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(
                color: Colors.white,
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to the SignUpScreen when clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SignUpScreen(),
                    ),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Create Account',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
