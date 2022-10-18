import 'package:flutter/material.dart';
class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.backgroundColor, required this.text, required this.textColor});
  final Color backgroundColor;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height/14,
      decoration: BoxDecoration(
        color: backgroundColor, 
        borderRadius: BorderRadius.circular(40)
      ),
      child: Center(child: Text(text, style: TextStyle(fontSize: 24, color: textColor, fontFamily: 'Poppins'))),
    );
  }
}