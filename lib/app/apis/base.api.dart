import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pollos_digital/app/apis/intercepetors/app.interceptor.dart';
import 'package:pollos_digital/app/constants/constants.dart';
import 'package:pollos_digital/app/models/hives/login.hive.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class BaseApi {
  @protected
  get baseUrl => API_URL;
  @protected
  get header => {"Content-Type": "application/json"};
  @protected
  BaseOptions _option = BaseOptions();
  @protected
  Future<Dio> get dio async => await newDio();
  @protected
  final LoginHive _loginHive = LoginHive();
  @protected
  String get cpf => _loginHive.cpf();

  @protected
  newDio() async {
    _option = BaseOptions(baseUrl: baseUrl);

    var d = Dio(_option);
    bool boxExists = false;
    try {
      boxExists = await _loginHive.boxExists();
      if (boxExists) {}
    } catch (e) {
      boxExists = false;
    }

    if (kDebugMode) {
      d.interceptors.addAll([
        AppInterceptors(),
        PrettyDioLogger(
          // requestHeader: true,
          request: true,
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          error: true,
        )
      ]);
    } else {
      d.interceptors.add(AppInterceptors());
    }
    return d;
  }

  String handleDioException(DioException e) {
    if (kDebugMode) {
      print(e);
    }
    try {
      // return e.response!.data['message'];
      return e.response!.data['message'][0];
    } catch (e) {
      return 'Erro ao tentar executar essa ação';
    }
  }

  String getMessage(Map m) {
    try {
      return m['message'];
    } catch (e) {
      return 'Erro ao tentar executar essa ação';
    }
  }
}
