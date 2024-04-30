import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});

  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: const NoteList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Add'),
                    const Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Title : ',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    TextField(
                      controller: _titleController,
                    ),
                    const Text('Add'),
                    const Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        'Description : ',
                      ),
                    ),
                    TextField(
                      controller: _descriptionController,
                    ),
                  ],
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Map<String, dynamic> notes = {};
                      notes['title'] = _titleController.text;
                      notes['description'] = _descriptionController.text;

                      FirebaseFirestore.instance
                          .collection('notes')
                          .add(notes)
                          .whenComplete(() {
                        _titleController.clear();
                        _descriptionController.clear();
                        Navigator.of(context).pop();
                      });
                    },
                    child: const Text('Save'),
                  )
                ],
              );
            },
          );
        },
        tooltip: 'Add Notes',
        child: Icon(Icons.add),
      ),
    );
  }
}

class NoteList extends StatelessWidget {
  const NoteList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('notes').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          default:
            return ListView(
              padding: const EdgeInsets.only(bottom: 80),
              children: snapshot.data!.docs.map((document) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              TextEditingController titleControler =
                                  TextEditingController(
                                      text: document['title']);
                              TextEditingController descriptionControler =
                                  TextEditingController(
                                      text: document['description']);

                              return AlertDialog(
                                title: const Text('Update Notes'),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Title',
                                      textAlign: TextAlign.start,
                                    ),
                                    TextField(
                                      controller: titleControler,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text('Description: '),
                                    ),
                                    TextField(
                                      controller: descriptionControler,
                                    ),
                                  ],
                                ),
                                actions: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Map<String, dynamic> updateNote = {};
                                        updateNote['title'] =
                                            titleControler.text;
                                        updateNote['description'] =
                                            descriptionControler.text;

                                        FirebaseFirestore.instance
                                            .collection('notes')
                                            .doc(document.id)
                                            .update(updateNote)
                                            .whenComplete(() =>
                                                Navigator.of(context).pop());
                                      },
                                      child: const Text('update'),
                                    ),
                                  )
                                ],
                              );
                            });
                      },
                      title: Text(document['title']),
                      subtitle: Text(document['description']),
                      trailing: InkWell(
                        onTap: () {
                          FirebaseFirestore.instance
                              .collection('notes')
                              .doc(document.id)
                              .delete();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Icon(Icons.delete),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
        }
      },
    );
  }
}
