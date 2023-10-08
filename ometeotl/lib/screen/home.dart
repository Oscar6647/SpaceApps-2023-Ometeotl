import 'package:flutter/material.dart';
import 'package:ometeotl/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
          break;
        case 1:
          // Navigate to 'Rewards' page
          // You can replace 'RewardsPage' with the actual widget for this page
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
          break;
        case 2:
          // Navigate to 'Comparte' page
          // You can replace 'CompartePage' with the actual widget for this page
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
          break;
      }
    });
  }

  List<Widget> _buildCards() {
    return [
      _buildCard(
        color: widgetColor,
        text: 'Tips de ahorro',
        index: 1,
      ),
      _buildCard(
        color: widgetColor,
        text: 'Predicción de consumo',
        index: 2,
      ),
      _buildCard(
        color: widgetColor, // Change color to purple
        text: 'Mi cuenta', // Change text to "Recomendaciones de Ahorro"
        index: 3, // Update the index if needed
      ),
      _buildCard(
        color: widgetColor,
        text: 'Mi Inversión', // Change text to "Mi Inversión"
        index: 4, // Update the index if needed
      ),
      _buildCard(
        color: widgetColor,
        text: "Sync con dispositivo",
        index: 5,
      )
    ];
  }

  Widget _buildCard(
      {required Color color, required String text, required int index}) {
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
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white, // Text color
            ),
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
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Precipitación, granizo e inundación',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                child: Card(
                    color: widgetColor,
                    child: AspectRatio(
                    aspectRatio: 12/9,
                    child: Image.asset("/clouds.jpg")
                ),    
                )      
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return _buildCards()[index];
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.light),
              label: 'My Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events),
              label: 'Rewards',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Comparte"),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
