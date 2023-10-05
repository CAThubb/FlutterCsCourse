import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Wrap(
          children: [
            Container(margin: EdgeInsets.only(top: 50),
            child: Icon(Icons.ac_unit_sharp, color: Colors.redAccent, size: 40),
            ),
            Container(margin: EdgeInsets.all(25.0),
              child: Icon(Icons.visibility, color: Colors.blueAccent, size: 40),
            ),
            Container(margin: EdgeInsets.all(25.0),
              child: Icon(Icons.verified, color: Colors.greenAccent, size: 55),
            ),
            Container(margin: EdgeInsets.all(50.0),
              child: Icon(Icons.dashboard, color: Colors.orangeAccent, size: 40),
            ),
            Container(margin: EdgeInsets.all(40.0),
              child: Icon(Icons.lightbulb, color: Colors.yellowAccent, size: 80),
            ),
            Container(margin: EdgeInsets.only(left: 25.0),
              child: Icon(Icons.paid, color: Colors.lightGreenAccent, size: 40),
            ),
          ],
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