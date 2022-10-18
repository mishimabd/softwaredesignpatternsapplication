import 'package:flutter/material.dart';
import 'package:softwaredesignpatternsapplication/utils/const.dart';

class TaskWidget extends StatelessWidget {
  final String text;
  final Color color;
  const TaskWidget({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height / 14,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 212, 212, 212),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(text, style: TextStyle(
            fontSize: 20,
            fontFamily: 'Poppins',
            color: color
          ),),
        ));
  }
}
