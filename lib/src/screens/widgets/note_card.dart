import 'package:flutter/material.dart';
import 'package:notes_app_flutter/src/models/note.dart';
import 'package:notes_app_flutter/src/screens/note_view.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note, required this.index});
  final Note note;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NoteView(note: note, index: index)));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [Text(note.title)],
          ),
        ),
      ),
    );
  }
}
