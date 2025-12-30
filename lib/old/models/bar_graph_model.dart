import 'package:flutter/widgets.dart';
import 'package:cmsapp/old/models/graph_model.dart';

class BarGraphModel {
  final String label;
  final Color color;
  final List<GraphModel> graph;

  const BarGraphModel({
    required this.label,
    required this.color,
    required this.graph,
  });
}
