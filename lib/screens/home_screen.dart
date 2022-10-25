import 'package:flutter/material.dart';
import 'package:softwaredesignpatternsapplication/model/model_advise.dart';
import 'package:softwaredesignpatternsapplication/screens/add_task.dart';
import 'package:softwaredesignpatternsapplication/screens/all_tasks.dart';
import 'package:softwaredesignpatternsapplication/screens/weather.dart';
import 'package:softwaredesignpatternsapplication/services/services_api_advise.dart';
import 'package:softwaredesignpatternsapplication/services/services_api_weather.dart';
import 'package:softwaredesignpatternsapplication/widgets/button_widget.dart';
import 'package:get/get.dart';

import '../model/model_weather.dart';
import '../utils/const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                            text: "Hello",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 60,
                                fontWeight: FontWeight.bold),
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                          TextSpan(
                              text: '\nProject for finishing all 5 patterns!',
                              style: TextStyle(
                                fontSize: 12,
                              ))
                        ])),
                    SizedBox(height: MediaQuery.of(context).size.height / 9),
                    const Center(
                      child: Text("Advices for you",
                      textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 10),
                    Card(
                        child: Center(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("${data!.advise}",
                            textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily: 'Poppins', fontSize: 20)),
                          ],
                        ),
                      ),
                    )),
                    SizedBox(height: MediaQuery.of(context).size.height / 8),
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
                    InkWell(
                      onTap: () {
                        Get.to(() => const WeatherPage(),
                            transition: Transition.cupertinoDialog,
                            duration: const Duration(milliseconds: 800));
                      },
                      child: const ButtonWidget(
                          text: 'Weather',
                          backgroundColor: AppColors.mainColor,
                          textColor: Colors.white),
                    )
                  ],
                ),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/wallpaper.jpg'))),
              );
            }
            return Container();
          }),
    );
  }
}
