import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:softwaredesignpatternsapplication/services/services_api_weather.dart';
import 'package:softwaredesignpatternsapplication/utils/const.dart';
import 'package:softwaredesignpatternsapplication/widgets/bottomSheet.dart';
import 'package:softwaredesignpatternsapplication/widgets/delete_task.dart';
import 'package:softwaredesignpatternsapplication/widgets/task_widget.dart';
import 'package:get/get.dart';

import '../../screens/to-do-screen/add_task.dart';

class SingletonAllTasks extends StatefulWidget {
  const SingletonAllTasks({
    super.key,
  });

  @override
  State<SingletonAllTasks> createState() => _SingletonAllTasksState();
}

//singelton instance that i have from class above
class _SingletonAllTasksState extends State<SingletonAllTasks>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
//creating initStatwe for animation controller
  WeatherApiClient client = WeatherApiClient();
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Get.back();
        controller.reset();
      }
    });
  }

//main Widget builder
  @override
  Widget build(BuildContext context) {
    final leftIcon = Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(bottom: 10),
        color: Colors.blue[900],
        child: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Icon(color: Colors.white, Icons.edit),
        ));
    final rightIcon = Container(
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.only(bottom: 10),
        color: Colors.red[900],
        child: const Padding(
          padding: EdgeInsets.all(3.0),
          child: Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(color: Colors.white, Icons.delete),
          ),
        ));
    return Scaffold(
        body: Column(children: [
      Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(left: 20, top: 60),
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height / 3.2,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/wallpaper.jpg'))),
        child: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back, color: Colors.white)),
      ),
      const SizedBox(height: 10),
      Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child:
                      const Icon(Icons.home, color: AppColors.secondaryColor)),
              const SizedBox(width: 20),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    color: Colors.black),
                child: InkWell(
                  onTap: () {
                    Get.to(() => const AddTask(),
                        transition: Transition.cupertinoDialog,
                        duration: const Duration(milliseconds: 800));
                  },
                  child: const Icon(Icons.plus_one_rounded,
                      color: Colors.white, size: 20),
                ),
              ),
              Expanded(child: Container()),
              const Icon(Icons.calendar_month, color: AppColors.secondaryColor),
              const SizedBox(width: 20),
              const Text('12',
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColors.secondaryColor,
                      fontFamily: 'Poppins')),
            ],
          )),
      Flexible(
        child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('MyTodos').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              int loli = snapshot.data!.docs.length;
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: loli,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        snapshot.data!.docs[index];
                    return Dismissible(
                      // ignore: sort_child_properties_last
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 10),
                        child: TaskWidget(
                            text: documentSnapshot['todotitle'],
                            color: Colors.blueGrey),
                      ),
                      background: leftIcon,
                      secondaryBackground: rightIcon,
                      onDismissed: (DismissDirection direction) {
                        dialogDelete();
                        delete(documentSnapshot.id);
                      },
                      confirmDismiss: (DismissDirection direction) async {
                        if (direction == DismissDirection.startToEnd) {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              barrierColor: Colors.transparent,
                              context: context,
                              builder: (_) {
                                return const BottomSheetModalVersion();
                              });
                        } else {
                          return Future.delayed(const Duration(seconds: 1),
                              () => direction == DismissDirection.endToStart);
                        }
                        return null;
                      },
                      key: UniqueKey(),
                    );
                  },
                );
              }
              // ignore: curly_braces_in_flow_control_structures
              return const Center(child: CircularProgressIndicator());
            }),
      )
    ]));
  }

  void dialogDelete() => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Dialog(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 16.0,
              ),
              Lottie.asset('assets/delete.json',
                  repeat: false,
                  controller: controller, onLoaded: (composition) {
                controller.duration = composition.duration;
                controller.forward();
              }),
              const Text('Your task deleted successfully',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 20)),
              const SizedBox(
                height: 16.0,
              )
            ],
          )));
}
