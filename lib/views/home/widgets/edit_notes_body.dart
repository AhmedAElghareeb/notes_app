import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes/cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/home/widgets/custom_appbar.dart';
import 'package:notes_app/views/home/widgets/input_field.dart';

class EditNotesViewBody extends StatefulWidget {
  const EditNotesViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNotesViewBody> createState() => _EditNotesViewBodyState();
}

class _EditNotesViewBodyState extends State<EditNotesViewBody> {

  String? title;
  String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 16,
                vertical: 20
              ),
              child: CustomAppBar(
                title: "Edit",
                icon: Icons.done,
                press: ()
                {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.subTitle = subTitle ?? widget.note.subTitle;
                  widget.note.save();
                  BlocProvider.of<NotesCubit>(context).getNotes();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        "Note Edited Successfully...",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
             InputField(
              hint: widget.note.title,
              onChanged: (value)
              {
                title = value;
              },
            ),
            InputField(
              hint: widget.note.subTitle,
              maxLines: 5,
              onChanged: (value)
              {
                subTitle = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
