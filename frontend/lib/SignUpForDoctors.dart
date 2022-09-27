import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';

import 'DateOfBirthWidget.dart';
import 'DropDownSex.dart';

class SignUpForDoctors extends StatelessWidget {
  const SignUpForDoctors({super.key});
  final String title = "Sign Up for Doctors";

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
              const MyCustomForm(),
            ],
          ),
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
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Accreditation Number"),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your accreditation number",
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your accreditation number';
              }
              return null;
            },
          ),
          Text("First Name"),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your first name",
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first name';
              }
              return null;
            },
          ),
          Text("Last Name"),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your last name",
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your last name';
              }
              return null;
            },
          ),
          Text("Date of Birth"),
          DateOfBirthWidget(),
          // TextFormField(
          //   decoration: InputDecoration(
          //     border: OutlineInputBorder(),
          //     hintText: "Enter your date of birth",
          //   ),
          // ),
          Text("Sex"),
          DropDownSex(),
          Text("Mobile Number"),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your mobile number",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your mobile number';
              }
              return null;
            },
          ),
          Text("Address"),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your address",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your address';
              }
              return null;
            },
          ),
          Text("Email"),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your email",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          Text("Password"),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your password",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          Text("Confirm Password"),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your password",
            ),
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
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
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