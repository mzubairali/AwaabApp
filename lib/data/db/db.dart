import 'package:cmsapp/data/constants/constants.dart';
//import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Db {
  //final String userid;

  //Db(this.userid);

  final supabase = Supabase.instance.client;

  creatNewUser(
    String fname,
    String lname,
    String phone,
    String email,
    String password,
  ) async {
    AuthResponse result = AuthResponse();
    try {
      result = await supabase.auth.signUp(
        email: email,
        password: password,
        data: {'first_name': fname, 'last_name': lname, 'phone': phone},
      );
      print('user created inside db: ${result.user!.id.toString()}');
      //return result.user!.id.toString();
      newUser = result.user!.id.toString();
      //return result;
    } catch (e) {
      //print('error in careting a new user $e');
      return null;
    } finally {
      // after adding the user in auth.users table we have tu add in user_profile talbel as well
      createUserProfile(result.user!.id.toString(), fname, lname, phone, email);
    }
  }

  createUserProfile(
    String uid,
    String fname,
    String lname,
    String phone,
    String email,
  ) async {
    try {
      await supabase.from('user_profile').insert({
        'user_id': uid,
        'first_name': fname,
        'last_name': lname,
        'phone': phone,
        'email': email,
      });
      print(supabase.auth.currentUser!.id.toString());
      return supabase.auth.currentUser!.id.toString();
    } catch (e) {
      print('error in adding profile: $e');
      return "Null";
    }
  }

  createUserAddress(
    String userID,
    String unitID,
    String uprn,
    String addLine,
    String bName,
    String bNumber,
    String floor,
    String street,
    String pCode,
    String city,
    String country,
  ) async {
    String newAddress = 'null';
    try {
      final List<Map<String, dynamic>> data =
          await supabase.from('address').insert({
            //'user_id': userID,
            'unitID': unitID,
            'uprn': uprn,
            'addLine': addLine,
            'bName': bName,
            'bNumber': bNumber,
            'floor': floor,
            'street': street,
            'pCode': pCode,
            'city': city,
            'country': country,
          }).select();

      if (data.isNotEmpty) {
        newAddress = data.first['address_id'];
        print('Inserted row data: ${data.first['address_id']}');
      }

      //return data;
    } catch (e) {
      print('error in adding profile: $e');
      return "Null";
    } finally {
      // her we will add address_id in the user_profile table
      await supabase
          .from('user_profile')
          .update({'address_id': newAddress})
          .eq('user_id', userID);
    }
  }
}
