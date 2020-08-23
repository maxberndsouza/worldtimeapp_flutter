import 'package:flutter/material.dart';
import 'package:worldtimeapp/pages/home.dart';
import 'package:worldtimeapp/pages/chose_location.dart';
import 'package:worldtimeapp/pages/loading.dart';
void main() {
  runApp(MaterialApp(
    initialRoute:'/',
    routes: {
      '/':(context)=>Loading(),
      '/home':(context)=>Home(),
      '/location':(context)=>ChoseLocation(),
    },
  ));
}

