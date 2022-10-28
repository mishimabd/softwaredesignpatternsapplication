abstract class StateOfWeatherImage {
  showPicture() {}
}

late String weatherCloud;

class ColdWeather implements StateOfWeatherImage {
  @override
  showPicture() {
    weatherCloud = 'assets/cloudSnow.png';
  }
}

class WarmWeather implements StateOfWeatherImage {
  @override
  showPicture() {
    weatherCloud = 'assets/cloudSnow.png';
  }
}

class NormalWeather implements StateOfWeatherImage {
  @override
  showPicture() {
    weatherCloud = 'assets/cloud.png';
  }
}

class Set {
  StateOfWeatherImage? stateOfWeatherImage;
  setWeatherImage(StateOfWeatherImage stateOfWeatherImage) {
    this.stateOfWeatherImage = stateOfWeatherImage;
  }

  change() {
    if (stateOfWeatherImage is ColdWeather) {
      setWeatherImage(ColdWeather());
    }
  }
}
