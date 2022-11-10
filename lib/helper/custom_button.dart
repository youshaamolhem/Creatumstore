import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  CustomButton({Key? key, @required this.label, @required this.callback})
      : super(key: key);
  VoidCallback? callback;
  String? label;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.callback,
      child: Container(
          height: 40.0,
          width: 160.0,
          child: Center(
            child: Text(
              widget.label!,
              style: TextStyle(color: Colors.white),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(20.0),
          )),
    );
  }
}
