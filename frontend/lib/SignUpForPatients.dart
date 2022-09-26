import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpForPatients extends StatelessWidget {
  const SignUpForPatients({super.key});
  final String title = "Sign Up for Patients";
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
              TextField(),
              // DropdownButton <String> (
              //     // value: value,
              //     onChanged: () {},
              //     items: [],
              //     icon: Icon(Icons.keyboard_arrow_down)
              // ),
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
                onPressed: () { },
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void setState(Null Function() param0) {}
}