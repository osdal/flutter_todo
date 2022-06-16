// @dart=2.9
// import 'dart:js';

import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/main_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() =>runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.deepOrangeAccent,
  ),
  initialRoute: '/',
  routes: {
    '/' : (context) => MainScreen(),
    '/todo' : (context) => Home(),
  },
));