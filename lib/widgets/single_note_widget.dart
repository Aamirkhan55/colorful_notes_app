import 'package:flutter/material.dart';

class SingleNote extends StatelessWidget {
  const SingleNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              ),
            SizedBox(height: 5),
            Text(
              'Body Of Title',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              )
          ],
        ),
      );
  }
}