import 'package:cmsapp/data/screens/home_screen.dart';
import 'package:cmsapp/old/staff/staff_menu_selection.dart';
import 'package:flutter/material.dart';
import 'package:cmsapp/data/constants/constants.dart';
import 'package:cmsapp/old/staff/staff_side_menu_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StaffSideMenuWidget extends StatefulWidget {
  const StaffSideMenuWidget({super.key});

  @override
  State<StaffSideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<StaffSideMenuWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final data = StaffSideMenuData();

    return Container(
      color: Colors.black87,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 10),
      child: ListView.builder(
        itemCount: data.menu.length,
        itemBuilder: (context, index) => buildMenuEntry(data, index),
      ),
    );
  }

  void leaveApp() async {
    final supabase = Supabase.instance.client;

    await supabase.auth.signOut();
    if (mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
        (route) => false,
      );
    }
  }

  Widget buildMenuEntry(StaffSideMenuData data, int index) {
    final isSelected = selectedIndex == index;

    return Container(
      //margin: const EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        color: isSelected ? selectionColor : Colors.transparent,
      ),
      child: InkWell(
        onTap:
            () => setState(() {
              selectedIndex = index;

              if (selectedIndex == 8) {
                //print('in the menu: $selectedIndex');
                leaveApp();
              } else {
                //StaffMenuSelection(selectedIndex);
                //print('in the menu: $selectedIndex');

                StaffMenuSelection(
                  value: selectedIndex,
                  context: context,
                ).menuCall();
              }
            }),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
              child: Icon(
                data.menu[index].icon,
                color: isSelected ? Colors.black : Colors.grey,
              ),
            ),
            Text(
              data.menu[index].title,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.black : Colors.grey,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
