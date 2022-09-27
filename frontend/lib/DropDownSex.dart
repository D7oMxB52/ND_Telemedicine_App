import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownSex extends StatefulWidget {
  DropDownSex({Key? key}) : super(key: key);

  @override
  _DropDownSexState createState() => _DropDownSexState();
}

class _DropDownSexState extends State<DropDownSex> {
  int selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<int>(
          value: selectedValue,
          items: [
            DropdownMenuItem(
              child: Text("Male"),
              value: 1,
            ),
            DropdownMenuItem(
              child: Text("Female"),
              value: 2,
            ),
            DropdownMenuItem(
              child: Text("Others"),
              value: 3,
            ),
          ],
          onChanged: (value) {
            setState(() {
              selectedValue = value!;
            });
          },
          icon: Icon(Icons.keyboard_arrow_down)),
    );
  }
}
