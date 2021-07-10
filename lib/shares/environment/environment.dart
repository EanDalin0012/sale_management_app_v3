class Environment {
  static bool _production = false;

  static String get url {
    if(_production == true) {
      return "http://productin_url:port";
    } else {
      return "http://192.168.43.44:8080";
    }
  }
}