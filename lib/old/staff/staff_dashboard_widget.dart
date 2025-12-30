//import 'package:cmsapp/data/staff/staff_settings/staff_settings_screen.dart';
import 'package:cmsapp/data/screens/staff_screens/staff_settings/staff_settings_screen.dart';
import 'package:flutter/material.dart';
//import 'package:cmsapp/data/staff/staff_summary_widget.dart';
//import 'package:cmsapp/util/responsive.dart';
import 'package:cmsapp/old/graph_widgets/activity_details_card.dart';
import 'package:cmsapp/views/widgets/header_widget.dart';

class StaffDashboardWidget extends StatelessWidget {
  const StaffDashboardWidget({super.key, required this.screen});

  final int screen;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        //padding: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            //SizedBox(child: Text('in the dashboard $screen')),
            //search bar
            const SizedBox(height: 18),
            const HeaderWidget(),
            //activity detail cards
            const SizedBox(height: 18),

            //const StaffSettingsScreen(),
            //const ActivityDetailsCard(),
            //line chart card
            const SizedBox(height: 18),
            //const LineCharCard(),
            //bargraph card
            const SizedBox(height: 18),

            //const BarGraphCard(),
            //const SizedBox(height: 18),
            //if (Responsive.isTablet(context)) const StaffSummaryWidget(),
            if (screen == 1) const ActivityDetailsCard(),
            if (screen == 7) const StaffSettingsScreen(),
          ],
        ),
      ),
    );
  }
}
