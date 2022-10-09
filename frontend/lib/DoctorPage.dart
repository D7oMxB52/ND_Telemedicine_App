import 'package:flutter/material.dart';

import 'Booking.dart';
import 'Profile.dart';
import 'User.dart';

class DoctorPage extends StatelessWidget {
  const DoctorPage({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Dr. ${user.firstName}"),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  child: Text("Availabilities"),
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //   return Booking();
                    // }));
                  },
                ),
                OutlinedButton(
                  child: Text("Patients"),
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //   return Booking();
                    // }));
                  },
                ),
              ],
            ),
            Column(
              children: const [
                Text("Todays appointments",
                  style: TextStyle(
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                    height: 300,
                    child: Text("Test Appointment")
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
