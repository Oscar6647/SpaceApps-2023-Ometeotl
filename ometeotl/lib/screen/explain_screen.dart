import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ometeotl/screen/data_selection_screen.dart';


class ExplainScreen extends StatefulWidget {
  const ExplainScreen({Key? key}) : super(key: key);

  @override
  State<ExplainScreen> createState() => _ExplainScreenState();
}

class _ExplainScreenState extends State<ExplainScreen> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          PageScreen(
            backgroundImage: const AssetImage("assets/satelite.jpg"),
            pageController: pageController,
            titleText: "Welcome",
            descriptionText: "Easily access Earth data. Anytime, anywhere",
            icon: Icons.map,
            nextPage: 1,
            goNextPage: false,
          ),
          PageScreen(
            backgroundImage: const AssetImage("assets/satelite2.jpg"),
            pageController: pageController,
            titleText: "Discover",
            descriptionText: "Learn new information about our planet",
            icon: Icons.cloud,
            nextPage: 2,
            goNextPage: false,
          ),
          PageScreen(
            backgroundImage: const AssetImage("assets/satelite3.jpg"),
            pageController: pageController,
            titleText: "Made for everyone",
            descriptionText: "Fiter information that's relevant to you",
            icon: Icons.people,
            nextPage: 3,
            goNextPage: true,
          ),
        ],
      ),
    );
  }
}

class PageScreen extends StatelessWidget {
  final String titleText;
  final String descriptionText;
  final IconData icon;
  final int nextPage;
  final PageController pageController;
  final bool goNextPage;
   final AssetImage backgroundImage;

  const PageScreen({
    super.key,
    required this.pageController,
    required this.titleText,
    required this.descriptionText,
    required this.icon,
    required this.nextPage,
    required this.goNextPage,
    required this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
         image: DecorationImage(
          image: backgroundImage, // Set the background image here
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
      Colors.black.withOpacity(0.6), // Set the opacity value here
      BlendMode.darken,
    ),
         )
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 50.0,
                  right: 50.0,
                  top: MediaQuery.of(context).size.height / 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Icon(
                    icon,
                    size: (MediaQuery.of(context).size.height / 5),
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      titleText,
                      style: GoogleFonts.sourceSans3(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      descriptionText,
                      style: GoogleFonts.sourceSans3(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        Curve curve = Curves.ease;
                        goNextPage
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                 
                                    builder: (context) => const HomeScreen()))
                            : {
                                pageController.animateToPage(nextPage,
                                    duration: const Duration(milliseconds: 500),
                                    curve: curve)
                              };
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Next",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const Image(
                    alignment: Alignment.bottomCenter,
                    height: 150,
                    image: AssetImage("assets/logoChanged.png"),
                    fit: BoxFit.contain,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}