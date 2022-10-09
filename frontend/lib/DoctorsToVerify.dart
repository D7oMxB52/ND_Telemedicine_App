import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'User.dart';

class DoctorsToVerify extends StatelessWidget {
  const DoctorsToVerify({super.key});
  final String title = "Verify Doctors";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              VerifyDoctors(),
            ],
          )),
    );
  }
}

class VerifyDoctors extends StatefulWidget {
  const VerifyDoctors({super.key});

  @override
  VerifyDoctorsState createState() {
    return VerifyDoctorsState();
  }
}

class VerifyDoctorsState extends State<VerifyDoctors> {
  List<User> unverifiedDoctors = [];

  @override
  void initState() async {
    super.initState();
    unverifiedDoctors = await getAllUnverifiedDoctors();
    print("UNVERIFIED DOCTORS");
    print(unverifiedDoctors);
    for (var i in unverifiedDoctors) {
      print(i.firstName);
    }
  }

  @override
  Widget build(BuildContext context) {
    // List<User> doctorsToBeVerified = unverifiedDoctors;

    return Container(
      height: 400,
      width: 100,
      child: Column(
        children: unverifiedDoctors
            .map((e) => OutlinedButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //       return  Booking();
                    //     }));
                  },
                  child: Text(e.firstName.toString()),
                ))
            .toList(),
      ), // trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Future<List<User>> getAllUnverifiedDoctors() async {
  List<User> users = [];

  final response = await http.get(
// 10.0.2.2 replaces localhost when using android emulator
    Uri.parse('http://10.0.2.2:8080/ndt/doctors/unverified'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  print("________________");
  print(response.body);

  List<dynamic> list = jsonDecode(response.body);

  for (var dr in list) {
    print("________________DR");
    print(dr);
    User user = User.fromJson(dr);
    print("________________user");
    print(user);
    print(user.firstName);
    print(user.lastName);
    users.add(user);
  }
  print(users);

  return users;
}
