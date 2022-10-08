import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';

class DateOfBirthWidget extends StatefulWidget {
  @override
  _DateOfBirthWidget createState() => _DateOfBirthWidget();
}

class _DateOfBirthWidget extends State<DateOfBirthWidget> {
  // DateTime? _selectedDate;
  //
  // @override
  // Widget build(BuildContext context) {
  //   return ElevatedButton(
  //         child: Text("Open date picker dialog"),
  //         onPressed: () async {
  //           var datePicked = await DatePicker.showSimpleDatePicker(
  //             context,
  //             initialDate: DateTime(2000),
  //             firstDate: DateTime(1960),
  //             lastDate: DateTime(2022),
  //             dateFormat: "dd-MMMM-yyyy",
  //             locale: DateTimePickerLocale.en_us,
  //             looping: true,
  //           );
  //
  //           final snackBar = SnackBar(content: Text("Date Picked $datePicked"));
  //           ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //           Navigator.pop(context, datePicked);
  //         },
  //     );
  // }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Pick an option'),
  //     ),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: ElevatedButton(
  //               onPressed: () {
  //                 // Close the screen and return "Yep!" as the result.
  //                 Navigator.pop(context, 'Yep!');
  //               },
  //               child: const Text('Yep!'),
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: ElevatedButton(
  //               onPressed: () {
  //                 // Close the screen and return "Nope." as the result.
  //                 Navigator.pop(context, 'Nope.');
  //               },
  //               child: const Text('Nope.'),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.grey[900]!,
                  Colors.black,
                ],
                stops: const [0.7, 1.0],
              )),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: DatePickerWidget(
                    looping: false,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1922), //DateTime(1960),
                     lastDate: DateTime.now(),
                    dateFormat:
                    // "MM-dd(E)",
                    "dd/MMMM/yyyy",
                    // locale: DatePicker.localeFromString('th'),
                    onChange: (DateTime newDate, _) {
                      setState(() {
                        _selectedDate = newDate;
                      });
                      // print(_selectedDate);
                    },
                    pickerTheme: DateTimePickerTheme(
                      backgroundColor: Colors.transparent,
                      itemTextStyle:
                      TextStyle(color: Colors.white, fontSize: 19),
                      dividerColor: Colors.white,
                    ),
                  ),
                ),
               ElevatedButton(
                  onPressed: () {
                    // Close the screen and return "Nope." as the result.
                    Navigator.pop(context, _selectedDate);
                  },
                  child: const Text('Select date'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}