import 'package:colorful_notes_app/firebase_options.dart';
import 'package:colorful_notes_app/screens/home_screen.dart';
import 'package:colorful_notes_app/theme/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
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