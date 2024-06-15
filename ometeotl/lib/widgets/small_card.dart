import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final double percentage;

  SmallCard({
    required this.icon,
    required this.text,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0), // Increased padding for more size
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3), // Transparent background with opacity
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 48.0, // Increased icon size
            color: Colors.white, // Icon color
          ),
          SizedBox(height: 12.0), // Increased spacing
          Text(
            text,
            style: TextStyle(
              fontSize: 18.0, // Increased text size
              fontWeight: FontWeight.bold,
              color: Colors.white, // Text color
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            '${percentage.toStringAsFixed(1)}%',
            style: TextStyle(
              fontSize: 16.0, // Increased text size
              color: Colors.white, // Text color
            ),
          ),
        ],
      ),
    );
  }
}
