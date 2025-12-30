import 'package:flutter/material.dart';
import 'package:cmsapp/data/constants/constants.dart';
import 'package:cmsapp/old/graphs/health_details.dart';
import 'package:cmsapp/util/responsive.dart';
import 'package:cmsapp/old/graph_widgets/custom_card_widget.dart';

class ActivityDetailsCard extends StatelessWidget {
  const ActivityDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final healthDetails = HealthDetails();

    return GridView.builder(
      itemCount: healthDetails.healthData.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
        crossAxisSpacing: Responsive.isMobile(context) ? 12 : 15,
        mainAxisSpacing: 12.0,
      ),

      itemBuilder:
          (context, index) => CustomCardWidget(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Image.asset(
                  healthDetails.healthData[index].icon,
                  width: iconSize,
                  height: iconSize,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    healthDetails.healthData[index].value,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                Text(
                  healthDetails.healthData[index].title,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

//36:43
