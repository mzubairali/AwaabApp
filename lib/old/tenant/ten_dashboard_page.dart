import 'package:flutter/material.dart';
import 'package:cmsapp/old/tenant/ten_dashboard_widget.dart';
import 'package:cmsapp/util/responsive.dart';
import 'package:cmsapp/old/tenant/ten_side_menu_widget.dart';

class TenantDashboardPage extends StatelessWidget {
  const TenantDashboardPage({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      drawer:
          !isDesktop
              ? const SizedBox(width: 250, child: TenantSideMenuWidget())
              : null,
      /*
      endDrawer:
          Responsive.isMobile(context)
              ? SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const TenantSummaryWidget(),
              )
              : null,
      */
      body: SafeArea(
        child: Row(
          children: [
            if (isDesktop)
              Expanded(flex: 1, child: SizedBox(child: TenantSideMenuWidget())),

            //Expanded(flex: 6, child: TenantDashboardWidget()),
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Text(
                    'Tenant ( $title )',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 25,
                    ),
                  ),

                  TenantDashboardWidget(),
                ],
              ),
            ),

            //if (isDesktop) Expanded(flex: 3, child: TenantSummaryWidget()),
          ],
        ),
      ),
    );
  }

  //dashboardWidget() {}
}
