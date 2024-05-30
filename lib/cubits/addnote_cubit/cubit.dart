import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'states.dart';

class AddNoteCubit extends Cubit<AddNotesStates> {
  AddNoteCubit() : super(AddNotesStates());

  addNote(NoteModel model) async {
    emit(AddNotesLoadingState());
    try {
      var addNotes = Hive.box<NoteModel>(notesBox);
      await addNotes.add(model);

      emit(AddNotesSuccessState());
    } catch (e) {
      emit(AddNotesFailedState(e.toString()));
    }
  }
}
