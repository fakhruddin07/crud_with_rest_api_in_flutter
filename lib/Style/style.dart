import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

const colorRed = Color.fromRGBO(231, 28, 36, 1);
const colorGreen = Color.fromRGBO(33, 191, 115, 1);
const colorWhite = Color.fromRGBO(255, 255, 255, 1);
const colorDarkBlue = Color.fromRGBO(231, 28, 36, 1);

InputDecoration appInputDecoration(label) {
  return InputDecoration(
    border: const OutlineInputBorder(),
    focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: colorGreen, width: 1)),
    fillColor: colorWhite,
    filled: true,
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: colorWhite, width: 0)),
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
    labelText: label,
  );
}

SvgPicture backgroundScreen(context) {
  return SvgPicture.asset(
    "assets/images/backgroundImg3.svg",
    alignment: Alignment.center,
    fit: BoxFit.fill,
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
  );
}

DecoratedBox dropDownStyle(child) {
  return DecoratedBox(
    decoration: BoxDecoration(
        color: colorWhite,
        border: Border.all(color: colorWhite, width: 1),
        borderRadius: BorderRadius.circular(4)),
    child: Padding(
      padding: const EdgeInsets.only(left: 22, right: 22),
      child: child,
    ),
  );
}

ButtonStyle appButtonStyle() {
  return ElevatedButton.styleFrom(
      elevation: 1,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)));
}

Ink buttonChild(buttonText) {
  return Ink(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      color: colorGreen,
    ),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(
        buttonText,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
    ),
  );
}

void errorToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorRed,
      textColor: colorWhite,
      fontSize: 16.0
  );
}

void successToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorGreen,
      textColor: colorWhite,
      fontSize: 16.0
  );
}