class ColdWeatherFacade {
  String coldWeather() {
    return 'assets/cloudSnow.png';
  }
}

class WarmWeatherFacade {
  String warmWeather() {
    return 'assets/cloudSun.png';
  }
}

class NormalWeatherFacade {
  String normalWeather() {
    return 'assets/cloud.png';
  }
}


  // if (temp > 0 && temp < 10) {
  //     weatherCloud = 'assets/cloud.png';
  //   } else if (temp > 10) {
  //     weatherCloud = 'assets/cloudSun.png';
  //   } else if (temp < 0) {
  //     weatherCloud = 'assets/cloudSnow.png';