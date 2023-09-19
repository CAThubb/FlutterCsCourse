import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Image.asset("assets/images/image1.png")
        ),
        appBar: AppBar(
          backgroundColor: Color(0xFF80CBC4),
          foregroundColor: Color(0xFFFF9800),
          title: Text("Remizov Dmitry Sergeyevich"),
        ),
      ),
    ),
  );
}


