import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'User.dart';

class DoctorsToVerify extends StatefulWidget {
  const DoctorsToVerify({super.key});

  @override
  VerifyDoctorsState createState() {
    return VerifyDoctorsState();
  }
}

class VerifyDoctorsState extends State<DoctorsToVerify> {
  List<User> unverifiedDoctors = [];

  @override
  void initState() {
    super.initState();

    getData();
  }

  Future<List<User>> getData() async {
    unverifiedDoctors = await getAllUnverifiedDoctors();
    print("UNVERIFIED DOCTORS");
    print(unverifiedDoctors);
    for (var i in unverifiedDoctors) {
      print(i.firstName);
    }
    return unverifiedDoctors;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Verify doctors'),
    ),
    body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // Future hasn't finished yet, return a placeholder
            return SafeArea(
              child: Column(
                children: const [
                  Center(
                      child: Text("Loading:")
                  ),
                ],
              ),
            );
          }
          return SafeArea(
            child: Column(
              children: [
                const Center(
                    child: Text("Doctors needing verification:")
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: unverifiedDoctors.map((e) =>
                          OutlinedButton(
                            onPressed: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context) {
                              //       return  Booking();
                              //     }));
                            },
                            child: Text(e.firstName),
                          )
                      ).toList(),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      )
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
