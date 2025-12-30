import 'package:cmsapp/data/screens/staff_screens/staff_settings/staff_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StaffMenuSelection {
  final int value;
  final BuildContext context;
  final supabase = Supabase.instance.client;
  // constructor
  StaffMenuSelection({required this.value, required this.context});

  void menuCall() async {
    // print('in the menu call');
    switch (value) {
      case 7: //exit app
        {
          //print('in the settings');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const StaffSettingsScreen()),

            //(route) => ActivityDetailsCard()
          );
        }
      case 8: //exit app
        {
          //print('in the leave settings');
          //ExitApp();
        }
    }
  }
}
