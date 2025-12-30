import 'package:cmsapp/data/screens/staff_screens/staff_settings/new_user_screen.dart';
import 'package:cmsapp/data/screens/staff_screens/staff_settings/others_screen.dart';
import 'package:cmsapp/data/screens/staff_screens/staff_settings/users_screen.dart';
import 'package:flutter/material.dart';

class StaffSettingsScreen extends StatefulWidget {
  const StaffSettingsScreen({super.key});

  @override
  State<StaffSettingsScreen> createState() => _StaffSettingsScreenState();
}

class _StaffSettingsScreenState extends State<StaffSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          backgroundColor: Colors.lightBlue,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Users'),
              Tab(text: 'New User'),
              Tab(text: 'Others'),
            ],
          ),
        ),
        body: TabBarView(
          children: [UsersScreen(), NewUserScreen(), OthersScreen()],
        ),
      ),
    );
  }
}
