import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
//get collection notes

  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

//add new notes

  Future<void> addNote(String note) {
    return notes.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }

//read-get notes from database
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream =
        notes.orderBy('timestamp', descending: true).snapshots();
    return notesStream;
  }

//update - given a doc id

  Future<void> updateNote(String docID, String newNote) {
    return notes.doc(docID).update({
      'note': newNote,
      'timeStamp': Timestamp.now(),
    });
  }

//delete  -given a doc id

  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}
