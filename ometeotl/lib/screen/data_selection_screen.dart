import 'package:flutter/material.dart';
import 'package:ometeotl/screen/home.dart';
import 'package:ometeotl/widgets/pollution_card.dart';
import 'package:ometeotl/widgets/rainbox_card.dart';
import 'package:ometeotl/widgets/water_card.dart';


class InfoHub extends StatelessWidget {
  const InfoHub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage("assets/fondoWelcome.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.blueAccent.withOpacity(0.3),
                  BlendMode.srcOver,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, left: 10.0),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "Back",
                          style: TextStyle(
                              fontFamily: "Manrope",
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: HomePage(),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff151515),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: .8,
                              blurRadius: 4,
                              offset: Offset(1, 2),
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 8.0, right: 8.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Data for: 24/09/23",
                                      style: TextStyle(
                                        fontFamily: "Manrope",
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 1200,
                                  child: GridView(
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 300,
                                      childAspectRatio: 1,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                    ),
                                    children:  [
                                      RainBoxCard(
                                        text: "Rain Forecast",
                                        // icon: Icons.thunderstorm,
                                        image: "assets/water.jpg",
                                      ),
                                      const PollutionBoxCard(
                                        text: "Pollution",
                                        icon: Icons.factory,
                                        image: "assets/pollution.jpg",
                                      ),
                                      /*PandemicBoxCard(
                                        text: "COVID-19",
                                        icon: Icons.coronavirus,
                                        image: "assets/covid.jpg",
                                      ),*/
                                      const WaterBoxCard(
                                        text: "Water Flow",
                                        icon: Icons.water_drop,
                                        image: "assets/supplywater.jpg",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}