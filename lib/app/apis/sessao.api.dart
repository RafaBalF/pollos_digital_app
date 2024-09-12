import 'package:pollos_digital/app/models/base.model.dart';
import 'package:pollos_digital/app/models/comanda.model.dart';
import 'package:pollos_digital/app/models/contrato.model.dart';
import 'package:pollos_digital/app/models/empty.model.dart';
import 'package:pollos_digital/app/models/excluir_sessao.model.dart';
import 'package:pollos_digital/app/models/horarios_disponiveis_com_opcoes.model.dart';
import 'package:pollos_digital/app/models/sessao.model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'base.api.dart';

class SessaoApi extends BaseApi {
  Future<BaseModel<SessaoModel>> listarHistoricoUltimasSessoes() async {
    var b = BaseModel<SessaoModel>();

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel();
      }

      final url = '/Historico/ListarHistoricoUltimasSessoes/$cpf';

      var result = (await (await dio).get(url)).data;

      b = BaseModel.fromJson(result, tipo: SessaoModel(), isList: true);
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }

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

  Future<BaseModel<ComandaModel>>
      listarComandasComSessoesDisponiveisPorCPF() async {
    var b = BaseModel<ComandaModel>();

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel();
      }

      final url = '/Agendamento/ListarComandasComSessoesDisponiveisPorCPF/$cpf';

      var result = (await (await dio).get(url)).data;

      b = BaseModel.fromJson(result, tipo: ComandaModel(), isList: true);
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }

  Future<BaseModel<HorariosDisponiveisComOpcoesModel>>
      listarHorariosDisponiveisComOpcoes(
    int codigoUnidade,
    int tempoSessaoTotal,
    DateTime dataInicial,
    DateTime dataFinal,
  ) async {
    var b = BaseModel<HorariosDisponiveisComOpcoesModel>();

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel();
      }

      const url = '/Agendamento/ListarHorariosDisponiveisComOpcoesPost';
      const limite = 50;

      var result = (await (await dio).post(url, data: {
        "buscaPorComanda": false,
        "codigoUnidade": codigoUnidade,
        "codigoComanda": null,
        "periodo": "",
        "diaSemana": "X",
        "tempoSessaoTotal": tempoSessaoTotal,
        "dataInicial": dataInicial.toString(),
        "dataFinal": dataFinal.toString(),
        "limiteHorarios": limite,
      }))
          .data;

      b = BaseModel.fromJson(result, tipo: HorariosDisponiveisComOpcoesModel());
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }

  Future<BaseModel<EmptyResponseModel>> salvarAgendamento(
    int codigoUnidade,
    int codigoColaborador,
    int codigoComandaItem,
    int codigoItemComposicao,
    String assunto,
    DateTime dataHoraInicio,
    DateTime dataHoraFim,
  ) async {
    var b = BaseModel<EmptyResponseModel>();

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel();
      }

      const url = '/Agendamento/SalvarAgendamento';

      var result = (await (await dio).post(
        url,
        data: [
          {
            // "codigo": null,
            "codigoFranquia": codigoUnidade,
            "codigoColaborador": codigoColaborador,
            "codigoComandaItem": codigoComandaItem,
            "codigoItemComposicao": codigoItemComposicao,
            "totem": false,
            "assunto": assunto,
            "cpf": cpf,
            "dataHoraInicio": dataHoraInicio.toString(),
            "dataHoraFim": dataHoraFim.toString(),
          }
        ],
      ))
          .data;

      b = BaseModel.fromJson(result, tipo: EmptyResponseModel());
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }

  Future<BaseModel<EmptyResponseModel>> confirmarAgendamento(
    int codigoComanda,
    DateTime dataConfirmacao,
  ) async {
    var b = BaseModel<EmptyResponseModel>();

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel();
      }

      const url = '/Agendamento/ConfirmarAgendamento';

      var result = (await (await dio).post(url, data: {
        "cpf": cpf,
        "dataConfirmacao": dataConfirmacao.toString(),
        "codigoComanda": codigoComanda,
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

  Future<BaseModel<EmptyResponseModel>> excluirAgendamento(
      ExcluirSessaoModel sessao) async {
    var b = BaseModel<EmptyResponseModel>();

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel();
      }

      const url = '/Agendamento/ExcluirAgendamento';

      var result = (await (await dio).post(url, data: {
        "cpf": cpf,
        "dataCancelamento": sessao.data.toString(),
        "codigoComanda": sessao.codigoComanda,
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
