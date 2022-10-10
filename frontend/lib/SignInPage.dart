import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'AdminPage.dart';
import 'DoctorPage.dart';
import 'PatientPage.dart';
import 'User.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
  final String title = "Sign In";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MyCustomForm(),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Email address"),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your email",
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email address';
              }
              return null;
            },
          ),
          Text("Password"),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your password",
            ),
            obscureText: true,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
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
                    Map<String, dynamic> userMap = jsonDecode(response.body);
                    User user = User.fromJson(userMap);
                    if (user.role == "PA") {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                          PatientPage(user: user)),
                      );
                    } else if (user.role == "DR" && user.verified == true) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                          DoctorPage(user: user)),
                      );
                    } else if (user.role == "AD") {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                          AdminPage(user: user)),
                      );
                    } else {
                      // SEND TO NO ACCESS PAGE. PLEASE CONTACT ADMIN
                    }

                  }
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
