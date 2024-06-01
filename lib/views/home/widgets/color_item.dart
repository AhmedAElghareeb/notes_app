import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isSelected, required this.color});

  final bool isSelected;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isSelected ? CircleAvatar(
      backgroundColor: Colors.red,
      radius: 30,
      child: CircleAvatar(
        radius: 26,
        backgroundColor: color,
      ),
    ) : CircleAvatar(
      radius: 30,
      backgroundColor: color,
    );
  }
}
