import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Booking.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  final String title = "My profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
      ),
      body: Center(
        child: Column(
          children: [
              Column(
              children: const [
              Text("My profile information",
                style: TextStyle(
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                  height: 300,
                  child: Text("Test Appointment") // Add Profile information here
              ),
              ],
            ),
            Column(
              children: const [
                Text("Prescriptions",
                  style: TextStyle(
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                    height: 300,
                    child: Text("PLACEHOLER FOR PRESCRIPTION")
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}