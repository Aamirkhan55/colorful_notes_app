import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colorful_notes_app/model/note_model.dart';


class DatabaseHandler {
  static Future<void> createNote (NoteModel note) async{
    final noteCollection = FirebaseFirestore.instance.collection('notes');
    final id = noteCollection.doc().id;
    final newNote = NoteModel(
      id: id,
      title: note.title,
      body: note.body,
      color: note.color,
    ).toDocument();

    try {
      noteCollection.doc(id).set(newNote);
    } catch (e) {
     "Some Error Occure $e";
    }
  }
}