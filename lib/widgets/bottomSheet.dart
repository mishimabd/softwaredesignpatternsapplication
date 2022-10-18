import 'package:flutter/material.dart';
import 'package:softwaredesignpatternsapplication/utils/const.dart';
import 'package:softwaredesignpatternsapplication/widgets/button_widget.dart';

class BottomSheetModalVersion extends StatelessWidget {
  const BottomSheetModalVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: const Color(0xFF2e3253).withOpacity(0.2),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            ButtonWidget(
                backgroundColor: AppColors.mainColor,
                text: 'View Task',
                textColor: Colors.white),
            SizedBox(
              height: 20,
            ),
            ButtonWidget(
                backgroundColor: AppColors.mainColor,
                text: 'View Task',
                textColor: Colors.white),
          ],
        ));
  }
}
