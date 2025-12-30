import 'package:flutter/material.dart';
//import 'package:cmsapp/data/constants/constants.dart';
//import 'package:cmsapp/views/widgets/pie_chart_widget.dart';
//import 'package:cmsapp/views/graph_widgets/scheduled_widget.dart';
import 'package:cmsapp/old/staff/staff_summary_details.dart';

class StaffSummaryWidget extends StatelessWidget {
  const StaffSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Column(
        children: [
          SizedBox(height: 20),
          //Chart(),
          Text(
            "Staff Summary",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.cyan,
            ),
          ),
          SizedBox(height: 16),
          Padding(padding: EdgeInsets.all(20.0), child: StaffSummaryDetails()),
          SizedBox(height: 40),
          //Scheduled(),
        ],
      ),
    );
  }
}
