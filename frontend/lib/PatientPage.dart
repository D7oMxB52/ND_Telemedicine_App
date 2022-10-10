import 'package:flutter/material.dart';
import 'BookingPage.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  OutlinedButton(
                    child: Text("My Profile"),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                          Profile(user: user)),
                      );
                    },
                  ),
                  OutlinedButton(
                    child: Text("Book Appointment"),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return BookingPage(user: user);
                      }));
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
