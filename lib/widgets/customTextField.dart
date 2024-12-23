import 'package:flutter/material.dart';

Widget buildInputField({
  required TextEditingController controller,
  required String hintText,
  bool obscureText = false,
}) {
  return Container(
    width: 324,
    margin: EdgeInsets.only(left: 10),
    child: TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(
        color: Color(0XB2000000),
        fontSize: 13,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0XB2000000),
          fontSize: 13,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide.none,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Color(0XFFFFFFFF),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 14,
        ),
      ),
    ),
  );
}
