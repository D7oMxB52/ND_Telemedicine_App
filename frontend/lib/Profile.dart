import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ProfileObject.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  final String title = "My profile";

  @override
  ProfileState createState() {
    return ProfileState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build ????
    throw UnimplementedError();
  }
}

class ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();

    getData();
  }

  Future<ProfileObject> getData() async {
    ProfileObject profile = await getProfile();
    return profile;
  }

  Future<ProfileObject> getProfile() async {
    // List<User> users = [];

    final response = await http.get(
// 10.0.2.2 replaces localhost when using android emulator
      Uri.parse('http://localhost:8080/ndt/api/healthinfo/1'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print("________________");
    print(response.body);

    List<dynamic> result = jsonDecode(response.body);

    ProfileObject profile = ProfileObject.fromJson(result[0]);
    print(profile.userId);
    print(profile.profileId);
    print(profile.height);
    print(profile.weight);
    print(profile.healthStatus);

    return profile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
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
                    child: Text("My profile information")
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: Text()
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