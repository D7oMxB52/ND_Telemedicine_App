import 'package:flutter/material.dart';

import 'main.dart';

class NoAccess extends StatelessWidget {
  const NoAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Access denied"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Column(
                children: [
                  Text("Please contact your Administrator"),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: Column(
                      children: [
                        OutlinedButton(
                          child: Text("Return to home"),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const MyApp();
                            }));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
