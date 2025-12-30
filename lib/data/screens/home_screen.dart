import "package:cmsapp/data/auth_services/login_screen.dart";
import "package:flutter/material.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Awaab Law CMS'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pop(context);
              //FlutterExitApp.exitApp();
            },
          ),
        ],
      ),
      //appBar: AppBar(title: widget),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo + title
              Column(
                children: [
                  Image.asset('lib/assets/images/cms.png', height: 120),
                  const SizedBox(height: 16),
                  const Text(
                    'Complaint Management Services',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen(title: "Tenant");
                      },
                    ),
                  );
                },
                child: const SizedBox(
                  width: 200,
                  child: Center(child: Text('Tenant Portal')),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        //return LoginPage(title: "Staff");
                        return LoginScreen(title: "Staff");
                      },
                    ),
                  );
                },
                child: const SizedBox(
                  width: 200,
                  child: Center(child: Text('Staff Portal')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
