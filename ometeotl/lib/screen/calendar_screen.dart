import 'package:flutter/material.dart';
import 'package:ometeotl/constants.dart';
import 'package:ometeotl/screen/data_selection_screen.dart';
import 'package:ometeotl/screen/home.dart';
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
                    decoration: const InputDecoration(
                      labelText: 'Select Date',
                      hintText: 'Tap to select a date',
                      suffixIcon: Icon(Icons.calendar_today, color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white), // Set border color
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white), // Set border color when focused
                      ),
                      labelStyle: TextStyle(color: Colors.white), // Set label color
                      hintStyle: TextStyle(color: Colors.grey), // Set hint color
                    ),
                    style: const TextStyle(color: Colors.white), // Set text content color
                  ),
                ),
              ],
            ),
                        ElevatedButton(
              onPressed: () {
                // Convert the selected date to JSON format
                final selectedDateJson = {
                  'year': selectedDate.year,
                  'month': selectedDate.month,
                  'day': selectedDate.day,
                };
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DataSelection()),
                );

                // Now you can send `selectedDateJson` to your Flask API
                print(selectedDateJson);

                // Replace this with the code to send the JSON data to your API
                // For example, you can call `fetchPrediction(selectedDateJson)` here
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Rounded borders
                ),
                primary: paleteLightBlue, // Light blue gradient
                padding: EdgeInsets.all(20.0), // Larger size
              ),
              child: const Text(
                'Send',
                style: TextStyle(fontSize: 18.0), // Larger font size
              ),
            ),
          ],
        ),
      ),
    );
  }
}