import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class Button extends StatelessWidget {
  const Button({super.key, this.title, this.onPressed, this.isLoading = false});

  final String? title;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 16
      ),
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: const Size(
              double.infinity,
              50,
            )),
        child: isLoading ? const CircularProgressIndicator() : Text(
          title!,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
