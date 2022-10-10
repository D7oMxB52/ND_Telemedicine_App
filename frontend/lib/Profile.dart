import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ProfileObject.dart';
import 'User.dart';
import 'dart:convert';

class Profile extends StatefulWidget {
  const Profile({super.key, required this.user});
  final User user;

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
  ProfileObject profile = ProfileObject(1, 1, 12.0, 11.2, "I am sick");
  @override
  void initState() {
    super.initState();

  getData();
  }

  Future<ProfileObject> getData() async {
    profile = await getProfile();
    return profile;
  }

  Future<ProfileObject> getProfile() async {
    final response = await http.get(
// 10.0.2.2 replaces localhost when using android emulator
      Uri.parse('http://localhost:8080/api/healthinfo/${widget.user.userId}'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print("________________ 1" );
    print(response.body);
    print("xxxxxxxxxxxxx");
    // List<dynamic> result = jsonDecode(response.body);
    String result = response.body;

    Map<String, dynamic> map = jsonDecode(result) as Map<String, dynamic>; // import 'dart:convert';

    int userId = map['userId'];
    int profileId = map['profileId'];
    double height = map['height'];
    double weight = map['weight'];
    String healthStatus = map ['healthStatus'];

    print("PRINT PROFILE INFORMATIon");
    print(userId);
    print(profileId);
    print(height);
    print(weight);
    print(healthStatus);

    ProfileObject profile = ProfileObject(userId, profileId, height, weight, healthStatus);
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
                Expanded(
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          title: Text("My profile"),
                          subtitle: Text("Status: ${profile.healthStatus} "
                              "\nHeight: ${profile.height}"
                              "\nWeight ${profile.weight}"),
                        ),
                      ]
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