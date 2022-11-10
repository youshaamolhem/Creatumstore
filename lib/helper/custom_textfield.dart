import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  CustomTextField({this.hintText, this.onChanged});
  String? hintText;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: hintText,
            label: Text('$hintText'),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(16.0))),
      ),
    );
  }
}
