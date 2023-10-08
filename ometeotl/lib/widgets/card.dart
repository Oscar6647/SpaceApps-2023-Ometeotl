
import 'package:flutter/material.dart';

class ContentCard extends StatefulWidget {
  final String category;
  final IconData icon;
  final String thumbnailUrl;


  bool value = false;
  bool checkBoxValue = false;
  ContentCard({
    super.key,
    required this.category,
    required this.thumbnailUrl,
    required this.icon,
  });

  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
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
          image: AssetImage(widget.thumbnailUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(widget.icon, color: Colors.white, size: 20),
                      const SizedBox(width: 7),
                      Text(
                        widget.category,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      /*Checkbox(
                        checkColor: Colors.white,
                        value: widget.checkBoxValue,
                        onChanged: (bool? value) {
                          if (value != null) {
                            setState(() {
                              widget.checkBoxValue = value;
                            });
                          }
                        },
                      )*/
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}