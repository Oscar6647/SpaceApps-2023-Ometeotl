import 'package:flutter/material.dart';

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
              MaterialPageRoute(builder: (context) => const ManageHomePage()));
          break;
        case 1:
          // Navigate to 'Rewards' page
          // You can replace 'RewardsPage' with the actual widget for this page
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const RewardsPage()));
          break;
        case 2:
          // Navigate to 'Comparte' page
          // You can replace 'CompartePage' with the actual widget for this page
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CommunityPage()));
          break;
      }
    });
  }
List<Widget> _buildCards() {
  return [
    _buildCard(
      color: const Color.fromARGB(255, 255, 231, 179),
      text: 'Tips de ahorro',
      index: 1,
    ),
    _buildCard(
      color: const Color.fromARGB(255, 255, 231, 179),
      text: 'Predicción de consumo',
      index: 2,
    ),
    _buildCard(
      color: const Color.fromARGB(255, 255, 231, 179), // Change color to purple
      text: 'Mi cuenta', // Change text to "Recomendaciones de Ahorro"
      index: 3, // Update the index if needed
    ),
    _buildCard(
      color: const Color.fromARGB(255, 255, 231, 179),
      text: 'Mi Inversión', // Change text to "Mi Inversión"
      index: 4, // Update the index if needed
    ),
    _buildCard(
      color: const Color.fromARGB(255, 255, 231, 179), 
      text: "Sync con dispositivo", 
      index: 5,
    )
  ];
}

Future<void> signOut() async {
  await Auth().signOut();
}

  Widget _buildCard(
      {required Color color, required String text, required int index}) {
    return GestureDetector(
      onTap: () {
        if (index == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const GraphScreen()));
        } 
        if(index == 3){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SettingsPage()));
        }
        if(index == 4){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const InversionPage()));
        }
        if(index == 5){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LightBulbPage()));
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
              color: Colors.black, // Text color
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
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 199, 14, 14),
            Color.fromARGB(255, 247, 201, 76)
          ],
          stops: [0, 1],
          begin: AlignmentDirectional(0.87, -1),
          end: AlignmentDirectional(-0.87, 1),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Resourcify'),
          ),
          actions: [
            IconButton(onPressed: signOut, icon: const Icon(Icons.logout)),
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
              const SizedBox(height: 20),
              const Text(
                'Echale un vistazo!',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return _buildCards(
                   
                  )[index+3];
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Consumo de Energía por Día (GWh)',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Handle list item click here
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const HomePage()));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 231, 179), // Background color
                          borderRadius:
                              BorderRadius.circular(16), // Rounded borders
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.flash_on), // Electricity ray icon
                          title: Text('Día ${index + 1}'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    );
                  },
                ),
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