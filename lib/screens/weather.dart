import 'package:flutter/material.dart';
import 'package:softwaredesignpatternsapplication/services/services_api_weather.dart';
import 'package:softwaredesignpatternsapplication/widgets/button_widget.dart';
import 'package:get/get.dart';

import '../model/model_weather.dart';
import '../utils/const.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
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
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),
                        Text(data!.cityName, style: const TextStyle(fontSize: 50),),
                        Text('It feels like a ${data!.feels}', style: const TextStyle(fontSize: 20),),
                        Text('Temperature is ${data!.temp}', style: const TextStyle(fontSize: 20),),
                        Text('Wind is like a ${data!.wind}', style: const TextStyle(fontSize: 20),),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return Container();
            }));
  }
}
