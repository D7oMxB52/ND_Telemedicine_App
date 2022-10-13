import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'BookingPage.dart';
import 'PatientPage.dart';
import 'ProfileObject.dart';
import 'User.dart';
import 'dart:convert';

import 'main.dart';

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
  ProfileObject? profile;
  @override
  void initState() {
    super.initState();

    getData();
  }

  Future<ProfileObject?> getData() async {
    profile = await getProfile();
    print(profile);
    return profile;
  }

  Future<ProfileObject?> getProfile() async {
    final response = await http.get(
// 10.0.2.2 replaces localhost when using android emulator
      Uri.parse('http://10.0.2.2:8080/api/healthinfo/get${widget.user.userId}'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print("RESPONSE BODY");
    print(response.body);
    if (response.body.isNotEmpty) {
      Map<String, dynamic> map = jsonDecode(response.body)
          as Map<String, dynamic>; // import 'dart:convert';

      int userId = map['userId'];
      int profileId = map['profileId'];
      double height = map['height'];
      double weight = map['weight'];
      String healthStatus = map['healthStatus'];

      ProfileObject profile =
          ProfileObject(userId, profileId, height, weight, healthStatus);
      return profile;
    }
    return ProfileObject(-1, -1, -1.0, -1.0, "error");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Profile"),
        ),
        drawer: Drawer(
          width: 240,
          child: Column(
            children: [
              const SizedBox(
                height: 120.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(color: Colors.green),
                  child: Text('Neighbourhood Doctors Telemedicine'),
                ),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PatientPage(user: widget.user)),
                  );
                },
              ),
              ListTile(
                title: const Text('My Profile'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Profile(user: widget.user)),
                  );
                },
              ),
              ListTile(
                title: const Text('Book Appointment'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BookingPage(user: widget.user);
                  }));
                },
              ),
              Expanded(child: Container()),
              ListTile(
                title: const Text('Log Out'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MyApp();
                  }));
                },
              ),
            ],
          ),
        ),
        body: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                // Future hasn't finished yet, return a placeholder
                return SafeArea(
                  child: Center(
                      child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: Text("Loading...",
                              style: Theme.of(context).textTheme.headline4)),
                    ],
                  )),
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
                              if (profile?.healthStatus != "error") ...[
                                ListTile(
                                  title: Text("My profile"),
                                  subtitle:
                                      Text("Status: ${profile?.healthStatus} "
                                          "\nHeight: ${profile?.height}"
                                          "\nWeight ${profile?.weight}"),
                                ),
                              ] else ...[
                                const SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text("Nothing to show",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4)),
                              ],
                            ]),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
