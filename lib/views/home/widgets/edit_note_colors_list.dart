import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/home/widgets/color_item.dart';

class EditNotesColors extends StatefulWidget {
  const EditNotesColors({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  State<EditNotesColors> createState() => _EditNotesColorsState();
}

class _EditNotesColorsState extends State<EditNotesColors> {

  late int currentIndex;

  @override
  void initState() {
    currentIndex = colors.indexOf(Color(widget.noteModel.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 16,
          ),
          child: GestureDetector(
            onTap: ()
            {
              currentIndex = index;
              widget.noteModel.color = colors[index].value;
              setState(() {});
            },
            child: ColorItem(
              color: colors[index],
              isSelected: currentIndex == index,
            ),
          ),
        ),
      ),
    );
  }
}
