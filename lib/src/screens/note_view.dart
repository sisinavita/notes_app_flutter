import 'package:flutter/material.dart';
import 'package:notes_app_flutter/src/models/note.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key, required this.note, required this.index});

  final Note note;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note View"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: const TextStyle(fontSize: 26),
            )
          ],
        ),
      ),
    );
  }
}
