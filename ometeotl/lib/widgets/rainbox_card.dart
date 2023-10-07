import 'dart:math';

import 'package:flutter/material.dart';

class RainBoxCard extends StatefulWidget {
  final String text;
  final String image;

  RainBoxCard({
    super.key,
    required this.text,
    required this.image,
  });

  @override
  State<RainBoxCard> createState() => _RainBoxCardState();
}

class _RainBoxCardState extends State<RainBoxCard> {
  late IconData icon;

  late int number;

  String filterRain() {
    String rainTextDescription = "";

    if (number == 0) {
      print("Selected 0");
      setState(() {
        rainTextDescription = "It is sunny outside";
        icon = Icons.sunny;
      });
      rainTextDescription;
    } else if (number == 1) {
      print("Selected 1");
      setState(() {
        rainTextDescription = "It is raining, be careful";
        icon = Icons.water_drop;
      });
      rainTextDescription;
    } else if (number == 2) {
      print("Selected 2");
      setState(() {
        rainTextDescription = "There is a big storm, don't go outside";
        icon = Icons.storm;
      });
      rainTextDescription;
    }
    print(rainTextDescription);
    return rainTextDescription;
  }

  @override
  void initState() {
    super.initState();
    number = Random().nextInt(3 - 0);

    filterRain();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: const Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),
          image: AssetImage(widget.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.sunny, color: Colors.white, size: 20),
                const SizedBox(width: 7),
                Flexible(
                  child: Text(
                    widget.text,
                    overflow: TextOverflow.visible,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 18,
                ),
                const SizedBox(
                  width: 7,
                ),
                Flexible(
                  child: Text(
                    filterRain(),
                    overflow: TextOverflow.visible,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}