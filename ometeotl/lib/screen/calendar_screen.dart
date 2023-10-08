import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ometeotl/constants.dart';
import 'package:ometeotl/screen/weather_page.dart';
import 'package:ometeotl/widgets/background_scaffold.dart';
import 'package:ometeotl/widgets/logo_image.dart';

class DateSelectionScreen extends StatefulWidget {
  const DateSelectionScreen({Key? key}) : super(key: key);

  @override
  _DateSelectionScreenState createState() => _DateSelectionScreenState();
}

class _DateSelectionScreenState extends State<DateSelectionScreen> {
  DateTime selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();
  String predictionValue = ''; 
  String recommendationValue = '';
  // Store the prediction value here

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = selectedDate.toLocal().toString().split(' ')[0];
      });
    }
  }

  Future<void> sendSelectedDate(DateTime selectedDate) async {
    final apiUrl = 'https://spaceapps-ometeotl-2023.uc.r.appspot.com/'; // Replace with your Flask API URL

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
      final jsonResponse = jsonDecode(response.body);
      final prediction = jsonResponse['prediction'];
      final recommendation = jsonResponse['recommendation'];
       // Assuming your API returns a 'prediction' field

      // Set the predictionValue variable to the received prediction
      setState(() {
        predictionValue = '$prediction';
        recommendationValue = '$recommendation';
         // Display the prediction with a label
      });
    } else {
      // Request failed, handle the error here
      print('Error: ${response.statusCode}');
      setState(() {
        predictionValue = 'Failed to retrieve prediction';
        recommendationValue = 'Failed to retrieve recommendation';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    dateController.text = selectedDate.toLocal().toString().split(' ')[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Wrap with Scaffold
      appBar: AppBar(
        backgroundColor: const Color(0x44000000),
        elevation: 20,
        title: const Text("Choose a date to obtain predictions"),// Add AppBar here
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Handle settings button press
            },
          ),
        ],
      ),
      body: BackgroundScaffold( // Wrap BackgroundScaffold here
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeatherPage(predictionValue: predictionValue, recommendationValue: recommendationValue,), // Pass the predictionValue
                    ),
                  );
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
      ),
    );
  }
}
