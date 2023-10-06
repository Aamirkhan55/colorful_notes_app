import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0, 
        backgroundColor: Colors.black,
        title: const Text(
          'Notes',
          style: TextStyle(
            fontSize: 40,
          ),
          ),
      ),
    );
  }
}