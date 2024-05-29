import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

import 'widgets/body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(child: NotesBody()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            useSafeArea: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            builder: (context) => const BottomSheetModal(),
          );
        },
        backgroundColor: Colors.grey,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class BottomSheetModal extends StatelessWidget {
  const BottomSheetModal({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        InputField(
          hint: "title",
        ),
        InputField(
          hint: "Content",
          maxLines: 5,
        ),
        Button(

        ),
      ],
    );
  }
}


class InputField extends StatelessWidget {
  const InputField({super.key, this.hint, this.maxLines = 1});

  final String? hint;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 22,
        start: 16,
        end: 16,
      ),
      child: TextField(
        onTapOutside: (evt){
          FocusManager.instance.primaryFocus?.unfocus();
        },
        maxLines: maxLines,
        cursorColor: primaryColor,
        decoration: InputDecoration(
          border: buildOutlineInputBorder(),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(
            primaryColor,
          ),
          hintText: hint,
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder([color]) {
    return OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: color ?? Colors.white,
            )
        );
  }
}


