import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final supabase = Supabase.instance.client;
  List<Map<String, dynamic>> users = [];

  getUsers() async {
    try {
      final result = await supabase.from('user_profile').select();

      //final User? user = supabase.auth.currentUser;
      //final Map<String, dynamic>? userMetadata = user?.userMetadata;
      //final String? firstName = userMetadata?['first_name'];

      setState(() {
        users = result;
      });
    } catch (e) {
      print('got error: $e');
    } finally {}
  }

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var user in users)
          ListTile(
            title: Text(user['first_name']),
            subtitle: Text(user['email']),
            trailing: Wrap(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
              ],
            ),
            //onTap: () {},
          ),
      ],
    );
  }
}
