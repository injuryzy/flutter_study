import 'package:flutter/material.dart';

Widget commonInput(String Text,
    {bool isPassword = false,
      TextEditingController? controller,
      ValueChanged<String>? onChanged}) {
  return TextField(
    onChanged: onChanged,
    style: TextStyle(color: Colors.white, fontSize: 12),
    controller: controller,
    obscureText: isPassword,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0.5)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1)),
      labelText: Text,
      labelStyle: TextStyle(color: Colors.white),
      border: InputBorder.none,
    ),
  );
}


Widget whiteBordButton({String? title,GestureTapCallback? onTap }) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(top: 40, left: 40, right: 40),
      alignment: Alignment.center,
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.white)),
      child: Text(
        title??"",
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}