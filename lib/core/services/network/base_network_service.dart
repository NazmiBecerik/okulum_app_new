import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../app/models/general_response.dart';
import '../../utils/getx_extensions.dart';

enum Api { test, live }

extension ApiExtension on Api {
  String get path {
    switch (this) {
      case Api.test:
        return "http://localhost:3000/api/v1/";
      case Api.live:
        return "https://api.salonrandevu.com/api/v1/";
    }
  }
}

class BaseNetworkService extends GetxService {
  Api _apiSelection = Api.test;

  Api get apiSelection => _apiSelection;

  set apiSelection(Api val) {
    _apiSelection = val;
    _networkManagerInstance = _createNetworkManagerInstance();
  }

  late Dio _networkManagerInstance;

  @override
  void onInit() {
    _networkManagerInstance = _createNetworkManagerInstance();
    super.onInit();
  }

  Dio _createNetworkManagerInstance() {
    final dio = Dio(
      BaseOptions(
        baseUrl: _apiSelection.path,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Language': Get.locale?.languageCode == "tr" ? "tr" : "en",
          "Platform": Platform.isAndroid ? "android" : "ios",
        },
        receiveTimeout: const Duration(milliseconds: 15000),
        connectTimeout: const Duration(milliseconds: 15000),
      ),
    );

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Burada istek yapmadan önce gerekli işlemleri gerçekleştirebilirsiniz.
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // Burada yanıt geldikten sonra gerekli işlemleri gerçekleştirebilirsiniz.
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        return handler.next(e);
      },
    ));
    return dio;
  }

  Dio get networkManager => _networkManagerInstance;

  void setToken(String token) {
    _networkManagerInstance.options.headers[HttpHeaders.authorizationHeader] = token;
  }

  void clearToken() {
    _networkManagerInstance.options.headers.remove(HttpHeaders.authorizationHeader);
  }
}
