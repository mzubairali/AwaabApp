import "package:cmsapp/data/auth_services/login_screen.dart";
import "package:cmsapp/data/constants/constants.dart";
import "package:cmsapp/data/db/db.dart";
import "package:flutter/material.dart";
import "package:supabase_flutter/supabase_flutter.dart";

late String xx;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.title});

  final String title;

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  // defining contorllers
  final email = TextEditingController();
  final password = TextEditingController();
  final fname = TextEditingController();
  final lname = TextEditingController();
  final phone = TextEditingController();
  final db = Db();

  bool loading = false;

  //creating supbase client to use for authentication
  final supabase = Supabase.instance.client;

  // add user profile function
  addUserProfile(String id) async {
    setState(() {
      loading = true;
    });
    try {
      await supabase.from('user_profile').insert({
        'user_id': id,
        'first_name': fname.text,
        'email': email.text,
      });
    } catch (e) {
      print('error in adding profile: $e');
    }
  }

  // registeration function
  register() async {
    setState(() {
      loading = true;
    });

    try {
      /*final result = await supabase.auth.signUp(
        email: email.text,
        password: password.text,

        data: {'first_name': fname.value, 'last_name': lname.text},
      );
      */

      db.creatNewUser(
        fname.text,
        lname.text,
        phone.text,
        email.text,
        password.text,
      );

      print('New User Created 1: ');

      //////////////////////////////////

      //} else {
      //  print('user could not be added');
      //}
    } catch (e) {
      print('Error in creating user ${e.toString()}');
    } finally {
      print("Registered finally by Global var : $newUser");
      /*
      db.createUserProfile(
        //result.user!.id.toString(),
        localUser,
        fname.text,
        lname.text,
        phone.text,
        email.text,
      );*/
      setState(() {
        loading = false;

        if (widget.title == 'Staff') {
          if (mounted) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (contxt) => LoginScreen(title: 'Staff'),
              ),
              (context) => false,
            );
          }
        } else if (widget.title == 'Tenant') {
          if (mounted) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (contxt) => LoginScreen(title: 'Tenant'),
              ),
              (context) => false,
            );
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.title} Register Portal')),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: fname,
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    labelText: 'First Name',
                  ),
                ),
              ),

              SizedBox(width: 15),
              Expanded(
                child: TextFormField(
                  controller: lname,
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    labelText: 'Last Name',
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                  ),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: TextFormField(
                  controller: phone,
                  decoration: InputDecoration(
                    hintText: 'Phone',
                    labelText: 'Phone',
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password',
                  ),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    labelText: 'Confirm Password',
                  ),
                ),
              ),
            ],
          ),

          loading
              ? Center(child: CircularProgressIndicator())
              : ElevatedButton(
                onPressed: () {
                  register();
                },
                child: Text('Register'),
              ),
          SizedBox(height: 15),

          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => LoginScreen(title: widget.title.toString()),
                  //builder: (context) => LoginScreen(title: 'Staff',),
                ),
              );
            },
            child: Text("Already have an account? Login"),
          ),
        ],
      ),
    );
  }
}
