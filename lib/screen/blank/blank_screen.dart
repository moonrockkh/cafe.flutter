import 'package:flutter/material.dart';

class BlankScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blank Screen"),
      ),
      body: Container(),
    );
  }
}