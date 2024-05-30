import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class InputField extends StatelessWidget {
  const InputField({super.key, this.hint, this.maxLines = 1, this.onSaved});

  final String? hint;
  final int? maxLines;

  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 22,
        start: 16,
        end: 16,
      ),
      child: TextFormField(
        onTapOutside: (evt) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        validator: (value)
        {
          if(value?.isEmpty ?? true)
          {
            return "Field is Required";
          }
          return null;
        },
        onSaved: onSaved,
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
