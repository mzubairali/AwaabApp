//import 'dart:async';

import 'package:cmsapp/data/constants/constants.dart';
import 'package:cmsapp/data/db/db.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewUserScreen extends StatefulWidget {
  const NewUserScreen({super.key});

  @override
  State<NewUserScreen> createState() => _NewUserScreenState();
}

bool enableProfile = false;
bool tenancyDetail = false;
String tenancyStartDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

String tenancyEndDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

class _NewUserScreenState extends State<NewUserScreen> {
  final ExpansibleController expansionTileController = ExpansibleController();
  @override
  void dispose() {
    expansionTileController.dispose();
    super.dispose();
  }

  // controllers for user creation
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  // controllers for user profile
  TextEditingController addressLine = TextEditingController();
  TextEditingController buildingName = TextEditingController();
  TextEditingController buildingNumber = TextEditingController();
  TextEditingController floor = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();

  final userForm = GlobalKey<FormState>();
  final profileForm = GlobalKey<FormState>();
  //final profileContainer = GlobalKey();
  //final pCont = GlobalKey<State>();
  String? userType = 'Staff';

  // db connection
  Db dbConnection = Db();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Form(
          key: userForm,

          child: Container(
            //height: 150,
            //width: 200,
            padding: const EdgeInsets.all(10), // Space inside
            margin: const EdgeInsets.all(10), // Space outside
            decoration: BoxDecoration(
              color: const Color.fromARGB(
                255,
                247,
                246,
                246,
              ).withAlpha(50), // Color inside decoration
              borderRadius: BorderRadius.circular(10), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 33, 33, 33).withAlpha(80),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),

            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              verticalDirection: VerticalDirection.down,

              children: [
                Title(
                  color: const Color.fromARGB(255, 102, 101, 101),
                  child: Text(
                    'User',
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                  ),
                ),
                //first name - last name
                Row(
                  spacing: 10,
                  children: <Widget>[
                    Icon(Icons.person),
                    //SizedBox(width: 5),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'First Name',
                          labelText: 'First Name',
                        ),
                        controller: fName,
                      ),
                    ),

                    Icon(Icons.person),
                    //SizedBox(width: 5),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Last Name',
                          labelText: 'Last Name',
                        ),
                        controller: lName,
                      ),
                    ),
                  ],
                ),

                // email - phone
                Row(
                  spacing: 10,
                  children: <Widget>[
                    Icon(Icons.email),
                    //SizedBox(width: 5),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'e-mail',
                          labelText: 'e-mail',
                        ),
                        controller: email,
                      ),
                    ),

                    Icon(Icons.phone),
                    //SizedBox(width: 5),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Phone',
                          labelText: 'Phone',
                        ),
                        controller: phone,
                      ),
                    ),
                  ],
                ),

                //password
                Row(
                  spacing: 10,
                  children: <Widget>[
                    Icon(Icons.password),
                    //SizedBox(width: 5),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Password',
                          labelText: 'Password',
                        ),
                        controller: password,
                      ),
                    ),
                  ],
                ),

                ElevatedButton(
                  onPressed: () {
                    // if user is created successfully enable the profile panel
                    // using empty check for the time being

                    if ((fName.text.isNotEmpty) &&
                        (lName.text.isNotEmpty) &&
                        (phone.text.isNotEmpty) &&
                        (phone.text.isNotEmpty) &&
                        (password.text.isNotEmpty)) {
                      try {
                        dbConnection.creatNewUser(
                          fName.text,
                          lName.text,
                          phone.text,
                          email.text,
                          password.text,
                        );
                      } catch (e) {
                        print('3: Error in creating user : $e');
                      } finally {
                        // only if the user has been created successfully
                        setState(() {
                          enableProfile = true;
                          tenancyDetail = false;
                        });
                      }
                      //profileContainer.currentState!;
                    }
                  },
                  child: Text('Create User'),
                ),
              ],
            ),
          ),
        ),

        // Profile Container
        Visibility(
          visible: enableProfile,
          child: Form(
            child: Container(
              key: profileForm,
              padding: const EdgeInsets.all(10), // Space inside
              margin: const EdgeInsets.all(10), // Space outside
              decoration: BoxDecoration(
                color: const Color.fromARGB(
                  255,
                  247,
                  246,
                  246,
                ).withAlpha(50), // Color inside decoration
                borderRadius: BorderRadius.circular(10), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 33, 33, 33).withAlpha(80),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),

              child: Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                verticalDirection: VerticalDirection.down,

                children: [
                  Title(
                    color: const Color.fromARGB(255, 102, 101, 101),
                    child: Text(
                      'User Address',
                      style: TextStyle(fontSize: 20, color: Colors.black87),
                    ),
                  ),
                  // row for address line
                  Row(
                    spacing: 10,
                    children: <Widget>[
                      Icon(Icons.add_home_rounded),
                      //SizedBox(width: 5), // Add some spacing
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Address `line',
                            labelText: 'Address Line',
                          ),
                          controller: addressLine,
                        ),
                      ),
                    ],
                  ),
                  // row for address details
                  Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.house_siding),

                      //building name
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Building Name',
                            labelText: 'Building Name',
                          ),
                          controller: buildingName,
                        ),
                      ),

                      //building number
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Building Number',
                            labelText: 'Building Number',
                          ),
                          controller: buildingNumber,
                        ),
                      ),

                      //floor
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Floor',
                            labelText: 'Floor',
                          ),
                          controller: floor,
                        ),
                      ),

                      //street
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Street',
                            labelText: 'Street',
                          ),
                          controller: street,
                        ),
                      ),
                    ],
                  ),
                  // row for city/country
                  Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.location_city),

                      //postal code
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Postal Code',
                            labelText: 'Postal Code',
                          ),
                          controller: postalCode,
                        ),
                      ),

                      //city
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'City',
                            labelText: 'City',
                          ),
                          controller: city,
                        ),
                      ),

                      //country
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Country',
                            labelText: 'Country',
                          ),
                          controller: country,
                        ),
                      ),
                    ],
                  ),

                  // row for user type/category (radio buttons)
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    runAlignment: WrapAlignment.start,
                    children: [
                      FittedBox(
                        child: RadioMenuButton(
                          //style: Transform.scale(scaleX: FittedBox(),),
                          value: 'Staff',
                          groupValue: userType,
                          onChanged: (value) {
                            setState(() {
                              userType = value;
                              tenancyDetail = false;
                            });
                          },
                          child: Text('Staff'),
                        ),
                      ),
                      FittedBox(
                        child: RadioMenuButton(
                          value: 'HousingOfficer',
                          groupValue: userType,
                          onChanged: (value) {
                            setState(() {
                              userType = value;
                              tenancyDetail = false;
                            });
                          },
                          child: Text('Housing Officer'),
                        ),
                      ),

                      FittedBox(
                        child: RadioMenuButton(
                          value: 'Investigator',
                          groupValue: userType,
                          onChanged: (value) {
                            setState(() {
                              userType = value;
                              tenancyDetail = false;
                            });
                          },
                          child: Text('Investigator'),
                        ),
                      ),
                      FittedBox(
                        child: RadioMenuButton(
                          value: 'Manager',
                          groupValue: userType,
                          onChanged: (value) {
                            setState(() {
                              userType = value;
                              tenancyDetail = false;
                            });
                          },
                          child: Text('Manager'),
                        ),
                      ),
                      FittedBox(
                        child: RadioMenuButton(
                          value: 'Tenant',
                          groupValue: userType,
                          onChanged: (value) {
                            setState(() {
                              userType = value;
                              tenancyDetail = true;
                            });
                          },
                          child: Text('Tenant'),
                        ),
                      ),
                    ],
                  ),

                  // row for tenancy details
                  Visibility(
                    visible: tenancyDetail,
                    child: Form(
                      child: Row(
                        spacing: 10,
                        children: <Widget>[
                          //Icon(Icons.calendar_month),
                          Text('Start Date'),
                          //SizedBox(width: 5), // Add some spacing
                          Expanded(
                            child: InkWell(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Tenancy Start Date',
                                  labelText: tenancyStartDate,
                                ),
                                enabled: false,
                              ),
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2030),
                                ).then((myDate) {
                                  setState(() {
                                    tenancyStartDate = DateFormat(
                                      'yyyy-MM-dd',
                                    ).format(myDate!);
                                  });
                                });
                                //DatePickerDialog(firstDate: DateTime.now(),);
                              },
                            ),
                          ),
                          Text('End Date'),
                          Expanded(
                            child: InkWell(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Tenancy End Date',
                                  labelText: tenancyEndDate,
                                ),
                                enabled: false,
                              ),
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2030),
                                ).then((myDate) {
                                  setState(() {
                                    tenancyEndDate = DateFormat(
                                      'yyyy-MM-dd',
                                    ).format(myDate!);
                                  });
                                });
                                //DatePickerDialog(firstDate: DateTime.now(),);
                              },
                            ),
                          ),
                        ],
                      ),

                      ////////////////////////
                    ),
                  ),

                  // create profile button
                  ElevatedButton(
                    onPressed: () {
                      dbConnection.createUserAddress(
                        newUser,
                        'unit_id',
                        'uprn',
                        addressLine.text,
                        buildingName.text,
                        buildingNumber.text,
                        floor.text,
                        street.text,
                        postalCode.text,
                        city.text,
                        country.text,
                      );
                    },
                    child: Text('Save Address'),
                  ),
                ],
              ),
            ),
          ),
        ),

        /// tenancy container
        /*   Visibility(
          visible: tenancyDetail,
          child: Form(
            child: Container(
              //key: profileForm,
              padding: const EdgeInsets.all(10), // Space inside
              margin: const EdgeInsets.all(10), // Space outside
              decoration: BoxDecoration(
                color: const Color.fromARGB(
                  255,
                  247,
                  246,
                  246,
                ).withAlpha(50), // Color inside decoration
                borderRadius: BorderRadius.circular(10), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 33, 33, 33).withAlpha(80),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),

              child: Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                verticalDirection: VerticalDirection.down,

                children: [
                  Title(
                    color: const Color.fromARGB(255, 102, 101, 101),
                    child: Text(
                      'Tenancy Details',
                      style: TextStyle(fontSize: 20, color: Colors.black87),
                    ),
                  ),
                  Row(
                    spacing: 10,
                    children: <Widget>[
                      //Icon(Icons.calendar_month),
                      Text('Start Date'),
                      //SizedBox(width: 5), // Add some spacing
                      Expanded(
                        child: InkWell(
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Tenancy Start Date',
                              labelText: tenancyStartDate,
                            ),
                            enabled: false,
                          ),
                          onTap: () {
                            showDatePicker(
                              context: context,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2030),
                            ).then((myDate) {
                              setState(() {
                                tenancyStartDate = DateFormat(
                                  'yyyy-MM-dd',
                                ).format(myDate!);
                              });
                            });
                            //DatePickerDialog(firstDate: DateTime.now(),);
                          },
                        ),
                      ),
                      Text('End Date'),
                      Expanded(
                        child: InkWell(
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Tenancy End Date',
                              labelText: tenancyEndDate,
                            ),
                            enabled: false,
                          ),
                          onTap: () {
                            showDatePicker(
                              context: context,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2030),
                            ).then((myDate) {
                              setState(() {
                                tenancyEndDate = DateFormat(
                                  'yyyy-MM-dd',
                                ).format(myDate!);
                              });
                            });
                            //DatePickerDialog(firstDate: DateTime.now(),);
                          },
                        ),
                      ),
                    ],
                  ),
                  /*Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.house_siding),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Building Name',
                            labelText: 'Building Name',
                          ),
                        ),
                      ),

                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Building Number',
                            labelText: 'Building Number',
                          ),
                        ),
                      ),

                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Street',
                            labelText: 'Street',
                          ),
                        ),
                      ),

                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Floor',
                            labelText: 'Floor',
                          ),
                        ),
                      ),
                    ],
                  ),
                */
                ],
              ),
            ),
          ),
        ),
      */
      ],
    );
  }
}
