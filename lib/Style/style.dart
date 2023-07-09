import 'package:flutter/material.dart';

const colorRed = Color.fromRGBO(231, 28, 36, 1);
const colorGreen = Color.fromRGBO(33, 191, 115, 1);
const colorWhite = Color.fromRGBO(255,255, 255, 1);
const colorDarkBlue = Color.fromRGBO(231, 28, 36, 1);

InputDecoration AppInputDecoration(label){
  return InputDecoration(
    border: const OutlineInputBorder(),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: colorGreen, width: 1)
    ),
    fillColor: colorWhite,
    filled: true,
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: colorWhite, width: 0)
    ),
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
    labelText: label,
  );
}