import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

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
        onTapOutside: (evt) {
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

  OutlineInputBorder buildOutlineInputBorder([color]) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ));
}
