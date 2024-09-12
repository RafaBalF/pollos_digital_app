import 'package:pollos_digital/app/models/base.model.dart';
import 'package:pollos_digital/app/models/contrato.model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'base.api.dart';

class ContratoApi extends BaseApi {
  Future<BaseModel<ContratoModel>> listarContratos() async {
    var b = BaseModel<ContratoModel>();

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel();
      }

      final url = '/Contratos/ListarContratos/$cpf';

      var result = (await (await dio).get(url)).data;

      b = BaseModel.fromJson(result, tipo: ContratoModel(), isList: true);
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }
}
