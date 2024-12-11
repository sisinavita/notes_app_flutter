import 'package:flutter/material.dart';
import 'package:notes_app_flutter/src/models/note.dart';

class Search extends StatefulWidget {
  final List<Note> notes;
  const Search({Key? key, required this.notes}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late List<Note> _foundNotes;

  @override
  void initState() {
    _foundNotes = widget.notes; // Initialize with all notes
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Note> results = [];
    if (enteredKeyword.isEmpty) {
      // If the search field is empty, display all notes
      results = widget.notes;
    } else {
      results = widget.notes
          .where((note) =>
              note.title.toLowerCase().contains(enteredKeyword.toLowerCase()) ||
              note.body.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundNotes = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Notes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundNotes.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundNotes.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(index),
                        color: Colors.blue,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          title: Text(
                            _foundNotes[index].title,
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            _foundNotes[index].body,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
