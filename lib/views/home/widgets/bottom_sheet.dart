import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/addnote_cubit/cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/home/widgets/button.dart';
import 'package:notes_app/views/home/widgets/input_field.dart';

class BottomSheetModal extends StatelessWidget {
  const BottomSheetModal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNotesStates>(
        builder: (context, state) => const SingleChildScrollView(
          child: NoteForm(),
        ),
        listener: (context, state) {
          if (state is AddNotesFailedState) {
            print("Failed ${state.msg}");
          }

          if (state is AddNotesSuccessState) {
            Navigator.of(context).pop();
          }

          if(state is AddNotesLoadingState)
          {
            const Center(child: CircularProgressIndicator());
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
          Button(
            title: "Add",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                var noteModel = NoteModel(
                  title: title!,
                  subTitle: subTitle!,
                  date: DateTime.now().toString(),
                  color: Colors.blue.value,
                );
                BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
