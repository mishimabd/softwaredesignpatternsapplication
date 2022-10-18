import 'package:flutter/material.dart';
import 'package:softwaredesignpatternsapplication/utils/const.dart';
import 'package:softwaredesignpatternsapplication/widgets/bottomSheet.dart';
import 'package:softwaredesignpatternsapplication/widgets/task_widget.dart';
import 'package:get/get.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  @override
  Widget build(BuildContext context) {
    List myTasks = [
      "Finish homework",
      "Do your dua 5 times",
      "Clean your laptop",
      "Call to your mother"
    ];
    final leftIcon = Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(bottom: 10),
        color: Colors.blue[900],
        child: const Icon(color: Colors.white, Icons.edit));
    final rightIcon = Container(
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.only(bottom: 10),
        color: Colors.red[900],
        child: const Padding(
          padding: EdgeInsets.all(3.0),
          child: Icon(color: Colors.white, Icons.delete),
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
                fit: BoxFit.fill, image: AssetImage('assets/wallpaper.jpg'))),
        child: InkWell(
            onTap: () {
              Get.back();
            },
            child:
                const Icon(Icons.arrow_back, color: AppColors.secondaryColor)),
      ),
      Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              const Icon(Icons.home, color: AppColors.secondaryColor),
              const SizedBox(width: 20),
              Container(
                // ignore: sort_child_properties_last
                child: const Icon(Icons.plus_one_rounded,
                    color: Colors.white, size: 20),
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    color: Colors.black),
              ),
              Expanded(child: Container()),
              const Icon(Icons.calendar_month, color: AppColors.secondaryColor),
              const SizedBox(width: 20),
              Text(myTasks.length.toString(),
                  style: const TextStyle(
                      fontSize: 20,
                      color: AppColors.secondaryColor,
                      fontFamily: 'Poppins')),
            ],
          )),
      Flexible(
        child: ListView.builder(
            itemCount: myTasks.length,
            itemBuilder: (context, index) {
              return Dismissible(
                background: leftIcon,
                secondaryBackground: rightIcon,
                onDismissed: (DismissDirection direction) {
                  print('after dismiss');
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
                },
                key: ObjectKey(index),
                child: Container(
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: TaskWidget(
                        text: myTasks[index], color: Colors.blueGrey)),
              );
            }),
      )
    ]));
  }
}
