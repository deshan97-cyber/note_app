import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_app/Services/firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //firestore
  final FirestoreService firestoreService = FirestoreService();

// text controller
  final TextEditingController textController = TextEditingController();

  //dialog box
  void openNoteBox({String? docID}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: textController,
              ),
              actions: [
                //save
                ElevatedButton(
                  onPressed: () {
                    // add new note
                    if (docID == null) {
                      firestoreService.addNote(textController.text);
                    } else {
                      firestoreService.updateNote(docID, textController.text);
                    }

                    //clear text controler
                    textController.clear();

                    //close box
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey,
                  ),
                  child: Text("Add"),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Notes",
          ),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: Icon(Icons.add),
        backgroundColor: Colors.blueGrey,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNotesStream(),
        builder: (context, snapshot) {
          //if we have data, get all the docs
          if (snapshot.hasData) {
            List notesList = snapshot.data!.docs;

            //display as a list
            return ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                //get each individual doc

                DocumentSnapshot document = notesList[index];
                String docID = document.id;

                //get note from each doc

                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String noteText = data['note'];

                //return display as a list tile

                return ListTile(
                    title: Text(noteText),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //update
                        IconButton(
                          onPressed: () => openNoteBox(docID: docID),
                          icon: Icon(Icons.settings),
                        ),

                        //delete
                        IconButton(
                          onPressed: () => firestoreService.deleteNote(docID),
                          icon: Icon(Icons.delete),
                        )
                      ],
                    ));
              },
            );
          }

          //if there is no data to return

          else {
            return const Text('No notes...');
          }
        },
      ),
    );
  }
}
