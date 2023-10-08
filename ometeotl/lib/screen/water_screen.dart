
import 'package:flutter/material.dart';
import 'package:ometeotl/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ometeotl/fetch.dart';
import 'package:ometeotl/screen/data_selection_screen.dart';
import 'package:ometeotl/screen/explain_screen.dart';
import 'package:ometeotl/screen/forms_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class WaterPage extends StatefulWidget {
  const WaterPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WaterPageState createState() => _WaterPageState();
}

class _WaterPageState extends State<WaterPage> {
  List<Widget> carouselItems = [
    Image.asset('assets/satelite.jpg'),
    Image.asset('assets/satelite2.jpg'),
    Image.asset('assets/satelite3.jpg'),
    // Add more images as needed
  ];


  List<Widget> _buildCards()  {
    int temp = 0;
    int humidity = 0;
    int wetBulbTemp;

    const url = 'https://spaceapps-ometeotl-2023.uc.r.appspot.com/';
        fetchData(String url) async {
          final response = await http.get(
              Uri.parse(url),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },

              );
              Map<String, dynamic> info = json.decode(response.body);
              temp = info['temperature'];
              humidity = info['humidity'];
              // wetBulbTemp = info['wetBulbTemp'];
              print(temp);

        }

        fetchData(url);
    return [
      _buildCard(
        color: widgetColorLight,
        text: 'Temperature',
        description: 'Current temperature',
        index: 1,
        icon: Icons.thermostat,
        data: temp.toString(),
      ),
      _buildCard(
          color: widgetColorLight,
          text: 'Wet Bulb Temp',
          description: 'Moistened thermometer temperature',
          index: 2,
          icon: Icons.dew_point,
          data: "21"),
      _buildCard(
          color: widgetColorLight, // Change color to purple
          text: 'Earth Surf Temp', // Change text to "Recomendaciones de Ahorro"
          description: 'Earth surface temperature',
          index: 3, // Update the index if needed
          icon: Icons.thermostat_auto,
          data: "920"),
      _buildCard(
          color: widgetColorLight,
          text: 'Specific humidity', // Change text to "Mi Inversión"
          description: 'Total water in the atmosphere',
          index: 4, // Update the index if needed
          icon: Icons.water_drop,
          data: humidity.toString()),
      _buildCard(
          color: widgetColorLight,
          text: "Relative humidity",
          description: 'Humidity according to atmosphere capacity',
          index: 5,
          icon: Icons.water_drop_sharp,
          data: "12"),
      _buildCard(
          color: widgetColorLight,
          text: "Precipitation",
          description: 'Precipitation risk',
          index: 6,
          icon: Icons.storm,
          data: "83"),
      _buildCard(
          color: widgetColorLight,
          text: "Surface Pressure",
          description: 'Surface pressure',
          index: 7,
          icon: Icons.compare_arrows,
          data: "83"),
      _buildCard(
          color: widgetColorLight,
          text: "Wind Speed (2m)",
          description: 'Speed in a 2m radius',
          index: 8,
          icon: Icons.air,
          data: "83"),
      _buildCard(
          color: widgetColorLight,
          text: "Wind Speed (10m)",
          description: 'Speed in a 10m radius',
          index: 6,
          icon: Icons.air_sharp,
          data: "83"),
      _buildCard(
          color: widgetColorLight,
          text: "Wind direction",
          description: 'Wind direction',
          index: 9,
          icon: Icons.air,
          data: "83"),
    ];
  }

  Widget _buildCard(
      {required Color color,
      required String text,
      required int index,
      required IconData icon,
      required String data,
      required String description,
      
      }
      ) {
    return GestureDetector(
      
      onTap: () {
        const url = 'https://spaceapps-ometeotl-2023.uc.r.appspot.com/';
        fetchData(String url) async {
          final response = await http.get(
              Uri.parse(url),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },

              );
              Map<String, dynamic> info = json.decode(response.body);
              int temp = info['temperature'];
              int humidity = info['humidity'];

              print(temp);

        }

        fetchData(url);
        // print(info);

      },
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0), // Rounded borders
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    text,
                    textWidthBasis: TextWidthBasis.parent,
                    textAlign: TextAlign.left,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Text color
                    ),
                  ),
                  Text(
                    description,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  data,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        'Mexico',
                        textAlign: TextAlign.left,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.white, // Text color
                        ),
                      )),
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage("/water2.jpeg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6),
            BlendMode.darken,
          ), // Set the opacity value here)),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Water'),
          ),
          actions: [
            //IconButton(onPressed: , icon: const Icon(Icons.logout)),
            IconButton(
              icon: const Icon(Icons.message),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FormsScreen()), // Replace YourScreen with the desired screen
                );
              },
            ),

            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const WaterPage()));
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Water data',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                            color: Colors.black,
                            offset: Offset(1, 1),
                            blurRadius: 2)
                      ]),
                ),
                const SizedBox(height: 20),
                CarouselSlider(
                  items: carouselItems,
                  options: CarouselOptions(
                    height: 200, // Adjust the height as needed
                    aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
                    viewportFraction:
                        0.8, // Adjust the fraction of the viewport
                    initialPage: 0, // Set the initial page
                    enableInfiniteScroll:
                        true, // Set to false to disable infinite scrolling
                    autoPlay: true, // Set to true to enable auto-play
                    autoPlayInterval:
                        const Duration(seconds: 3), // Auto-play interval
                    autoPlayAnimationDuration: const Duration(
                        milliseconds: 800), // Auto-play animation duration
                    autoPlayCurve: Curves.fastOutSlowIn, // Auto-play curve
                    enlargeCenterPage:
                        true, // Set to true to make the center item larger
                    onPageChanged: (index, reason) {
                      // Callback function for when the page changes
                      // You can use this to update the UI based on the current page.
                    },
                  ),
                ),
                const SizedBox(height: 30),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return _buildCards()[index];
                  },
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: const Card(
                    color: widgetColorLight,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Text(
                      'Recommendations',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
