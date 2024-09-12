import 'package:pollos_digital/app/models/base.model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:pollos_digital/app/models/notificacao.model.dart';
import 'base.api.dart';

class NotificacaoApi extends BaseApi {
  Future<BaseModel<NotificacaoModel>> listaNotificacoes() async {
    var b = BaseModel<NotificacaoModel>();

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel();
      }

      final url = '/Notificacao/ListaNotificacoes/$cpf';

      var result = (await (await dio).get(url)).data;

      b = BaseModel.fromJson(result, tipo: NotificacaoModel(), isList: true);
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }

  Future<BaseModel<NotificacaoModel>> notificacaoLida(int codigo) async {
    var b = BaseModel<NotificacaoModel>();

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel();
      }

      final url = '/Notificacao/NotificacaoLida/$codigo';

      var result = (await (await dio).post(url)).data;

      b = BaseModel.fromJson(result, tipo: NotificacaoModel());
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }
}
