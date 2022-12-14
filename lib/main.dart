import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';

import 'package:notes_app/views/notes_view.dart';
import 'package:notes_app/views/simple_bloc_observe.dart';

import 'models/note_model.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserve();

  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>(kNoteBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
      ),
      home: const NotesView(),
    );
  }
}
