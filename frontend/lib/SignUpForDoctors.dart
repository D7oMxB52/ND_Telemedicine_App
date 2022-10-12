import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_widget/flutter_calendar_widget.dart';

import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';

import 'DateOfBirthWidget.dart';
import 'package:intl/intl.dart';

import 'DropDownSex.dart';
import 'package:http/http.dart' as http;


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
  DateTime? dateOfBirth;

  @override
  Widget build(BuildContext context) {

    final accreditationNumberController = TextEditingController();
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final mobileNumberController = TextEditingController();
    final addressController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();


    // VALIDATORS FOR EACH FIELD

    String? validateAccreditationNumber(String? value) {
      if (value == null || value.isEmpty) {
        return 'Accreditation number cannot be blank';
      } else if (value.length < 5) {
        return 'Enter valid accreditation number';
      } else {
        return null;
      }
    }

    String? validateFirstName(String? value) {
      if (value == null || value.isEmpty)
        return 'First name cannot be blank';
      else
        return null;
    }

    String? validateLastName(String? value) {
      if (value == null || value.isEmpty)
        return 'Last name cannot be blank';
      else
        return null;
    }

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

    String? validateMobile(String? value) {
      String pattern = r'^[+0-9][0-9]*';
      RegExp regex = RegExp(pattern);
      if (value == null || value.isEmpty) {
        return 'Mobile number cannot be blank';
      } else if(!regex.hasMatch(value)) {
        return 'Enter valid mobile number';
      } else {
        return null;
      }
    }

    String? validateAddress(String? value) {
      if (value == null || value.isEmpty)
        return 'Address cannot be blank';
      else
        return null;
    }

    String? validatePassword(String? value) {
      String pattern = r'^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,16}$';
      RegExp regex = RegExp(pattern);
      if (value == null || value.isEmpty) {
        return 'Password cannot be blank';
      } else if (!regex.hasMatch(value)) {
        return 'Password must be 8-16 characters and contain at least: \n        - 1 uppercase letter [A-Z]\n        - 1 lowercase letter [a-z]\n        - 1 number [0-9]\n        - 1 special character [!@#\$%^&*]';
      } else {
        return null;
      }
    }
    String? validateConfirmPassword(String? value) {
      if (value == null || value.isEmpty) {
        return 'Password cannot be blank';
      } else if (passwordController.text != confirmPasswordController.text) {
        return 'Passwords do not match';
      } else {
        return null;
      }
    }
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              children: [
                Text("Accreditation Number"),
                TextFormField(
                  controller: accreditationNumberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your accreditation number",
                  ),
                  validator: validateAccreditationNumber,
                ),
                Text("First Name"),
                TextFormField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your first name",
                  ),
                  validator: validateFirstName,
                ),
                Text("Last Name"),
                TextFormField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your last name",
                  ),
                  // The validator receives the text that the user has entered.
                  validator: validateLastName,
                ),
                Text("Date of Birth"),
                ElevatedButton(onPressed: () {
                  _DateOfBirthWidget(context);
                }, child: Text("Select DOB")),
                // if (dateOfBirth != null)...[
                //   Text(dateOfBirth.toString()),
                // ],
                Text("Mobile Number"),
                TextFormField(
                  controller: mobileNumberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your mobile number",
                  ),
                  validator: validateMobile,
                ),
                Text("Address"),
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your address",
                  ),
                  validator: validateAddress,
                ),
                Text("Email"),
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
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your password",
                  ),
                  validator: validatePassword,
                ),
                Text("Confirm Password"),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your password",
                  ),
                  validator: validateConfirmPassword,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0),
            child: ElevatedButton(
              onPressed: () async {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Form validated')),
                  );
                  // Test printouts
                  print("FORM VALIDATED - RESULTS BELOW");
                  var dateOfBirthText = DateFormat('yyyy-MM-dd').format(dateOfBirth!);
                  print("dateOfBirth: $dateOfBirthText");
                  print("firstName: ${firstNameController.text}");
                  print("lastName: ${lastNameController.text}");
                  print("mobile: ${mobileNumberController.text}");
                  print("address: ${addressController.text}");
                  print("email: ${emailController.text}");
                  print("password: ${passwordController.text}");
                  print("accreditation number: ${accreditationNumberController.text}");

                  // TO DO: API error handling & redirection
                  final response = await http.post(
                    // 10.0.2.2 replaces localhost when using android emulator
                      Uri.parse('http://localhost:8080/ndt/users'),
                      headers:{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode({
                        "accreditation_num": accreditationNumberController.text,
                        "firstName": firstNameController.text,
                        "lastName": lastNameController.text,
                        "dateOfBirth": DateFormat('yyyy-MM-dd').format(dateOfBirth!),
                        "email": emailController.text,
                        "password": passwordController.text,
                        "address": addressController.text,
                        "phoneNum": mobileNumberController.text,
                        "role": "DR",
                        "active": true
                      })
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
  Future<void> _DateOfBirthWidget(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final datePicked = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DateOfBirthWidget()),
    );

    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    if (!mounted) return;

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    setState(() {
      dateOfBirth = datePicked;
    });
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$datePicked')));
  }
}