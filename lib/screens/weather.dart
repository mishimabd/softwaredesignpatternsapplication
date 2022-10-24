import 'package:flutter/material.dart';
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
  @override
  void initState() {
    client.getCurrentWeather();
    super.initState();
  }

  WeatherApiClient client = WeatherApiClient();
  Weather? data;
  Future<void> getData() async {
    data = await client.getCurrentWeather();
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
                      const SizedBox(height: 50),
                      RichText(
                          text: TextSpan(
                              text: data!.cityName,
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                            TextSpan(
                                text: '\nWind speed:  ${data!.wind}',
                                style: const TextStyle(
                                  fontSize: 12,
                                ))
                          ])),
                      const SizedBox(
                        height: 20,
                      ),
                    
                    ],
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return Container();
            }));
  }
}
