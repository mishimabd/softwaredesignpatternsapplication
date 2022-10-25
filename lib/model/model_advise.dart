//https://api.adviceslip.com/advice

class Advise {
  String? advise;
  Advise({required this.advise});

  Advise.fromJson(Map<String, dynamic> json) {
    advise = json["slip"]["advice"];
  }
}
