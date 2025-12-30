import 'package:cmsapp/data/screens/home_screen.dart';
import 'package:flutter/material.dart';

//import 'package:cmsapp/data/exit_app.dart';
import 'package:cmsapp/data/screens/staff_screens/staff_appointments.dart';
import 'package:cmsapp/data/screens/staff_screens/staff_compliance.dart';
import 'package:cmsapp/data/screens/staff_screens/staff_dashboard.dart';
import 'package:cmsapp/data/screens/staff_screens/staff_escalations.dart';
import 'package:cmsapp/data/screens/staff_screens/staff_hazard.dart';
import 'package:cmsapp/data/screens/staff_screens/staff_investigation.dart';
import 'package:cmsapp/data/screens/staff_screens/staff_settings/staff_settings_screen.dart';
import 'package:cmsapp/data/screens/staff_screens/staff_workorder.dart';

import 'package:cmsapp/data/screens/tenant_screens/ten_appointments.dart';
import 'package:cmsapp/data/screens/tenant_screens/ten_casetracking.dart';
import 'package:cmsapp/data/screens/tenant_screens/ten_dashboard.dart';
import 'package:cmsapp/data/screens/tenant_screens/ten_messages.dart';
import 'package:cmsapp/data/screens/tenant_screens/ten_notifications.dart';
import 'package:cmsapp/data/screens/tenant_screens/ten_reporthazard.dart';
import 'package:cmsapp/data/screens/tenant_screens/ten_resources.dart';
import 'package:cmsapp/data/screens/tenant_screens/ten_settings.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.type, required this.title});

  final String type;
  final String title;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> staffwidgets = [
    StaffDashboard(),
    StaffHazard(),
    StaffInvestigation(),
    StaffWorkorder(),
    StaffAppointments(),
    StaffEscalations(),
    StaffCompliance(),
    StaffSettingsScreen(),
  ];

  List<Widget> tenWidgets = [
    TenDashboard(),
    TenReporthazard(),
    TenCasetracking(),
    TenAppointments(),
    TenMessages(),
    TenNotifications(),
    TenResources(),
    TenSettings(),
  ];

  int currentIndexStaff = 0;
  int currentIndexTenant = 0;

  @override
  Widget build(BuildContext context) {
    final String iType = widget.type;
    final String iTitle = widget.title;

    if (widget.type == 'Staff') {
      return Scaffold(
        appBar: AppBar(
          title: Text("$iType Portal ($iTitle)"),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                if (mounted) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                    (route) => false,
                  );
                }
              },
            ),
          ],
        ),
        body: staffwidgets[currentIndexStaff],
        drawer: Drawer(
          child: ListView(
            children: [
              Image.asset('lib/assets/images/cms.png', height: 80),
              SizedBox(height: 20),

              ListTile(
                onTap: () {
                  setState(() {
                    currentIndexStaff = 0;
                    Navigator.of(context).pop();
                  });
                },
                title: Text('Dashboard'),
                leading: Icon(Icons.circle_sharp),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    currentIndexStaff = 1;
                    Navigator.of(context).pop();
                  });
                },
                title: Text('Hazard Management'),
                leading: Icon(Icons.circle_sharp),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    currentIndexStaff = 2;
                    Navigator.of(context).pop();
                  });
                },
                title: Text('Investigation'),
                leading: Icon(Icons.circle_sharp),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    currentIndexStaff = 3;
                    Navigator.of(context).pop();
                  });
                },
                title: Text('Work Orders'),
                leading: Icon(Icons.circle_sharp),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    currentIndexStaff = 4;
                    Navigator.of(context).pop();
                  });
                },
                title: Text('Appointments'),
                leading: Icon(Icons.circle_sharp),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    currentIndexStaff = 5;
                    Navigator.of(context).pop();
                  });
                },
                title: Text('Escalations'),
                leading: Icon(Icons.circle_sharp),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    currentIndexStaff = 6;
                    Navigator.of(context).pop();
                  });
                },
                title: Text('Compliance & Reporting'),
                leading: Icon(Icons.circle_sharp),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    currentIndexStaff = 7;
                    Navigator.of(context).pop();
                  });
                },
                title: Text('Settings'),
                leading: Icon(Icons.circle_sharp),
              ),
            ],
          ),
        ),
        /*
        bottomNavigationBar: BottomNavigationBar(
          currentIndexStaff: currentIndexStaff,
          onTap: (value) {
            setState(() {
              currentIndexStaff = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label: 'Dashboard 2',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label: 'Dashboard 3',
            ),
          ],
        ),
      */
      );
    } else if (widget.type == 'Tenant') {
      return Scaffold(
        appBar: AppBar(
          title: Text("$iType Portal"),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                if (mounted) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                    (route) => false,
                  );
                }
              },
            ),
          ],
        ),
        body: tenWidgets[currentIndexTenant],
        drawer: Drawer(
          child: ListView(
            children: [
              Image.asset('lib/assets/images/cms.png', height: 80),
              ListTile(
                onTap: () {
                  setState(() {
                    currentIndexTenant = 0;
                    Navigator.of(context).pop();
                  });
                },
                title: Text('Dashboard'),
                leading: Icon(Icons.circle_sharp),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    currentIndexTenant = 1;
                    Navigator.of(context).pop();
                  });
                },
                title: Text('Report Hazard'),
                leading: Icon(Icons.circle_sharp),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    currentIndexTenant = 2;
                    Navigator.of(context).pop();
                  });
                },
                title: Text('Case Tracking'),
                leading: Icon(Icons.circle_sharp),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    currentIndexTenant = 3;
                    Navigator.of(context).pop();
                  });
                },
                title: Text('Appointments'),
                leading: Icon(Icons.circle_sharp),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    currentIndexTenant = 4;
                    Navigator.of(context).pop();
                  });
                },
                title: Text('Messages'),
                leading: Icon(Icons.circle_sharp),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    currentIndexTenant = 5;
                    Navigator.of(context).pop();
                  });
                },
                title: Text('Notifications'),
                leading: Icon(Icons.circle_sharp),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    currentIndexTenant = 6;
                    Navigator.of(context).pop();
                  });
                },
                title: Text('Resources'),
                leading: Icon(Icons.circle_sharp),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    currentIndexTenant = 7;
                    Navigator.of(context).pop();
                  });
                },
                title: Text('Settings'),
                leading: Icon(Icons.circle_sharp),
              ),
            ],
          ),
        ),
      );
    } else {
      return Text('Error in loading data');
    }
  }
}
