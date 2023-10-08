import 'package:flutter/material.dart';
import 'package:ometeotl/constants.dart';
import 'package:ometeotl/screen/home.dart';
import 'package:ometeotl/widgets/background_scaffold.dart';
import 'package:ometeotl/widgets/logo_image.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DateSelectionScreen extends StatefulWidget {
  const DateSelectionScreen({Key? key}) : super(key: key);

  @override
  _DateSelectionScreenState createState() => _DateSelectionScreenState();
}

class _DateSelectionScreenState extends State<DateSelectionScreen> {
  DateTime selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = selectedDate.toLocal().toString().split(' ')[0];
      });
    }
  }

  Future<void> sendSelectedDate(DateTime selectedDate) async {
    final apiUrl = 'http://127.0.0.1:5000/'; // Replace with your Flask API URL

    final selectedDateJson = {
      'year': selectedDate.year,
      'month': selectedDate.month,
      'day': selectedDate.day,
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(selectedDateJson),
    );

    if (response.statusCode == 200) {
      // Request was successful, handle the response here
      print('Response: ${response.body}');
    } else {
      // Request failed, handle the error here
      print('Error: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    dateController.text = selectedDate.toLocal().toString().split(' ')[0];
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      imgPath: "assets/stars.jpeg",
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const LogoImage(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: dateController,
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    decoration: InputDecoration(
                      labelText: 'Select Date',
                      hintText: 'Tap to select a date',
                      suffixIcon: Icon(Icons.calendar_today, color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                await sendSelectedDate(selectedDate);
                
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                primary: paleteLightBlue,
                padding: EdgeInsets.all(20.0),
              ),
              child: const Text(
                'Send',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
