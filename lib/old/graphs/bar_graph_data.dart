import 'package:flutter/material.dart';
import 'package:cmsapp/old/models/bar_graph_model.dart';
import 'package:cmsapp/old/models/graph_model.dart';

class BarGraphData {
  final data = [
    const BarGraphModel(
      label: 'Activity Level',
      color: Colors.amberAccent,
      graph: [
        GraphModel(x: 0, y: 8),
        GraphModel(x: 1, y: 10),
        GraphModel(x: 2, y: 7),
        GraphModel(x: 3, y: 4),
        GraphModel(x: 4, y: 8),
        GraphModel(x: 5, y: 6),
      ],
    ),

    const BarGraphModel(
      label: 'Nutrition',
      color: Colors.cyan,
      graph: [
        GraphModel(x: 0, y: 8),
        GraphModel(x: 1, y: 10),
        GraphModel(x: 2, y: 9),
        GraphModel(x: 3, y: 9),
        GraphModel(x: 4, y: 5),
        GraphModel(x: 5, y: 7),
      ],
    ),

    const BarGraphModel(
      label: 'Hyderation Level',
      color: Colors.green,
      graph: [
        GraphModel(x: 0, y: 7),
        GraphModel(x: 1, y: 6),
        GraphModel(x: 2, y: 10),
        GraphModel(x: 3, y: 2),
        GraphModel(x: 4, y: 8),
        GraphModel(x: 5, y: 6),
      ],
    ),
  ];

  final lable = ['M', 'T', 'W', 'T', 'F', 'S'];
}
