import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Book Your Appointment'),
        backgroundColor: Color(0xFF2F7299),
      ),
      backgroundColor: Color(0xFF78CAD2),
      body: Center(
        child: Image(
          image: AssetImage("images/injection.png"),
        )
      ),
    )
  ));
}
