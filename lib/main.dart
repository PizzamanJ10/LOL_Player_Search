import 'package:flutter/material.dart';
import 'package:r_player_info/pages/home.dart';
import 'package:r_player_info/pages/loading.dart';
import 'package:r_player_info/pages/final_page.dart';


void main() {
  runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => Home(),
        '/loading': (context) => Loading(),
        '/results': (context) => final_page(),


      }
  ));
}