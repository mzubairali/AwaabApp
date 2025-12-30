import 'package:flutter/material.dart';
import 'package:cmsapp/old/models/menu_model.dart';

class StaffSideMenuData {
  final menu = const <MenuModel>[
    MenuModel(icon: Icons.circle, title: 'Dashboard'),
    MenuModel(icon: Icons.circle, title: 'Hazard Management'),
    MenuModel(icon: Icons.circle, title: 'Investigation'),
    MenuModel(icon: Icons.circle, title: 'Work Orders '),
    MenuModel(icon: Icons.circle, title: 'Appointments'),
    MenuModel(icon: Icons.circle, title: 'Escalations'),
    MenuModel(icon: Icons.circle, title: 'Compliance & Reporting '),
    MenuModel(icon: Icons.circle, title: 'Settings'),
    MenuModel(icon: Icons.circle, title: 'Exit'),

    //MenuModel(icon: Icons.circle, title: 'Users'),
  ];
}
