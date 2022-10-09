import 'package:flutter/material.dart';
import 'Booking.dart';
import 'Profile.dart';
import 'User.dart';

class PatientPage extends StatelessWidget {
  const PatientPage({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ${user.firstName}'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate back to first route when tapped.
              },
              child: const Text('Go back!'),
            ),
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
                  return Booking();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
