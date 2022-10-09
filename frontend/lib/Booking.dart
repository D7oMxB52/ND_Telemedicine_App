
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
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
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
  var _selectedEvents = ['Appointment 1', 'Appointment 2'];

  DateTime dateSelected = DateTime.now();

  // Test appointments for calendar
  EventList<String> events = EventList(
      events: {
        DateTime(2022, 10, 9): [
          'Appointment 1',
          'Appointment 2',
        ],
        DateTime(2022, 10, 19): [
          'Appointment 1',
          'Appointment 2',
        ],

  }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            FlutterCalendar(
                selectionMode: CalendarSelectionMode.single,
                events: events,
                onDayPressed: (DateTime date) {
                  setState(() {
                    dateSelected = date;
                  });
                  _selectedEvents = events.get(date);
                  print(_selectedEvents);
                }),
            Text("Date selected: ${DateFormat('dd MMM, yyyy').format(dateSelected)}"),
            Container(
              child: Column(
                children: _selectedEvents.map((e) =>
                    OutlinedButton(
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) {
                        //       return  Booking();
                        //     }));
                      },
                      child: Text(e),
                    )
                ).toList(),
              ),
            ),
          ],
        ),
    );    // This trailing comma makes auto-formatting nicer for build methods.
  }
}