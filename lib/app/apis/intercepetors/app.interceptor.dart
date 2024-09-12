import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/models/hives/login.hive.dart';

class AppInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    try {
      // _requestLog(options);
      var login = LoginHive();
      var token = login.getToken();
      if (token != "") {
        options.headers.addAll({"Authorization": 'Bearer $token'});
      }
      return super.onRequest(options, handler);
    } catch (e) {
      return super.onRequest(options, handler);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    var login = LoginHive();
    if (err.response != null && err.response?.statusCode == 401) {
      login.logout();
      Modular.to.pushNamed('/auth/login');
    }
    super.onError(err, handler);
  }
}
