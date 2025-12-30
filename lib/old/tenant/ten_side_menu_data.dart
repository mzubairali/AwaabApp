import 'package:flutter/material.dart';
import 'package:cmsapp/old/models/menu_model.dart';

class TenantSideMenuData {
  final menu = const <MenuModel>[
    MenuModel(icon: Icons.circle, title: 'Dashboard'),
    MenuModel(icon: Icons.circle, title: 'Report Hazard'),
    MenuModel(icon: Icons.circle, title: 'Case Tracking'),
    MenuModel(icon: Icons.circle, title: 'Appointments'),
    MenuModel(icon: Icons.circle, title: 'Messages'),
    MenuModel(icon: Icons.circle, title: 'Notifications'),
    MenuModel(icon: Icons.circle, title: 'Resources'),
    //MenuModel(icon: Icons.circle, title: 'Settings'),
    MenuModel(icon: Icons.circle, title: 'Exit'),
  ];
}
