import 'package:flutter/material.dart';
import 'package:ometeotl/screen/pollution_screen.dart';

class LocationFormScreen extends StatefulWidget {
  @override
  _LocationFormScreenState createState() => _LocationFormScreenState();
}

class _LocationFormScreenState extends State<LocationFormScreen> {
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();

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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                             PollutionPage(), 
                      ),
                    );
                    // Handle form submission here
                    String latitude = latitudeController.text;
                    String longitude = longitudeController.text;
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
