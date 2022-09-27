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
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          child: Text("Open date picker dialog"),
          onPressed: () async {
            var datePicked = await DatePicker.showSimpleDatePicker(
              context,
              initialDate: DateTime(2000),
              firstDate: DateTime(1960),
              lastDate: DateTime(2022),
              dateFormat: "dd-MMMM-yyyy",
              locale: DateTimePickerLocale.en_us,
              looping: true,
            );
            final snackBar = SnackBar(content: Text("Date Picked $datePicked"));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
      );
  }
}