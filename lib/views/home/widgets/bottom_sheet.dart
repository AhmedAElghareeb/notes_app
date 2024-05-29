import 'package:flutter/material.dart';
import 'package:notes_app/views/home/widgets/button.dart';
import 'package:notes_app/views/home/widgets/input_field.dart';

class BottomSheetModal extends StatelessWidget {
  const BottomSheetModal({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const InputField(
            hint: "title",
          ),
          const InputField(
            hint: "Content",
            maxLines: 5,
          ),
          const SizedBox(
            height: 16,
          ),
          Button(
            title: "Add",
            onPressed: (){},
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
