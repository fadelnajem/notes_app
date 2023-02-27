import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/models/note_model.dart';

import '../../constants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  fetchAllNotes() {
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);

      emit(NotesSuccess(noteBox.values.toList()));
    } catch (e) {
      emit(NotesFailure(e.toString()));
    }
  }
}
