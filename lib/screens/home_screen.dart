import 'package:flutter/material.dart';
import 'package:softwaredesignpatternsapplication/screens/add_task.dart';
import 'package:softwaredesignpatternsapplication/screens/all_tasks.dart';
import 'package:softwaredesignpatternsapplication/widgets/button_widget.dart';
import 'package:get/get.dart';

import '../utils/const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        width: double.maxFinite,
        height: double.maxFinite,
        // ignore: sort_child_properties_last
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: const TextSpan(
                    text: 'Hello!',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainColor),
                    children: [
                  TextSpan(
                      text: '\nProject for finishing all 5 patterns!',
                      style: TextStyle(
                          fontSize: 12, color: AppColors.smallTextColor))
                ])),
            SizedBox(height: MediaQuery.of(context).size.height / 2.5),
            InkWell(
              onTap: () {
                Get.to(() => const AddTask(),
                    transition: Transition.cupertinoDialog,
                    duration: const Duration(milliseconds: 800));
              },
              child: const ButtonWidget(
                  text: 'Add Task',
                  backgroundColor: AppColors.mainColor,
                  textColor: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.to(() => const AllTasks(),
                    transition: Transition.size,
                    duration: const Duration(milliseconds: 800));
              },
              child: const ButtonWidget(
                  text: 'View Tasks',
                  backgroundColor: Colors.white,
                  textColor: AppColors.mainColor),
            )
          ],
        ),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/wallpaper.jpg'))),
      ),
    );
  }
}
