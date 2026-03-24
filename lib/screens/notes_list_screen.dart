import 'package:flutter/material.dart';

import '../models/app_note.dart';
import '../widgets/note_card.dart';

class NotesListScreen extends StatelessWidget {
  const NotesListScreen({
    super.key,
    required this.notes,
  });

  final List<AppNote> notes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return NoteCard(note: notes[index]);
      },
    );
  }
}
