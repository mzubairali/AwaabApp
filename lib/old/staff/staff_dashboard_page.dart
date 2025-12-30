import 'package:cmsapp/old/staff/staff_side_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:cmsapp/old/staff/staff_dashboard_widget.dart';
import 'package:cmsapp/util/responsive.dart';
//import 'package:cmsapp/data/staff/staff_summary_widget.dart';

class StaffDashboardPage extends StatelessWidget {
  const StaffDashboardPage({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      drawer:
          !isDesktop
              ? const SizedBox(width: 250, child: StaffSideMenuWidget())
              : null,
      /*
      endDrawer:
          Responsive.isMobile(context)
              ? SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const StaffSummaryWidget(),
              )
              : null,
*/
      body: SafeArea(
        child: Row(
          children: [
            if (isDesktop)
              Expanded(flex: 2, child: SizedBox(child: StaffSideMenuWidget())),
            //Expanded(flex: 7, child: StaffDashboardWidget()),
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Text(
                    'Staff ( $title )',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 25,
                    ),
                  ),

                  //Title(color: Colors.blue, child: Text('Tenant')),
                  StaffDashboardWidget(screen: 1),
                ],
              ),
            ),

            //if (isDesktop) Expanded(flex: 3, child: StaffSummaryWidget()),
          ],
        ),
      ),
    );
  }

  //dashboardWidget() {}
}
