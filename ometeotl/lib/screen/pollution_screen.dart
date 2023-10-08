import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ometeotl/widgets/graph.dart';
import 'package:ometeotl/widgets/small_card.dart';

class PollutionPage extends StatefulWidget {
  const PollutionPage({Key? key}) : super(key: key);

  @override
  _PollutionPageState createState() => _PollutionPageState();
}

class _PollutionPageState extends State<PollutionPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/pollutionPage.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.3), // Add opacity
        appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(0.3),
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Pollution',
              style: TextStyle(color: Colors.white),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                // Handle home button press (e.g., navigate to home page)
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Handle settings button press
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
                  'Air Quality',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 20),
                CarouselSlider.builder(
                  itemCount: 3,
                  options: CarouselOptions(
                    height: 250.0, // Adjust the height as needed
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    enlargeCenterPage: true, // One image per slide
                    enableInfiniteScroll: true,
                  ),
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: ClipRRect(
                        // Add ClipRRect for rounded borders
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.asset(
                          "assets/satelite.jpg", // Update image asset path
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: AirQualityGraph(
                    dataPoints: [
                      20,
                      40,
                      60,
                      80,
                      60,
                      40,
                      20
                    ], // Replace with your air quality data
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmallCard(
              icon: Icons.star,
              text: 'Rating',
              percentage: 4.5,
            ),
            SizedBox(height: 16.0), // Add spacing between cards if needed
            SmallCard(
              icon: Icons.favorite,
              text: 'Likes',
              percentage: 85.0,
            ),

              ])
              ,
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recommendations:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('• Recommendation 1'),
                      Text('• Recommendation 2'),
                      Text('• Recommendation 3'),
                      Text('• Recommendation 4'),
                    ],
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
