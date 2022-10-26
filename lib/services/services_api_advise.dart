import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:softwaredesignpatternsapplication/model/model_advise.dart';

class AdviseApiClient {
  Future<Advise>? getAdvise() async {
    var link = Uri.parse("https://api.adviceslip.com/advice");

    var response = await http.get(link);

    var body = jsonDecode(response.body);
    
    return Advise.fromJson(body);
  }
}
