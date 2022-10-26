import 'package:flutter/material.dart';

import '../model/model_advise.dart';
import '../services/services_api_advise.dart';

class AdvisePage extends StatefulWidget {
  const AdvisePage({super.key});

  @override
  State<AdvisePage> createState() => _AdvisePageState();
}

class _AdvisePageState extends State<AdvisePage> {
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
    return Scaffold(body: FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(children: [
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
          ]),
        );
      },
    ));
  }
}
