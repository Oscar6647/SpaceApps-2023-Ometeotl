import 'package:flutter/material.dart';
import 'package:ometeotl/explain_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/stars.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: size.width,
                height: size.height * .3,
                child: Image.asset('assets/logoChanged.png'),
              ),
              Align(
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
                  child: const Column(
                    children: [
                      // Name field
                      Row(
                        children: [
                          Icon(
                            Icons.person,
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
                                hintText: 'Name',
                                hintStyle: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(
                        color: Colors.white,
                      ),
                      // Email field
                      Row(
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
                                hintStyle: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(
                        color: Colors.white,
                      ),
                      // Password field
                      Row(
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
                                hintStyle: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(
                        color: Colors.white,
                      ),
                      // Confirm Password field
                      Row(
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
                                hintText: 'Confirm Password',
                                hintStyle: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(
                        color: Colors.white,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                          Text(
                            'Log In',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
      ),
    );
  }
}
