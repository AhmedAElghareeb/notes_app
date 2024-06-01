import 'package:flutter/material.dart';
import 'package:notes_app/views/home/widgets/custom_appbar.dart';
import 'package:notes_app/views/home/widgets/input_field.dart';

class EditNotesViewBody extends StatelessWidget {
  const EditNotesViewBody({super.key});

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
                press: () {},
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const InputField(
              hint: "title",
            ),
            const InputField(
              hint: "Content",
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
