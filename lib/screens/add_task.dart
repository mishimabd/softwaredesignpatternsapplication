import 'package:flutter/material.dart';
import 'package:softwaredesignpatternsapplication/widgets/button_widget.dart';
import 'package:softwaredesignpatternsapplication/widgets/error_massage_warning.dart';
import 'package:softwaredesignpatternsapplication/widgets/text_field_widget.dart';
import 'package:get/get.dart';

import '../utils/const.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    TextEditingController detailController = TextEditingController();

    // ignore: no_leading_underscores_for_local_identifiers
    bool _dataValidation() {
      if (textController.text.trim() == '') {
        Message.taskErrorOnWarning('Task Name', 'Task Name is empty');
        return false;
      } else if (detailController.text.trim() == '') {
        Message.taskErrorOnWarning('Task Detail', 'Task Detail is empty');
        return false;
      } else if (textController.text.length < 10) {
        Message.taskErrorOnWarning(
            'Task Detail', 'Your task name should be more than 10 symbols.');
        return false;
      }
      return true;
    }
    

    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/wallpaper.jpg'))),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: AppColors.mainColor)
              ],
            ),
            Column(
              children: [
                TextFieldWidget(
                    maxLines: 1,
                    textEditingController: textController,
                    hintText: "Add your task",
                    borderRadius: 30),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                    maxLines: 3,
                    textEditingController: detailController,
                    hintText: "Add your task",
                    borderRadius: 15),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    if (_dataValidation()) {}
                  },
                  child: const ButtonWidget(
                      backgroundColor: AppColors.mainColor,
                      text: 'Add Task',
                      textColor: Colors.white),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            )
          ]),
    ));
  }
}
