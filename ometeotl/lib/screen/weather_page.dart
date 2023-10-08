import 'package:flutter/material.dart';
import 'package:ometeotl/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ometeotl/screen/forms_screen.dart';

class WeatherPage extends StatefulWidget {
   final String predictionValue; 
   final String recommendationValue; 

  const WeatherPage({Key? key, required this.predictionValue, required this.recommendationValue}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  List<Widget> carouselItems = [
    Image.asset('/cuau1.png'),
    Image.asset('/cuau2.png'),
    Image.asset('/cuau3.png'),
    // Add more images as needed
  ];

  List<Widget> _buildCards() {
    return [
      _buildCard(
        color: widgetColor,
        text: 'Temperature',
        description: 'Current temperature',
        index: 1,
        icon: Icons.thermostat,
        data: "data",
      ),
      _buildCard(
          color: widgetColor,
          text: 'Wet Bulb Temp',
          description: 'Moistened thermometer temperature',
          index: 2,
          icon: Icons.dew_point,
          data: "21"),
      _buildCard(
          color: widgetColor, // Change color to purple
          text: 'Earth Surf Temp', // Change text to "Recomendaciones de Ahorro"
          description: 'Earth surface temperature',
          index: 3, // Update the index if needed
          icon: Icons.thermostat_auto,
          data: "920"),
      _buildCard(
          color: widgetColor,
          text: 'Specific humidity', // Change text to "Mi Inversión"
          description: 'Total water in the atmosphere',
          index: 4, // Update the index if needed
          icon: Icons.water_drop,
          data: "920"),
      _buildCard(
          color: widgetColor,
          text: "Relative humidity",
          description: widget.predictionValue,
          index: 5,
          icon: Icons.water_drop_sharp,
          data: "12"),
      _buildCard(
          color: widgetColor,
          text: "Precipitation",
          description: 'Precipitation risk',
          index: 6,
          icon: Icons.storm,
          data: widget.predictionValue
),
      _buildCard(
          color: widgetColor,
          text: "Surface Pressure",
          description: 'Surface pressure',
          index: 7,
          icon: Icons.compare_arrows,
          data: "83"),
      _buildCard(
          color: widgetColor,
          text: "Wind Speed (2m)",
          description: 'Speed in a 2m radius',
          index: 8,
          icon: Icons.air,
          data: "83"),
      _buildCard(
          color: widgetColor,
          text: "Wind Speed (10m)",
          description: 'Speed in a 10m radius',
          index: 6,
          icon: Icons.air_sharp,
          data: "83"),
      _buildCard(
          color: widgetColor,
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
      required String description}) {
    return GestureDetector(
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
                  overflow: TextOverflow.ellipsis,
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
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/clouds.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Weather'),
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
                    MaterialPageRoute(builder: (context) => FormsScreen()));
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
                  'Precipitation, hail and flood risk',
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
                    color: widgetColor,
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
