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

  Future<bool> approveDr(User user) async {
    // print(user);
    // print("doctor being approved ${user.firstName}");
    // String userJson = jsonEncode(user);
    // print(userJson);
    final response = await http.post(
      // 10.0.2.2 replaces localhost when using android emulator
      Uri.parse('http://10.0.2.2:8080/ndt/doctors/approve'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
        body: jsonEncode({
          "userId": user.userId,
          "accreditation_num": user.accreditationNum,
          "firstName": user.firstName,
          "lastName": user.lastName,
          "dateOfBirth": user.dateOfBirth,
          "email": user.email,
          "password": user.password,
          "address": user.address,
          "phoneNum": user.phoneNum,
          "role": user.role,
          "active": user.active,
          "verified": user.verified
        })
    );

    print(response.body);
    if (response.body.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> denyDr(User user) async {
    final response = await http.post(
      // 10.0.2.2 replaces localhost when using android emulator
        Uri.parse('http://10.0.2.2:8080/ndt/doctors/deny'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "userId": user.userId,
          "accreditation_num": user.accreditationNum,
          "firstName": user.firstName,
          "lastName": user.lastName,
          "dateOfBirth": user.dateOfBirth,
          "email": user.email,
          "password": user.password,
          "address": user.address,
          "phoneNum": user.phoneNum,
          "role": user.role,
          "active": user.active,
          "verified": user.verified
        })
    );

    print(response.body);
    if (response.body.isNotEmpty) {
      return true;
    } else {
      return false;
    }
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
          if (unverifiedDoctors.isEmpty) {
            return SafeArea(
                child: Column(
                    children: const [
                Center(
                child: Text("No doctors to show")
            )]));
          } else {
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
                          Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(Icons.person),
                                  title: Text("${e.accreditationNum} | ${e.firstName} ${e.lastName}"),
                                  subtitle: Text("${e.email} \n${e.phoneNum}"),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    TextButton(
                                      child: const Text('APPROVE'),
                                      onPressed: () async {
                                        String message = "";
                                        bool response = await approveDr(e);
                                        if (response) {
                                          setState(() {
                                            message = 'Doctor ${e.firstName} approved';
                                          });
                                        } else {
                                          message = 'An error occured';
                                        }
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text(message)),
                                        );
                                      },
                                    ),
                                    const SizedBox(width: 8),
                                    TextButton(
                                      child: const Text('DENY'),
                                      onPressed: () async {
                                        String message = "";
                                        bool response = await denyDr(e);
                                        if (response) {
                                          setState(() {
                                            message = 'Doctor ${e.firstName} denied';
                                          });
                                        } else {
                                          message = 'An error occured';
                                        }
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text(message)),
                                        );
                                      },
                                    ),
                                    const SizedBox(width: 8),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      ).toList(),
                    ),
                  ),
                ),
              ],
            ),
          );
        }}
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