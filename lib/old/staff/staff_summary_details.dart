import 'package:flutter/material.dart';
import 'package:cmsapp/old/graph_widgets/custom_card_widget.dart';

class StaffSummaryDetails extends StatelessWidget {
  const StaffSummaryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      color: const Color(0xff2f353e),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildDetails('Cal', '307'),
          buildDetails('Steps', '10938'),
          buildDetails('Distance', '7km'),
          buildDetails('Sleep', '7hr'),
        ],
      ),
    );
  }

  Widget buildDetails(String key, String value) {
    return Column(
      children: [
        Text(key, style: const TextStyle(fontSize: 11, color: Colors.grey)),

        const SizedBox(height: 2),

        Text(
          value,
          style: const TextStyle(fontSize: 14, color: Colors.blueGrey),
        ),
      ],
    );
  }
}
