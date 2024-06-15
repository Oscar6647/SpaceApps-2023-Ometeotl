import 'package:http/http.dart' as http;
import 'dart:convert';

fetchData(String url) async {
  final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

      );
      Map<String, dynamic> data = json.decode(response.body);
      int temp = data['temperature'];
      int humidity = data['humidity'];

      Map<String,int> tempHum = {'temp': temp, 'humidity': humidity};
      print(data);

  return tempHum;


}
