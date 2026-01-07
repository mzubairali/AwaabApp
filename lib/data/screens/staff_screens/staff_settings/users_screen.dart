import 'dart:ui';

import 'package:cmsapp/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final supabase = Supabase.instance.client;
  bool userDetail = false;
  String userID = 'null';

  List<Map<String, dynamic>> users = [];

  getUsers() async {
    try {
      final result = await supabase
          .from('user_profile')
          .select()
          .order('created_at', ascending: false);

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
    bool isSelected = false;

    return ListView(
      children: [
        //leading text for first table
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'User Settings',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),

        Container(
          padding: EdgeInsets.all(10),
          /*
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 204, 203, 203),
          ),*/
          child: DataTable(
            headingRowColor: WidgetStateProperty.all(Colors.black12),

            headingTextStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            showCheckboxColumn: false, // Optional: hides the checkbox
            columns: [
              DataColumn(label: Text('S. No')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('e-mail')),
              DataColumn(label: Text('Roll')),
              DataColumn(label: Text('Status')),
              DataColumn(label: Text('Edit')),
            ],
            rows: [
              for (var (index, user) in users.indexed)
                DataRow(
                  selected: isSelected, // Boolean state variable
                  onSelectChanged: (bool? value) {
                    setState(() {
                      isSelected = value!;
                      userDetail = true;
                      userID = user['user_id'];
                      //print('$userID index $index selected/not $userDetail');
                    });
                  },
                  cells: [
                    DataCell(Text('${index + 1}')),
                    DataCell(
                      Text('${user['last_name']}, ${user['first_name']}'),
                    ),
                    DataCell(Text('${user['e-mail']}')),
                    DataCell(Text('${user['user_status']}')),
                    DataCell(Text('${user['user_role']}')),
                    DataCell(
                      IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                    ),
                  ],
                ),
            ],
          ),

          // first table containing the users list
          /*   Padding(
            padding: const EdgeInsets.all(10.0),
            child: Table(
              border: TableBorder.all(color: Colors.black45),
              columnWidths: const <int, TableColumnWidth>{
                0: IntrinsicColumnWidth(),
                1: IntrinsicColumnWidth(),
                2: IntrinsicColumnWidth(),
                3: IntrinsicColumnWidth(),
                4: IntrinsicColumnWidth(),
                5: IntrinsicColumnWidth(),
              },
              children: <TableRow>[
                TableRow(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(96, 41, 40, 40),
                  ),
                  children: <Widget>[
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('S. No.'),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Name'),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('e-mail'),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Role'),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Status'),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Edit'),
                      ),
                    ),
                  ],
                ),

                for (var (index, user) in users.indexed)
                  TableRow(
                    children: <Widget>[
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('${index + 1}'),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '${user['last_name']}, ${user['first_name']}',
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(user['email']),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(user['user_role']),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(user['user_status']),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit, size: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
       */
        ),

        Visibility(
          visible: userDetail,
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 204, 203, 203),
            ),
            child:
            // first table containing the users list
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Table(
                border: TableBorder.all(color: Colors.black45),
                columnWidths: const <int, TableColumnWidth>{
                  0: IntrinsicColumnWidth(),
                  1: IntrinsicColumnWidth(),
                  2: IntrinsicColumnWidth(),
                  3: IntrinsicColumnWidth(),
                  4: IntrinsicColumnWidth(),
                  5: IntrinsicColumnWidth(),
                },
                children: <TableRow>[
                  TableRow(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(96, 41, 40, 40),
                    ),
                    children: <Widget>[
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('S. No.'),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Name'),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('e-mail'),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Role'),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Status'),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Edit'),
                        ),
                      ),
                    ],
                  ),

                  for (var (index, user) in users.indexed)
                    TableRow(
                      children: <Widget>[
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('${index + 1}'),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '${user['last_name']}, ${user['first_name']}',
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(user['email']),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(user['user_role']),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(user['user_status']),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.edit, size: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    /*
    ListView(
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

    */
  }
}
