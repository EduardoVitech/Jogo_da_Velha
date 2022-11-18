import 'package:flutter/material.dart';
import 'package:jogo_da_velha/utils/colors/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blue,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          fillColor: bgColor,
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}
