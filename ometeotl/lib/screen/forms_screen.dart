import 'package:flutter/material.dart';
import 'package:ometeotl/constants.dart';
import 'package:ometeotl/widgets/back_text_button.dart';
import 'package:ometeotl/widgets/text_form.dart';

class FormsScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  FormsScreen({super.key});

  /* One for each question */
  final TextEditingController inputText = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // UploadData();

      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [paleteBlue, paleteLightBlue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const BackTextButton(),
                  TextForm(
                      text: "Whats your name",
                      inputText: "Enter answer",
                      padding: 20,
                      controller: TextEditingController()),
                  TextForm(
                      text: "Whats your name",
                      inputText: "Enter answer",
                      padding: 20,
                      controller: TextEditingController()),
                  TextForm(
                      text: "Whats your name",
                      inputText: "Enter answer",
                      padding: 20,
                      controller: TextEditingController()),
                  TextForm(
                      text: "Whats your name",
                      inputText: "Enter answer",
                      padding: 20,
                      controller: TextEditingController()),
                  TextForm(
                      text: "Whats your name",
                      inputText: "Enter answer",
                      padding: 20,
                      controller: TextEditingController()),
                  TextForm(
                      text: "Whats your name",
                      inputText: "Enter answer",
                      padding: 20,
                      controller: TextEditingController()),
                  TextForm(
                      text: "Whats your name",
                      inputText: "Enter answer",
                      padding: 20,
                      controller: TextEditingController()),
                  TextForm(
                      text: "Whats your name",
                      inputText: "Enter answer",
                      padding: 20,
                      controller: TextEditingController()),
                  TextForm(
                      text: "Whats your name",
                      inputText: "Enter answer",
                      padding: 20,
                      controller: TextEditingController()),
                  ElevatedButton.icon(
                    onPressed: () {
                      _submitForm();
                    },
                    icon: const Icon(Icons.send),
                    label: const Text("Send Info"),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
