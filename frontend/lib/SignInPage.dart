import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'AdminPage.dart';
import 'DoctorPage.dart';
import 'PatientPage.dart';
import 'User.dart';
import 'NoAccess.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final String title = "Sign In";
  bool signInFailed = false;
  String? emailInput;

  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Email cannot be blank';
    } else if(!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {

    final emailController = TextEditingController(text: emailInput);
    final passwordController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
        title: Text(title),
    ),
      body:

      Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Image.asset('assets/ndt.png', height: 130),

          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Text("Email address"),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your email",
                  ),
                  validator: validateEmail,
                ),
                Text("Password"),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your password",
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                if (signInFailed)...[
                  const Text(
                      "Email and/or password are incorrect",
                      style: TextStyle(color: Colors.red),),
        ],

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {

                  print("FORM VALIDATED - RESULTS BELOW");
                  print("email: ${emailController.text}");
                  print("password: ${passwordController.text}");

                  final response = await http.post(
                      // 10.0.2.2 replaces localhost when using android emulator
                      Uri.parse('http://10.0.2.2:8080/ndt/login'),
                      headers: {
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode({
                        "email": emailController.text,
                        "password": passwordController.text,
                      }));
                  print(response.body);
                  if (response.body.isNotEmpty) {
                    print(response.body);
                    Map<String, dynamic> userMap = jsonDecode(response.body);
                    User user = User.fromJson(userMap);
                    print("CHECK ROLE FOR INVALID OBJECT " + user.role);

                    if (user.verified == true) {
                      if (user.role == "PA") {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) =>
                            PatientPage(user: user)),
                        );
                      } else if (user.role == "DR") {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) =>
                            DoctorPage(user: user)),
                        );
                      } else if (user.role == "AD") {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) =>
                            AdminPage(user: user)),
                        );
                      }
                    } else {
                      print("USER HAS NOT BEEN VALIDATED");
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) =>
                          NoAccess()),
                      );
                    }
                  } else {
                    passwordController.clear();
                    setState(() {
                      signInFailed = true;
                      emailInput = emailController.text;
                    });
                    print("FALLTHROUGH: USER CAN'T ACCESS ACCOUNT FOR WHATEVER REASON");
                  }
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
