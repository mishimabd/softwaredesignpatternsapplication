import 'package:flutter/material.dart';
import 'package:softwaredesignpatternsapplication/patterns/facade/facade.dart';
import 'package:softwaredesignpatternsapplication/patterns/state/state.dart';

import '../model/model_weather.dart';
import '../patterns/builder/builder.dart';
import '../services/services_api_weather.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
//////////////////////////////////////////////////////////////////
//           CODE FOR GETTING YOUT CURRENT LOCATION             //
//Future<void> _getCurrentPosition() async {                    //
//   final hasPermission = await _handleLocationPermission();   //
//   if (!hasPermission) return;                                //
//   await Geolocator.getCurrentPosition(                       //
//           desiredAccuracy: LocationAccuracy.high)            //
//       .then((Position position) {                            //
//     setState(() => _currentPosition = position);             //
//   }).catchError((e) {                                        //
//     debugPrint(e);                                           //
//   });                                                        //
// }                                                            //
//////////////////////////////////////////////////////////////////

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    client.getCurrentWeather();
    super.initState();
  }

  ColdWeatherFacade facadeCold = ColdWeatherFacade();
  NormalWeatherFacade facadeNormal = NormalWeatherFacade();
  WarmWeatherFacade facadeWarm = WarmWeatherFacade();
  ForUsers textInBox = ForUsers();
  WeatherApiClient client = WeatherApiClient();
  Weather? data;
  Future<void> getData() async {
    data = await client.getCurrentWeather();
  }

////////////Facade Pattern////////////////////
  String setImage() {
    
    late String facade;
    num temp = data!.temp.floor();
    if (temp > 0 && temp < 10) {
      facade = facadeNormal.normalWeather();
    } else if (temp > 10) {
      facade = facadeWarm.warmWeather();
    } else if (temp < 0) {
      facade = facadeCold.coldWeather();
    }
    return facade;
  }
///////////////////////////////////////////////
///
///
///
/////////////Builder Pattern///////////////////
  String setTextInBox() {
    num temp = data!.temp.floor();
    if (temp > 0 && temp < 10) {
      textInBox.normal();
    } else if (temp > 10) {
      textInBox.warm();
    } else if (temp < 0) {
      textInBox.cold();
    }
    return "${textInBox.text}";
  }
///////////////////////////////////////////////
///
///
///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
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
                        text: "Prody",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 55,
                            fontWeight: FontWeight.bold),
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                      TextSpan(
                          text: '\nBe productive with Prody!',
                          style: TextStyle(
                            fontSize: 15,
                          ))
                    ])),
                Column(
                  children: [
                    const SizedBox(height: 60),
                    Text(
                      'Temperature in ${data!.cityName}',
                      style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          color: Colors.white),
                    ),
                    Image.asset(setImage()),
                    Text(
                      '${data!.temp.floor()}°C',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 70,
                          fontFamily: 'Poppins',
                          color: Colors.white),
                    ),
                    Text(
                      'But it feels like a ${data!.feels.floor()}°C',
                      style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          color: Colors.white),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 12),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0)),
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          setTextInBox(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontSize: 15),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                )
              ],
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/wallpaper.jpg'))),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/wallpaper.jpg'))),
            child: const Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.transparent,
            )),
          );
        }
        return Container();
      },
    ));
  }
}
