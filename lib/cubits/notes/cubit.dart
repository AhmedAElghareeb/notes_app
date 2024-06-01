import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
part 'states.dart';
class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesStates());


  List<NoteModel>? notesList;
  getNotes()
  async {
    var notes = Hive.box<NoteModel>(notesBox);
    notesList = notes.values.toList();
    emit(SuccessNotesState());
  }
}