// ignore_for_file: constant_identifier_names

enum AppRoutes {
  splash,
  settings,
  profile,
  login,
  register,
  home,
  nearly,
  chat,
  favorite,
  notif,
  chatWithSaloon,
  list;

  String get path {
    switch (this) {
      case AppRoutes.splash:
        return "/splash";
      case AppRoutes.settings:
        return "/settings";
      case AppRoutes.profile:
        return "/profile";
      case AppRoutes.login:
        return "/login";
      case AppRoutes.register:
        return "/register";
      case AppRoutes.home:
        return "/home";
      case AppRoutes.nearly:
        return "/nearly";
      case AppRoutes.chat:
        return "/chat";
      case AppRoutes.notif:
        return "/notif";
      case AppRoutes.favorite:
        return "/favorite";
      case AppRoutes.list:
        return "/list";
      case AppRoutes.chatWithSaloon:
        return "/chat_with_saloon";
      default:
        return "/login";
    }
  }
}
