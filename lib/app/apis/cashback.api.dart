import 'package:pollos_digital/app/models/base.model.dart';
import 'package:pollos_digital/app/models/cashback.model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'base.api.dart';

class CashbackApi extends BaseApi {
  Future<BaseModel<CashbackModel>> recuperarCashbackCliente() async {
    var b = BaseModel<CashbackModel>();

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel();
      }

      final url = '/Cashback/RecuperarCashbackCliente/$cpf';

      var result = (await (await dio).get(url)).data;

      b = BaseModel.fromJson(result, tipo: CashbackModel());
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }
}
