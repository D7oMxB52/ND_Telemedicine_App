import 'package:flutter/material.dart';

class NoAccess extends StatelessWidget {
  const NoAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Please contact your Administrator"),
                OutlinedButton(
                  child: Text("Return to home"),
                  onPressed: () {
                    Navigator.pop(context);
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
