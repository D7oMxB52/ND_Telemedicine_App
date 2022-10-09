import 'package:flutter/material.dart';

import 'User.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key, required this.user});
  final String title = "Admin";
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin - ${user.firstName}"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
              children: [
                OutlinedButton(
                  child: Text("Verify Doctors"),
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //   return Booking();
                    // }));
                  },
                ),
                OutlinedButton(
                  child: Text("All Users"),
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //   return Booking();
                    // }));
                  },
                ),
              ],
            ),
        ),
      );
  }
}
