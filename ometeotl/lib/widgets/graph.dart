import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AirQualityGraph extends StatelessWidget {
  final List<double> dataPoints; // Replace with your air quality data

  AirQualityGraph({required this.dataPoints});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7), // Transparent background with opacity
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Air Quality Graph',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Text color
            ),
          ),
          SizedBox(height: 10),
          AspectRatio(
            aspectRatio: 1.5, // Adjust the aspect ratio as needed
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: true),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(
                    color: const Color(0xff37434d),
                    width: 1,
                  ),
                ),
                minX: 0,
                maxX: dataPoints.length.toDouble() - 1,
                minY: 0,
                maxY: 100, // Adjust the maximum value on the Y-axis
                lineBarsData: [
                  LineChartBarData(
                    spots: dataPoints.asMap().entries.map((entry) {
                      return FlSpot(
                        entry.key.toDouble(),
                        entry.value,
                      );
                    }).toList(),
                    isCurved: true,
                    color: Colors.white,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
