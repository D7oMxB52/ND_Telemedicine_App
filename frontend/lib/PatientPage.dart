import 'dart:convert';

import 'package:flutter/material.dart';
import 'Booking.dart';
import 'BookingPage.dart';
import 'package:intl/intl.dart';

import 'Profile.dart';
import 'package:http/http.dart' as http;

import 'User.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({super.key, required this.user});
  final User user;

  @override
  PatientPageState createState() {
    return PatientPageState();
  }
}

class PatientPageState extends State<PatientPage> {
  List<Booking> patientBookings = [];

  @override
  void initState() {
    super.initState();

    getData();
  }

  Future<List<Booking>> getData() async {
    patientBookings = await getAllPatientBookings(widget.user);

    return patientBookings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome ${widget.user.firstName}'),
        ),
        body: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                // Future hasn't finished yet, return a placeholder
                return SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        child: Text("My Profile"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Profile(user: widget.user)),
                          );
                        },
                      ),
                      OutlinedButton(
                        child: Text("Book Appointment"),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return BookingPage(user: widget.user);
                          }));
                        },
                      ),
                    ],
                  ),
                );
              }
              return Container(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          child: Text("My Profile"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Profile(user: widget.user)),
                            );
                          },
                        ),
                        OutlinedButton(
                          child: Text("Book Appointment"),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return BookingPage(user: widget.user);
                            }));
                          },
                        ),
                      ],
                    ),
                    if (patientBookings.isNotEmpty)...[
                      Center(
                          child: Text("Upcoming appointment")
                      ),
                    ] else...[
                      Center(
                          child: Text("No upcoming appointments")
                      ),
                    ],
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column (
                          children: patientBookings.map((e) =>
                              Card(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      leading: Icon(Icons.calendar_month),
                                      title: Text("${DateFormat('dd MMM, yyyy').format(convertDate(e.bookingDate))}  |  ${e.bookingTime.substring(0, 5)} - ${e.bookingEndTime.substring(0, 5)}"),
                                      subtitle: Text("You will be seeing Dr. ${e.doctorId}"),
                                    ),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.end,
                                    //   children: <Widget>[
                                    //     TextButton(onPressed: () {}, child: const Text("CANCEL")),
                                    //   ],
                                    // )
                                  ],
                                ),
                              )
                            ).toList(),
                        )
                      )
                    )

                ]),

              );
            }));
  }
}

Future<List<Booking>> getAllPatientBookings(User user) async {
  List<Booking> bookings = [];

  final response = await http.get(
// 10.0.2.2 replaces localhost when using android emulator
    Uri.parse('http://10.0.2.2:9000/booking/patient${user.userId}'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.body.contains("timestamp")) {
    print("Server error");
  } else {
    List<dynamic> bookingList = jsonDecode(response.body);

    for (var e in bookingList) {
      Booking booking = Booking.fromJson(e);
      // Only add the first of the bookings if available
      if (bookings.length < 1) {
        bookings.add(booking);
      }
    }
  }

  return bookings;
}
