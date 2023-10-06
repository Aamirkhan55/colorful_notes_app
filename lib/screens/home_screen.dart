import 'package:colorful_notes_app/screens/create_note_screen.dart';
import 'package:colorful_notes_app/screens/edit_note_screen.dart';
import 'package:colorful_notes_app/theme/colors.dart';
import 'package:colorful_notes_app/widgets/button_widget.dart';
import 'package:colorful_notes_app/widgets/dailog_box_widget.dart';
import 'package:colorful_notes_app/widgets/single_note_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: EdgeInsets.only(right: 10.0),
            child: Row(
              children: [
                ButtonWidget(icon: Icons.search),
                SizedBox(width: 10),
                ButtonWidget(icon: Icons.info)
              ],
            ),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return SingleNoteWidget(
              title: 'Title',
              body: 'Body',
              color: 4294967295,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const EditNoteScreen()));
              },
              onLongPress: () {
                showDailogBoxWidget(
                  context,
                  height: 240,
                  title: "Are you sure want\nto delete this note..?",
                  onTapYes: () {
                    Navigator.pop(context);
                  }
                  );
              },
            );
          }),
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CreateNoteScreen()));
          },
          child: const Icon(
            Icons.add,
            size: 38,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
