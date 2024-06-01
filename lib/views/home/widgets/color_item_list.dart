import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/addnote/cubit.dart';
import 'package:notes_app/views/home/widgets/color_item.dart';

class ColorsList extends StatefulWidget {
  const ColorsList({super.key});

  @override
  State<ColorsList> createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {

  int currentIndex = 0;

  List<Color> colors = [
    Colors.white,
    Colors.grey,
    Colors.blue,
    Colors.amber,
    Colors.deepPurpleAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 16,
          ),
          child: GestureDetector(
            onTap: ()
            {
              currentIndex = index;
              BlocProvider.of<AddNoteCubit>(context).color = colors[index];
              setState(() {});
            },
            child: ColorItem(
              isSelected: currentIndex == index ? true : false,
              color: colors[index],
            ),
          ),
        ),
        itemCount: colors.length,
      ),
    );
  }
}
