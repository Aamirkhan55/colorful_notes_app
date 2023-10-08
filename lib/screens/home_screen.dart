import 'package:colorful_notes_app/database/db_handler.dart';
import 'package:colorful_notes_app/model/note_model.dart';
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
      body: StreamBuilder<List<NoteModel>>(
        stream: DatabaseHandler.getNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Image.asset(
                "assets/ios_loading.gif",
                 width: 50,
                 height: 50,
                ),
            );
          } 
          if(snapshot.hasData == false) {
            return _noNotesWidgets();
          }
          if(snapshot.data!.isEmpty){
            return _noNotesWidgets();
          }
          if(snapshot.hasData) {
            final notes = snapshot.data;
            return ListView.builder(
              itemCount: notes!.length,
              itemBuilder: (context, index) {
                return SingleNoteWidget(
                  title: 'Title',
                  body: 'Body',
                  color: 4294967295,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditNoteScreen()));
                  },
                  onLongPress: () {
                    showDailogBoxWidget(context,
                        height: 240,
                        title: "Are you sure want\nto delete this note..?",
                        onTapYes: () {
                      Navigator.pop(context);
                    });
                  },
                );
              }
              );
          }
          return Center(
              child: Image.asset(
                "assets/ios_loading.gif",
                 width: 50,
                 height: 50,
                ),
            );
          
        }
      ),
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
  
   _noNotesWidgets() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Image.asset("assets/add_notes_image.png"),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Create Colorful Notes',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
            ),
        ],
      ),
    );
  }
}
