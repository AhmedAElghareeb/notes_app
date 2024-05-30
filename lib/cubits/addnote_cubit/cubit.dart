import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';
part 'states.dart';


class AddNoteCubit extends Cubit<AddNotesStates>
{
  AddNoteCubit() : super(AddNotesStates());

  addNote(NoteModel model)
  {

  }

}