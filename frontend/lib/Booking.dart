import 'package:flutter/material.dart';
import 'package:flutter_calendar_widget/flutter_calendar_widget.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert';

import 'MyBooking.dart';

class Booking extends StatelessWidget {
  Booking({super.key});
  final String title = "Booking";

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
            const BookingForm(),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class BookingForm extends StatefulWidget {
  const BookingForm({super.key});

  @override
  BookingFormState createState() {
    return BookingFormState();
  }
}

class BookingFormState extends State<BookingForm> {

  DateTime dateSelected = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterCalendar(
                selectionMode: CalendarSelectionMode.single,
                onDayPressed: (DateTime date) {
                  setState(() {
                    dateSelected = date;
                  });
                }),
            Text("Date selected: ${DateFormat('dd MMM, yyyy').format(dateSelected)}"),
            OutlinedButton(
              child: Text("Appointment 1"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return  Booking();
                }));
              },
            ),
            OutlinedButton(
              child: Text("Appointment 2"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return  Booking();
                }));
              },
            ),
            OutlinedButton(
              child: Text("Appointment 3"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return  Booking();
                }));
              },
            ),
            OutlinedButton(
              child: Text("Appointment 4"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return  Booking();
                }));
              },
            ),
          ],
        ),
      ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}