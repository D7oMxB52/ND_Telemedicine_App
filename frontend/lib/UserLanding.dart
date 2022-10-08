import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Booking.dart';
import 'Profile.dart';

class UserLanding extends StatelessWidget {
  const UserLanding({super.key, required String text});
  final String title = "User landing page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
        OutlinedButton(
        child: Text("My Profile"),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const Profile();
          }));
        },
      ),
      OutlinedButton(
        child: Text("My Bookings"),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return  Booking();
          }));
        },
        ),
      ]
      ),
      )
    );
  }
}