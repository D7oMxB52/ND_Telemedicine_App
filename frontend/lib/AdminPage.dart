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
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
