import 'package:flutter/material.dart';
import 'package:notes_app/views/home/widgets/custom_appbar.dart';
import 'package:notes_app/views/home/widgets/input_field.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 16,
                vertical: 20
              ),
              child: CustomAppBar(
                title: "Edit",
                icon: Icons.done,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InputField(
              hint: "title",
            ),
            InputField(
              hint: "Content",
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
