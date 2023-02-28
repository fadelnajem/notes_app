import 'package:flutter/material.dart';

import '../models/note_model.dart';
import 'edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: EditNoteViewBody(
        notes: note,
      ),
    );
  }
}
