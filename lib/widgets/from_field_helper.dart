import 'package:flutter/material.dart';
import '../widgets/constants.dart';

Widget buildTextFormField(
    TextEditingController controller,
    String hintText,
    {int maxLines = 1, bool isEmail = false}
    ) {
  return TextFormField(
    controller: controller,
    maxLines: maxLines,
    decoration: InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300)),
      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
    ),
    validator: (value) {
      if (value!.isEmpty) return '$hintText is required';
      if (isEmail && !RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$").hasMatch(value)) return 'Enter a valid email';
      return null;
    },
  );
}
