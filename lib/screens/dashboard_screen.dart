// lib/screens/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/widgets/reusable_bg.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Dashboard'),
      // ),
      body: Center(
        child: ReusableBG(
          content: Column(children: [
            Text('Welcome to the Dashboard!'),
            SvgPicture.asset(
              'assets/images/logo.svg',
              fit: BoxFit.cover, // Make it cover the whole screen
              width: 40,
              height: 40,
            ),
            Container(
              width: double.infinity, // Set a width
              height: 300, // Set a height
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .scaffoldBackgroundColor, // Background color for the container
                borderRadius:
                    BorderRadius.circular(10), // Optional: for rounded corners
              ),
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                      leftTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: true))),
                  borderData: FlBorderData(show: true),
                  minX: 0,
                  maxX: 6,
                  minY: 0,
                  maxY: 6,
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 1),
                        FlSpot(1, 3),
                        FlSpot(2, 2),
                        FlSpot(3, 5),
                        FlSpot(4, 1),
                        FlSpot(5, 4),
                      ],
                      isCurved: true,
                      color: Theme.of(context).primaryColor,
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity, // Set a width
              height: 300, // Set a height
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .scaffoldBackgroundColor, // Background color for the container
                borderRadius:
                    BorderRadius.circular(10), // Optional: for rounded corners
              ),
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceEvenly,
                  barTouchData: BarTouchData(enabled: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    // bottomTitles: AxisTitles(
                    //   sideTitles: SideTitles(showTitles: true),
                    // ),
                    topTitles: AxisTitles(
                      sideTitles:
                          SideTitles(showTitles: false), // Hide top titles
                    ),
                    rightTitles: AxisTitles(
                      sideTitles:
                          SideTitles(showTitles: false), // Hide right titles
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          String title;
                          switch (value.toInt()) {
                            case 0:
                              title = 'Category A';
                            case 1:
                              title = 'Category B';
                            case 2:
                              title = 'Category C';
                            case 3:
                              title = 'Category D';
                            case 4:
                              title = 'Category E';
                            default:
                              title = 'Category A';
                          }
                          return SizedBox(
                              width: 45, // Set a fixed width for the container
                              child: Transform.rotate(
                                  angle: -pi / 4, // Rotate text by -45 degrees
                                  child: Text(
                                    title,
                                    maxLines: 1, // Limit to 2 lines
                                    overflow:
                                        TextOverflow.ellipsis, // Add ellipsis
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12,
                                    ),
                                  )));
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border(
                      left: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 1), // Left border
                      bottom: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 1), // Bottom border
                      top: BorderSide(
                          color: Colors.transparent,
                          width: 0), // Hide top border
                      right: BorderSide(
                          color: Colors.transparent,
                          width: 0), // Hide right border
                    ),
                  ),
                  gridData: FlGridData(show: false),
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [
                      BarChartRodData(toY: 8, color: Colors.blue),
                    ]),
                    BarChartGroupData(x: 1, barRods: [
                      BarChartRodData(toY: 6, color: Colors.red),
                    ]),
                    BarChartGroupData(x: 2, barRods: [
                      BarChartRodData(toY: 5, color: Colors.green),
                    ]),
                    BarChartGroupData(x: 3, barRods: [
                      BarChartRodData(toY: 7, color: Colors.orange),
                    ]),
                    BarChartGroupData(x: 4, barRods: [
                      BarChartRodData(toY: 3, color: Colors.purple),
                    ]),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
