import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ometeotl/screen/pollution_screen.dart';

class LocationFormScreen extends StatefulWidget {
  @override
  _LocationFormScreenState createState() => _LocationFormScreenState();
}

class _LocationFormScreenState extends State<LocationFormScreen> {
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  String predictionResult = '';  // To store the prediction result

  Future<void> getPollutionPrediction() async {
    final apiUrl = 'http://127.0.0.1:5000/get_pollution_prediction'; // Replace with your Flask API URL

    final requestBody = {
      'latitude': latitudeController.text,
      'longitude': longitudeController.text,
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final result = jsonResponse['result'];

      setState(() {
        predictionResult = 'Prediction: $result';  // Update the prediction result
      });
    } else {
      setState(() {
        predictionResult = 'Failed to retrieve prediction';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Latitude and Longitude'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/galaxy.jpg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: latitudeController,
                  decoration: InputDecoration(
                    labelText: 'Latitude',
                    hintText: 'Enter latitude',
                    icon: Icon(Icons.location_on),
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: longitudeController,
                  decoration: InputDecoration(
                    labelText: 'Longitude',
                    hintText: 'Enter longitude',
                    icon: Icon(Icons.location_on),
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  
                    onPressed: () async {
          await getPollutionPrediction(); 
           // Call the method to get prediction
        
                    Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => PollutionPage()), // Replace YourScreen with the desired screen
);
                    // Handle form submission here
                    
                    // Perform actions with latitude and longitude values
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
