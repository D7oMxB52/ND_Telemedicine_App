import 'dart:convert';
import 'package:flutter/material.dart';

import 'DateOfBirthWidget.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;

import 'Validation.dart';

class SignUpForDoctors extends StatefulWidget {
  const SignUpForDoctors({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<SignUpForDoctors> {
  final _formKey = GlobalKey<FormState>();
  final String title = "Sign Up for Doctors";

  DateTime? dateOfBirth;
  String? accreditationNumInput;
  String? firstNameInput;
  String? lastNameInput;
  String? mobileInput;
  String? addressInput;
  String? emailInput;
  String? passwordInput;
  String? confirmPasswordInput;


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

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
                "Please enter your details below",
                style: Theme.of(context).textTheme.headline1
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: accreditationNumberController,
              decoration: const InputDecoration(
                hintText: "Accreditation number",
              ),
              validator: validateAccreditationNumber,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: firstNameController,
              decoration: const InputDecoration(
                hintText: "First name",
              ),
              validator: validateFirstName,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: lastNameController,
              decoration: const InputDecoration(
                hintText: "Last name",
              ),
              validator: validateLastName,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 160,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          accreditationNumInput = accreditationNumberController.text;
                          firstNameInput = firstNameController.text;
                          lastNameInput = lastNameController.text;
                          mobileInput = mobileNumberController.text;
                          addressInput = addressController.text;
                          emailInput = emailController.text;
                          passwordInput = passwordController.text;
                          confirmPasswordInput = confirmPasswordController.text;
                        });

                        showDateOfBirthWidget(context);
                      },
                      child: const Text("Date of birth")),
                ),
                if (dateOfBirth != null) ...[
                  SizedBox(
                    width: 160,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        DateFormat('dd/MM/yyyy').format(dateOfBirth!),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: mobileNumberController,
              decoration: const InputDecoration(
                hintText: "Mobile number",
              ),
              validator: validateMobile,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(
                hintText: "Address",
              ),
              validator: validateAddress,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Email",
              ),
              validator: validateEmail,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
              validator: validatePassword,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Confirm your password",
              ),
              validator: (value) {
                return validateConfirmPassword(
                    value: value, password: passwordController.text);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final response = await http.post(
                          // 10.0.2.2 replaces localhost when using android emulator
                            Uri.parse('http://10.0.2.2:8080/ndt/users'),
                            headers: {
                              'Content-Type': 'application/json; charset=UTF-8',
                            },
                            body: jsonEncode({
                              "accreditation_num":
                              accreditationNumberController.text,
                              "firstName": firstNameController.text,
                              "lastName": lastNameController.text,
                              "dateOfBirth":
                              DateFormat('yyyy-MM-dd').format(dateOfBirth!),
                              "email": emailController.text,
                              "password": passwordController.text,
                              "address": addressController.text,
                              "phoneNum": mobileNumberController.text,
                              "role": "DR",
                              "active": true
                            }));

                        // TODO: Redirect for Doctor?
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showDateOfBirthWidget(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final datePicked = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DateOfBirthWidget()),
    );

    if (!mounted) return;

    setState(() {
      dateOfBirth = datePicked;
    });
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$datePicked')));
  }
}
