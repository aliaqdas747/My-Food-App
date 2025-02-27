import 'package:flutter/material.dart';

class CustomEmailField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const CustomEmailField({super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 48,
      child: TextField(
        controller: controller,
        cursorColor: Colors.green,
        decoration: InputDecoration(
          label: Text(label, style: TextStyle(color: Color(0xFF435A39))),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: Color(0xFF435A39)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: Color(0xFF435A39), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),

            borderSide: BorderSide(color: Color(0xFF435A39), width: 1),
          ),
        ),
      ),
    );
  }
}
