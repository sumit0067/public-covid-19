import 'package:covid_19/home/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      title: 'Covide-19',
      theme: ThemeData(primaryColor: Color(0xff202c3b)),
    ),
  );
}

