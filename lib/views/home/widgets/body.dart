import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes/cubit.dart';
import 'package:notes_app/views/home/widgets/custom_appbar.dart';
import 'package:notes_app/views/home/widgets/notes_listview.dart';

class NotesBody extends StatefulWidget {
  const NotesBody({super.key});

  @override
  State<NotesBody> createState() => _NotesBodyState();
}

class _NotesBodyState extends State<NotesBody> {

  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).getNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
      child: Column(
        children: [
          CustomAppBar(
            title: "Your Notes",
            icon: Icons.search_outlined,
            press: () {},
          ),
          const SizedBox(
            height: 16,
          ),
          const Expanded(
            child: NotesListView(),
          ),
        ],
      ),
    );
  }
}


