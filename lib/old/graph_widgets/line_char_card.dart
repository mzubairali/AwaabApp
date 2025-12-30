/*
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:cmsapp/data/constants/constants.dart';
import 'package:cmsapp/views/widgets/custom_card_widget.dart';
import 'package:cmsapp/data/line_chart_data.dart';

class LineCharCard extends StatelessWidget {
  const LineCharCard({super.key});

  @override
  Widget build(BuildContext context) {
    final data = LineData();

    return CustomCardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "News Details",
            //textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              //backgroundColor: Colors.grey,
            ),
          ),

          const SizedBox(height: 5),

          AspectRatio(
            aspectRatio: 16 / 6,

            child: LineChart(
              LineChartData(
                lineTouchData: LineTouchData(handleBuiltInTouches: true),
                gridData: FlGridData(show: false),

                titlesData: FlTitlesData(
                  //right side of graph
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  //top side of graph
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: true),
                  ),

                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,

                      getTitlesWidget: (double value, TitleMeta metaa) {
                        return data.bottomTitle[value.toInt()] != null
                            ? SideTitleWidget(
                              //axisSide: meta.axisSide,
                              meta: metaa,
                              child: Text(
                                data.bottomTitle[value.toInt()].toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[400],
                                ),
                              ),
                            )
                            : const SizedBox();
                      },
                    ),
                  ),

                  leftTitles: AxisTitles(
                    //drawBelowEverything: true,
                    sideTitles: SideTitles(
                      getTitlesWidget: (double value, TitleMeta meta) {
                        return data.leftTitle[value.toInt()] != null
                            ? Text(
                              data.leftTitle[value.toInt()].toString(),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[400],
                              ),
                            )
                            : const SizedBox();
                      },
                      showTitles: true,
                      interval: 1,
                      reservedSize: 40,
                    ),
                  ),
                ),

                borderData: FlBorderData(show: true),
                lineBarsData: [
                  LineChartBarData(
                    color: selectionColor,
                    barWidth: 2.5,
                    belowBarData: BarAreaData(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          //selectionColor.withOpacity(0.5),
                          selectionColor.withAlpha(100),
                          Colors.transparent,
                        ],
                      ),
                      show: true,
                    ),
                    dotData: FlDotData(show: true),
                    spots: data.spots,
                  ),
                ],

                minX: 0,
                maxX: 110,
                //minY: 105,
                //maxY: -5,
                minY: 0,
                maxY: 110,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/
