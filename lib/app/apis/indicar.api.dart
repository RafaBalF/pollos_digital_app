import 'package:pollos_digital/app/models/base.model.dart';
import 'package:pollos_digital/app/models/empty.model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'base.api.dart';

class IndicarApi extends BaseApi {
  Future<BaseModel<EmptyResponseModel>> salvarIndique(
    String nomeIndicou,
    String nomeIndicado,
    String telefoneIndicado,
  ) async {
    var b = BaseModel<EmptyResponseModel>();

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel();
      }

      const url = '/Indique/SalvarIndique';

      var result = (await (await dio).post(url, data: {
        "nomeIndicou": nomeIndicou,
        "nomeIndicado": nomeIndicado,
        "telefoneIndicado": telefoneIndicado,
      }))
          .data;

      b = BaseModel.fromJson(result, tipo: EmptyResponseModel());
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }
}
