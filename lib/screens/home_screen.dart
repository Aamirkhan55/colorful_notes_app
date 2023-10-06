import 'package:colorful_notes_app/theme/colors.dart';
import 'package:colorful_notes_app/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0, 
        backgroundColor: darkBackgroundColor,
        title: const Text(
          'Notes',
          style: TextStyle(
            fontSize: 40,
          ),
          ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right:10.0),
            child: Row(
              children: [
                ButtonWidget(icon: Icons.search),
                SizedBox(width: 10),
                ButtonWidget(icon: Icons.info)
              ],
            ),
          )
        ],  
      ),
    );
  }
}