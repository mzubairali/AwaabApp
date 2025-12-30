import "package:cmsapp/data/auth_services/register_screen.dart";
import "package:cmsapp/data/screens/main_screen.dart";
import "package:flutter/material.dart";
import "package:supabase_flutter/supabase_flutter.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // defining contorllers
  final email = TextEditingController(text: 'mzali11@yahoo.com');
  final password = TextEditingController(text: '123456');
  bool loading = false;

  //creating supbase client to use for authentication
  final supabase = Supabase.instance.client;

  // login function
  login() async {
    setState(() {
      loading = true;
    });
    try {
      final result = await supabase.auth.signInWithPassword(
        email: email.text,
        password: password.text,
      );

      if (result.user != null && result.session != null) {
        final User? user = supabase.auth.currentUser;
        final Map<String, dynamic>? userMetadata = user?.userMetadata;
        final String? firstName = userMetadata?['first_name'];

        String fName = firstName ?? "*";

        if (widget.title == 'Staff') {
          if (mounted) {
            Navigator.pushAndRemoveUntil(
              context,
              //MaterialPageRoute(builder: (contxt) => StaffDashboardPage(title: fName)),
              MaterialPageRoute(
                builder: (contxt) => MainScreen(type: "Staff", title: fName),
              ),
              (context) => false,
            );
          }
        } else if (widget.title == 'Tenant') {
          if (mounted) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                //builder: (contxt) => TenantDashboardPage(title: fName),
                builder: (contxt) => MainScreen(type: "Tenant", title: fName),
              ),
              (context) => false,
            );
          }
        }
      }
    } catch (e) {
      // print(e.toString());
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.title} Portal')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              controller: email,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            SizedBox(height: 15),

            TextFormField(
              controller: password,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            SizedBox(height: 15),

            loading
                ? Center(child: CircularProgressIndicator())
                : ElevatedButton(
                  onPressed: () {
                    login();
                  },
                  child: Text('Login'),
                ),
            SizedBox(height: 15),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            RegisterScreen(title: widget.title.toString()),
                  ),
                );
              },
              child: Text("Don't have an account? Register"),
            ),
          ],
        ),
      ),
    );
  }
}
