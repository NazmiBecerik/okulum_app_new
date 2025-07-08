enum Endpoints {
  userInternetInfo,
  services;

  String get path {
    switch (this) {
      case Endpoints.userInternetInfo:
        return "https://ipapi.co/json/";
      case Endpoints.services:
        return "/auth/services";
    }
  }
}
