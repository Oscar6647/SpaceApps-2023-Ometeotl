import 'package:flutter/material.dart';
import 'package:ometeotl/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//       switch (index) {
//         case 0:
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => const HomePage()));
//           break;
//         case 1:
//           // Navigate to 'Rewards' page
//           // You can replace 'RewardsPage' with the actual widget for this page
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => const HomePage()));
//           break;
//         case 2:
//           // Navigate to 'Comparte' page
//           // You can replace 'CompartePage' with the actual widget for this page
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => const HomePage()));
//           break;
//       }
//     });
//   }

  List<Widget> carouselItems = [
    Image.asset('assets/satelite.jpg'),
    Image.asset('assets/satelite2.jpg'),
    Image.asset('assets/satelite3.jpg'),
    // Add more images as needed
  ];

  List<Widget> _buildCards() {
    return [
      _buildCard(
        color: widgetColor,
        text: 'Tips de ahorro',
        index: 1,
        icon: Icons.water_drop,
        data: "data",
      ),
      _buildCard(
          color: widgetColor,
          text: 'Predicción de consumo',
          index: 2,
          icon: Icons.cloud,
          data: "21"),
      _buildCard(
          color: widgetColor, // Change color to purple
          text: 'Mi cuenta', // Change text to "Recomendaciones de Ahorro"
          index: 3, // Update the index if needed
          icon: Icons.water_drop,
          data: "920"),
      _buildCard(
          color: widgetColor,
          text: 'Mi Inversión', // Change text to "Mi Inversión"
          index: 4, // Update the index if needed
          icon: Icons.water_drop,
          data: "920"),
      _buildCard(
          color: widgetColor,
          text: "Sync con dispositivo",
          index: 5,
          icon: Icons.water_drop,
          data: "12"),
      _buildCard(
          color: widgetColor,
          text: "Sync con dispositivo",
          index: 6,
          icon: Icons.water_drop,
          data: "83"),
    ];
  }

  Widget _buildCard(
      {required Color color,
      required String text,
      required int index,
      required IconData icon,
      required String data}) {
    return GestureDetector(
      onTap: () {
        if (index == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        }
        if (index == 3) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        }
        if (index == 4) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        }
        if (index == 5) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        }
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
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  Text(
                    text,
                    textWidthBasis: TextWidthBasis.parent,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Text color
                    ),
                  ),
                ],
              ),
              Text(
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
              const Text(
                'Mexico',
                textAlign: TextAlign.left,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.white, // Text color
                ),
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
          image: AssetImage("/clouds.jpg"),
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
              icon: const Icon(Icons.home),
              onPressed: () {
                // Handle home button press (e.g., navigate to home page)
              },
            ),

            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
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
                  itemCount: 6,
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
