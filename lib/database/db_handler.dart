import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colorful_notes_app/model/note_model.dart';

class DatabaseHandler {
  // Create Note
  static Future<void> createNote(NoteModel note) async {
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

  // Read Note
  static Stream<List<NoteModel>> getNotes() {
    final noteCollection = FirebaseFirestore.instance.collection('notes');
    return noteCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => NoteModel.fromSnapshot(e)).toList());
  }

// Update/Edit
static Future<void> updateNote(NoteModel note) async{
  final noteCollection = FirebaseFirestore.instance.collection('notes');
  final newNote = NoteModel(
    id: note.id,
    title: note.title,
    color: note.color,
    body: note.body,
  ).toDocument();

  try {
    noteCollection.doc(note.id).update(newNote);
  } catch (e) {
    "Some Error Occure $e";
  }
}
}
