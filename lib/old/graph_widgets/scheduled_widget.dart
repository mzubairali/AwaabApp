
/*
import 'package:flutter/material.dart';
import 'package:cmsapp/data/schedule_task_data.dart';
import 'package:cmsapp/views/widgets/custom_card_widget.dart';

class Scheduled extends StatelessWidget {
  const Scheduled({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ScheduleTaskData();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Text(
          "Scheduled",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 5),

        for (var index = 0; index < data.scheduled.length; index++)
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: CustomCardWidget(
              color: Colors.black,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.scheduled[index].title,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.amber,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const SizedBox(height: 2),

                          Text(
                            data.scheduled[index].date,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Icon(Icons.more, color: Colors.red),
                    ],
                  ),
                ],
              ),
            ),
          ),
        SizedBox(height: 50),
      ],
    );
  }
}

*/