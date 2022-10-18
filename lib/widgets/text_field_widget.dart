import 'package:flutter/material.dart';

import '../utils/const.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final double borderRadius;
  final int maxLines;

  TextFieldWidget(
      {Key? key,
      required this.textEditingController,
      required this.maxLines,
      required this.hintText,
      required this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      controller: textEditingController,
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.textHolder,
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: Colors.transparent, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: Colors.transparent, width: 1))),
    );
  }
}
