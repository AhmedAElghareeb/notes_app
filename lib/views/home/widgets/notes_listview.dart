import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes/cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/home/widgets/listview_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notesList!;

        return ListView.builder(
          itemBuilder: (context, index) => ListviewItem(
            model: notes[index],
          ),
          itemCount: notes.length,
        );
      },
    );
  }
}
