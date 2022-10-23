import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:softwaredesignpatternsapplication/widgets/button_widget.dart';
import 'package:softwaredesignpatternsapplication/widgets/error_massage_warning.dart';
import 'package:softwaredesignpatternsapplication/widgets/text_field_widget.dart';
import 'package:get/get.dart';

import '../patterns/template/error_message_for_details.dart';
import '../patterns/template/error_message_for_text.dart';
import '../utils/const.dart';

String title = '';
String description = '';
List todoList = [];
Message messageText = ErrorMforText();
Message messageDetail = ErrorMforDetail();

class AddTask extends StatefulWidget {
  const AddTask({super.key});
  @override
  State<AddTask> createState() => _AddTaskState();
}

createToDo() {
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection('MyTodos').doc(title);

  Map<String, String> todoList = {'todotitle': title, 'tododesc': description};

  documentReference
      .set(todoList)
      // ignore: avoid_print
      .whenComplete(() => print("Data Stored Successfully"));
}

class _AddTaskState extends State<AddTask> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
        controller.reset();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    TextEditingController detailController = TextEditingController();
    // ignore: no_leading_underscores_for_local_identifiers
    bool _dataValidation() {
      if (textController.text.trim() == '') {
        messageText.taskErrorOnWarning('Task Name', 'Task Name is empty.');
        return false;
      } else if (detailController.text.trim() == '') {
        messageDetail.taskErrorOnWarning('Task Detail', 'Task Detail is empty');
        return false;
      } else if (textController.text.length < 5) {
        messageText.taskErrorOnWarning(
            'Task Name', 'Your task name should be more than 5 symbols.');
        return false;
      } else if (detailController.text.length <= 10) {
        messageDetail.taskErrorOnWarning(
            'Task Detail', 'Your task detail should be more than 10 symbols.');
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
                    color: Colors.white)
              ],
            ),
            Column(
              children: [
                TextFieldWidget(
                    maxLines: 1,
                    textEditingController: textController,
                    hintText: "Add title of your task",
                    borderRadius: 30),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                    maxLines: 3,
                    textEditingController: detailController,
                    hintText: "Add details to your task",
                    borderRadius: 15),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    if (_dataValidation()) {
                      setState(() {
                        title = textController.text;
                        description = detailController.text;
                      });
                      createToDo();
                      Get.back();
                      dialog();
                    }
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

  void dialog() => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Dialog(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset('assets/done.json',
                  repeat: false,
                  controller: controller,
                  onLoaded: (composition) {
                controller.duration = composition.duration;
                controller.forward();
              }),
              const Text('Your task added successfully',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 20)),
              const SizedBox(
                height: 16.0,
              )
            ],
          )));
}
