import 'package:flutter/material.dart';
import 'package:softwaredesignpatternsapplication/model/model_advise.dart';
import 'package:softwaredesignpatternsapplication/screens/weather.dart';
import 'package:softwaredesignpatternsapplication/services/services_api_advise.dart';
import 'package:softwaredesignpatternsapplication/widgets/button_widget.dart';
import 'package:get/get.dart';

import '../../utils/const.dart';
import 'add_task.dart';
import 'all_tasks.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  AdviseApiClient client = AdviseApiClient();
  Advise? data;
  @override
  void initState() {
    client.getAdvise();
    super.initState();
  }

  Future<void> getData() async {
    data = await client.getAdvise();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                width: double.maxFinite,
                height: double.maxFinite,
                // ignore: sort_child_properties_last
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Text above which is just saying "Hello"
                    RichText(
                        text: const TextSpan(
                            text: "ToDo List",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 55,
                                fontWeight: FontWeight.bold),
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                          TextSpan(
                              text: '\nDon\'t forget to finish your tasks!',
                              style: TextStyle(
                                fontSize: 15,
                              ))
                        ])),
                    SizedBox(height: MediaQuery.of(context).size.height / 2),

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
                            transition: Transition.cupertinoDialog,
                            duration: const Duration(milliseconds: 800));
                      },
                      child: const ButtonWidget(
                          text: 'View Tasks',
                          backgroundColor: Colors.white,
                          textColor: AppColors.mainColor),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/wallpaper.jpg'))),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
            }
            return Container();
          }),
    );
  }
}
