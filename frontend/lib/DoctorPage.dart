import 'package:flutter/material.dart';

import 'BookingPage.dart';
import 'Profile.dart';
import 'User.dart';
import 'main.dart';

class DoctorPage extends StatelessWidget {
  const DoctorPage({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Dr. ${user.firstName}"),
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
                      builder: (context) => DoctorPage(user: user)),
                );
              },
            ),
            ListTile(
              title: const Text('Availabilities'),
              onTap: () {
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
      body: Center(
        child: Column(
          children: [
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
