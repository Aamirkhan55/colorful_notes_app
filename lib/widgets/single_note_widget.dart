import 'package:flutter/material.dart';

class SingleNoteWidget extends StatelessWidget {
  final String? title;
  final String? body;
  final int? color;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const SingleNoteWidget({super.key, this.title, this.body, this.color, this.onTap, this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          decoration: BoxDecoration(
            color: Color(color!),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                ),
              const SizedBox(height: 5),
              Text(
                body!,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                )
            ],
          ),
        ),
    );
  }
}