import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_widget/flutter_calendar_widget.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Booking extends StatelessWidget {
  const Booking({super.key}) ;
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
            FlutterCalendar(
                selectionMode: CalendarSelectionMode.single,
                onDayPressed: (DateTime date) {
                  print(date);
                }
            ),
            OutlinedButton(
              child: Text("Appointment 1"),
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Booking();
              }));},
            ),
            OutlinedButton(
              child: Text("Appointment 2"),
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Booking();
              }));},
            ),
            OutlinedButton(
              child: Text("Appointment 3"),
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Booking();
              }));},
            ),
            OutlinedButton(
              child: Text("Appointment 4"),
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Booking();
              }));},
            ),
           ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}