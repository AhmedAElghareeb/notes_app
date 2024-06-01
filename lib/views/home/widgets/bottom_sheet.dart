import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/addnote/cubit.dart';
import 'package:notes_app/cubits/addnote/states.dart';
import 'package:notes_app/cubits/notes/cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/home/widgets/button.dart';
import 'package:notes_app/views/home/widgets/color_item_list.dart';
import 'package:notes_app/views/home/widgets/input_field.dart';

class BottomSheetModal extends StatelessWidget {
  const BottomSheetModal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNotesStates>(
        builder: (context, state) => AbsorbPointer(
          absorbing: state is AddNotesLoadingState,
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: const SingleChildScrollView(
              child: NoteForm(),
            ),
          ),
        ),
        listener: (context, state) {
          if (state is AddNotesFailedState) {
            debugPrint("Failed ${state.msg}");
          }

          if (state is AddNotesSuccessState) {
            BlocProvider.of<NotesCubit>(context).getNotes();
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }
}

class NoteForm extends StatefulWidget {
  const NoteForm({
    super.key,
  });

  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          InputField(
            hint: "title",
            onSaved: (value) {
              title = value;
            },
          ),
          InputField(
            hint: "Content",
            maxLines: 5,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const ColorsList(),
          const SizedBox(
            height: 16,
          ),
          buildSheetButtonBuilder(),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  BlocBuilder<AddNoteCubit, AddNotesStates> buildSheetButtonBuilder() {
    return BlocBuilder<AddNoteCubit, AddNotesStates>(
          builder: (context, state) => Button(
            title: "Add",
            isLoading: state is AddNotesLoadingState,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                var noteModel = NoteModel(
                  title: title!,
                  subTitle: subTitle!,
                  date: DateFormat.yMMMEd().format(DateTime.now()),
                  color: Colors.blue.value,
                );
                BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(
                      "Note Added Successfully...",
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
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
        );
  }
}
