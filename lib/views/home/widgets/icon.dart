import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key, required this.icon, required this.press,
  });

  final IconData icon;
  final VoidCallback press;



  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withOpacity(0.05)),
      child: IconButton(
        onPressed: press,
        icon: Icon(
          icon,
          size: 28,
        ),
      ),
    );
  }
}
