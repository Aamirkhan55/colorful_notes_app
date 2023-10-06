import 'package:colorful_notes_app/screens/home_screen.dart';
import 'package:colorful_notes_app/theme/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ColorFul Notes', 
      theme: ThemeData(
        primarySwatch: primaryColor,
        brightness: Brightness.dark,
      ),
      home: const HomeScreen(),
    );
  }
}