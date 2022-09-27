import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DropDownSex.dart';

class SignUpForDoctors extends StatelessWidget {
  const SignUpForDoctors({super.key});
  final String title = "Sign Up for Doctors";
  // String value = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Accreditation Number"),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your accreditation number",
                ),
              ),
              Text("First Name"),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your first name",
                ),
              ),
              Text("Last Name"),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your last name",
                ),
              ),
              Text("Date of Birth"),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your date of birth",
                ),
              ),
              Text("Sex"),
              DropDownSex(key: key),
              Text("Mobile Number"),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your mobile number",
                ),
              ),
              Text("Address"),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your address",
                ),
              ),
              Text("Email"),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your email",
                ),
              ),
              Text("Password"),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your password",
                ),
              ),
              Text("Confirm Password"),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your password",
                ),
              ),
              OutlinedButton(
                child: Text("Sign In"),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void setState(Null Function() param0) {}
}
