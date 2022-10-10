import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_calendar_widget/flutter_calendar_widget.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Booking.dart';
import 'MyBooking.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  BookingFormState createState() {
    return BookingFormState();
  }
}

class BookingFormState extends State<BookingPage> {
  final String title = "Booking";
  List<Booking> _selectedEvents = [];

  late EventList<Booking> allAvailabilities;

  DateTime dateSelected = DateTime.now();

  @override
  void initState() {
    super.initState();

    getData();
  }

  Future<EventList<Booking>> getData() async {
    allAvailabilities = await getAllAvailableBookings();
    print("UNVERIFIED DOCTORS");

    return allAvailabilities;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                // Future hasn't finished yet, return a placeholder
                return SafeArea(
                  child: Column(
                    children: const [
                      Center(child: Text("Loading:")),
                    ],
                  ),
                );
              }
              return Container(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    FlutterCalendar(
                        selectionMode: CalendarSelectionMode.single,
                        events: allAvailabilities,
                        onDayPressed: (DateTime date) {
                          setState(() {
                            dateSelected = date;
                          });
                          _selectedEvents = allAvailabilities.get(date);
                          print(_selectedEvents);
                        }),
                    Text(
                        "Date selected: ${DateFormat('dd MMM, yyyy').format(dateSelected)}"),
                    Column(
                      children: _selectedEvents
                          .map((e) => OutlinedButton(
                                onPressed: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  //       return  Booking();
                                  //     }));
                                },
                                child: Text("${e.bookingDate} | ${e.bookingTime} - ${e.bookingEndTime}"),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              );
            })); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

Future<EventList<Booking>> getAllAvailableBookings() async {
  EventList<Booking> bookings;
  List<Booking> allAvailabilities = [];

  final response = await http.get(
// 10.0.2.2 replaces localhost when using android emulator
    Uri.parse('http://10.0.2.2:9000/booking/'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  bookings = EventList(events: {
    DateTime(2022, 10, 11): [
      Booking(
          1, 1, 2, "2022-10-11", "08:00:00", "08:15:00", "url", false, true),
    ]
  });
  // Need to initialise bookings then clear dummy data
  bookings.clear();

  List<dynamic> userMap = jsonDecode(response.body);

  for (var e in userMap) {
    Booking booking = Booking.fromJson(e);
    allAvailabilities.add(booking);
  }

  for (var e in allAvailabilities) {
    DateTime date = convertDate(e.bookingDate);
    bookings.add(date, e);
  }

  return bookings;
}
