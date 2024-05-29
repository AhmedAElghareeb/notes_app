import 'package:flutter/material.dart';
import 'package:notes_app/views/home/widgets/custom_appbar.dart';
import 'package:notes_app/views/home/widgets/notes_listview.dart';

class NotesBody extends StatelessWidget {
  const NotesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
      child: Column(
        children: [
          CustomAppBar(),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: NotesListView(),
          ),
        ],
      ),
    );
  }
}


