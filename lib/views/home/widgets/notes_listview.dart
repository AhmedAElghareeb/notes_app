import 'package:flutter/material.dart';
import 'package:notes_app/views/home/widgets/listview_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => const ListviewItem(),
      itemCount: 10,
    );
  }
}