//import 'package:cmsapp/data/auth_services/login_screen.dart';
import 'package:flutter/material.dart';
//import 'package:cmsapp/util/responsive.dart';
import 'package:cmsapp/old/graph_widgets/activity_details_card.dart';
//import 'package:cmsapp/views/widgets/bar_graph_widget.dart';
//import 'package:cmsapp/views/widgets/line_char_card.dart';
import 'package:cmsapp/views/widgets/header_widget.dart';
//import 'package:cmsapp/data/tenant/ten_summary_widget.dart';
//import 'package:supabase_flutter/supabase_flutter.dart';

class TenantDashboardWidget extends StatelessWidget {
  const TenantDashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        //padding: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            //search bar
            const SizedBox(height: 18),
            const HeaderWidget(),
            //activity detail cards
            const SizedBox(height: 18),
            const ActivityDetailsCard(),
            //line chart card
            const SizedBox(height: 18),
            //const LineCharCard(),
            //bargraph card
            const SizedBox(height: 18),

            //const BarGraphCard(),
            //const SizedBox(height: 18),
            //if (Responsive.isTablet(context)) const TenantSummaryWidget(),
          ],
        ),
      ),
    );
  }
}
