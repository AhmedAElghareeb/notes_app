import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes/cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/home/widgets/edit_notes_body.dart';

class ListviewItem extends StatelessWidget {
  const ListviewItem({super.key, required this.model});

  final NoteModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditNotesViewBody(
              note: model,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(model.color),
        ),
        padding: const EdgeInsetsDirectional.only(
          start: 24,
          top: 24,
          bottom: 24,
        ),
        margin: const EdgeInsetsDirectional.only(
          bottom: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: EdgeInsetsDirectional.zero,
              title: Text(
                model.title,
                // "Flutter Tips",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 16),
                child: Text(
                  model.subTitle,
                  // "Build Your career with me",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 18,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => SimpleDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: Colors.white,
                      title: const Text(
                          "Are You Sure you want to delete this Note?"),
                      titleTextStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SimpleDialogOption(
                              child: const Text(
                                "No",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            SimpleDialogOption(
                              child: const Text(
                                "Yes",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red,
                                ),
                              ),
                              onPressed: () {
                                model.delete();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text(
                                      "Note Deleted Successfully...",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    backgroundColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                                Navigator.pop(context);
                                BlocProvider.of<NotesCubit>(context).getNotes();
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                end: 10,
                top: 16,
              ),
              child: Text(
                model.date,
                // "May29, 2024",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
