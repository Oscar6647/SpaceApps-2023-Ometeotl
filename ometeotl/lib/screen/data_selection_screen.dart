import 'package:flutter/material.dart';
import 'package:ometeotl/screen/home.dart';
import 'package:ometeotl/screen/pollution_screen.dart';
import 'package:ometeotl/widgets/card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
//        backgroundColor: Colors.transparent,
        backgroundColor: const Color(0x44000000),
        elevation: 20,
        title: const Text("Select Data"),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/galaxy.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5), // Set the opacity value here
              BlendMode.darken,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 90),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 45,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            HomePage(), // Replace RainForecastScreen with the desired screen
                      ),
                    );
                  },
                  child: ContentCard(
                    category: 'Weather Forecast',
                    thumbnailUrl: 'assets/weather.jpg',
                    icon: Icons.thunderstorm,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PollutionPage(), 
                      ),
                    );
                  },
                  child: ContentCard(
                    category: 'Pollution',
                    thumbnailUrl: 'assets/pollution.jpg',
                    icon: Icons.factory,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const HomePage(), 
                      ),
                    );
                  },
                  child: ContentCard(
                    category: 'Water Flow',
                    thumbnailUrl: 'assets/water.jpg',
                    icon: Icons.water_drop,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                      {}
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          /*Text(
                            "Next",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),*/
                          SizedBox(
                            width: 10,
                          ),
                          /*Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),*/
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
