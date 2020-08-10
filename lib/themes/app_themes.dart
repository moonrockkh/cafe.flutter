import 'package:flutter/material.dart';

Color primaryColor = Color(0xff731b38);
Color secondaryColor = Color(0xffFBF3E7);

// Class Session Color
Color notConfirmColor = Color(0xff0097a7);
Color confirmColor = Color(0xff33691e);

// Home menu button Color
Color routineColor = Color(0xff048d79);
Color attendanceColor = Color(0xff3f51b5);
Color calendarColor = Color(0xffff5a60);
Color schoolColor = Color(0xffe55437);
Color contactColor = Color(0xff016748);

// School Admin Management Dashboard Button Color
Color employeeButtonColor = Color(0xff3f51b5);
Color classButtonColor = Color(0xffe55437);

// Children Dashboard for Parent Button Color
Color childProfileColor = Color(0xffe55437);
Color childScoreColor = Color(0xffff5a60);
Color childMisconductColor = Colors.blueAccent;

final ThemeData ligthTheme = ThemeData(
  primaryColor: Color(0xff731b38),
  primaryColorLight: Colors.pink[300],
  accentColor: Color(0xffcf3065),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: primaryColor),
      actionsIconTheme: IconThemeData(color: primaryColor),
      color: Colors.white,
      textTheme: TextTheme(
        headline6: TextStyle(color: Colors.black, fontSize: 18),
      )),
  bottomAppBarTheme: BottomAppBarTheme(),
  tabBarTheme: TabBarTheme(labelColor: Colors.black),
  backgroundColor: Colors.white,
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    helperStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    hintStyle: TextStyle(
      color: Colors.grey,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    errorStyle: TextStyle(
      color: Colors.redAccent,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    errorMaxLines: null,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    isDense: false,
    contentPadding:
        EdgeInsets.only(top: 12.0, bottom: 12.0, left: 12.0, right: 12.0),
    isCollapsed: false,
    prefixStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    suffixStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    counterStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    filled: false,
    fillColor: Color(0x00000000),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  primaryColor: Color(0xff009996),
  primaryColorLight: Colors.green[200],
  accentColor: Colors.green[300],
  backgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Color(0xff009996)),
      actionsIconTheme: IconThemeData(color: Color(0xff009996)),
      color: Colors.white,
      textTheme: TextTheme(
        headline6: TextStyle(color: Colors.black, fontSize: 18),
      )),
  bottomAppBarTheme: BottomAppBarTheme(),
  tabBarTheme: TabBarTheme(labelColor: Colors.black),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    helperStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    hintStyle: TextStyle(
      color: Colors.grey,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    errorStyle: TextStyle(
      color: Colors.redAccent,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    errorMaxLines: null,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    isDense: false,
    contentPadding:
        EdgeInsets.only(top: 12.0, bottom: 12.0, left: 12.0, right: 12.0),
    isCollapsed: false,
    prefixStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    suffixStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    counterStyle: TextStyle(
      color: Color(0xdd000000),
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    filled: false,
    fillColor: Color(0x00000000),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
  ),
);