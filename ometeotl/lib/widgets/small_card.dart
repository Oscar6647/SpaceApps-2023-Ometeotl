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
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7), // Transparent background with opacity
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 36.0,
            color: Colors.white, // Icon color
          ),
          SizedBox(height: 8.0),
          Text(
            text,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Text color
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            '${percentage.toStringAsFixed(1)}%',
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.white, // Text color
            ),
          ),
        ],
      ),
    );
  }
}
