enum Endpoints {
  phoneLogin,
  passwordLogin,
  studentLogin;

  String get path {
    switch (this) {
      case Endpoints.phoneLogin:
        return "myschoolapi/v1/auth/login/phone";
      case Endpoints.passwordLogin:
        return "myschoolapi/v1/auth/login/password";
      case Endpoints.studentLogin:
        return "myschoolapi/v1/auth/login/student";
    }
  }
}
