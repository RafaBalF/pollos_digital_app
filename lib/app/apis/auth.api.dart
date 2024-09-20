import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:pollos_digital/app/constants/constants.dart';
import 'package:pollos_digital/app/models/auth.model.dart';
import 'package:pollos_digital/app/models/base.model.dart';
import 'package:pollos_digital/app/models/empty.model.dart';
import 'package:pollos_digital/app/models/hives/login.hive.dart';
import 'package:pollos_digital/app/models/string_response.model.dart';
import 'base.api.dart';

class AuthApi extends BaseApi {
  get _baseUrl => API_URL;
  get _option => BaseOptions(baseUrl: _baseUrl);
  final LoginHive _loginHive = LoginHive();

  Future validarLogin(String user, String senha) async {
    var b = BaseModel();
    AuthModel? result = AuthModel();
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel.networkError();
      }

      var option = BaseOptions(baseUrl: 'https://vitrine.pollosdigital.com.br');
      var response = (await Dio(option)
              .get('/API/listausuario.php?email=$user&senha=$senha'))
          .data;

      try {
        result = AuthModel.fromJson(response);

        if (result.sucesso) {
          AuthModel authModel = AuthModel(
            id: result.id,
            nome: result.nome,
            email: result.email,
            criadoEm: result.criadoEm,
            senha: senha,
          );

          await _loginHive.setLogin(authModel);
          return result;
        } else {
          b.message = result.mensagem!;
        }
      } catch (e) {
        b.message = response;
      }
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }

    return result;
  }

  Future<BaseModel<AuthModel>> cadastrarLogin(String cpf, String senha) async {
    BaseModel<AuthModel> b = BaseModel<AuthModel>();
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel.networkError();
      }

      var result = (await Dio(_option).post(
        '/Login/CadastrarLogin',
        data: {
          "cpf": cpf,
          "senha": senha,
        },
      ))
          .data;

      b = BaseModel<AuthModel>.fromJson(result, tipo: AuthModel());

      if (b.success && b.data != null) {
        AuthModel authModel = AuthModel(
          id: b.data!.id,
          nome: b.data!.nome,
          email: b.data!.email,
          criadoEm: b.data!.criadoEm,
          // email: b.data!.email,
          // senha: senha,
        );

        await _loginHive.setLogin(authModel);
        return b;
      }
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }

  Future<BaseModel<StringResponseModel>> recuperarSenha(
    String email,
    String cpf,
  ) async {
    BaseModel<StringResponseModel> b = BaseModel<StringResponseModel>();
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel.networkError();
      }

      var result = (await Dio(_option).post(
        '/Login/RecuperarSenha',
        data: {
          "email": email,
          "cpf": cpf,
        },
      ))
          .data;

      b = BaseModel<StringResponseModel>.fromJson(
        result,
        tipo: StringResponseModel(),
      );
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }

  Future<BaseModel<StringResponseModel>> resendSMS(String user,
      {bool isID = true}) async {
    BaseModel<StringResponseModel> b = BaseModel<StringResponseModel>();
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel.networkError();
      }
      var result = (await (await dio)
              .get('/auth/resend-sms/$user', queryParameters: {'is_id': true}))
          .data;

      b = BaseModel<StringResponseModel>.fromJson(result,
          tipo: StringResponseModel());
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }

  Future<BaseModel<AuthModel>> confirmCode(String user, String code) async {
    BaseModel<AuthModel> b = BaseModel<AuthModel>();
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel.networkError();
      }
      var result = (await (await dio).post('/auth/confirm_code', data: {
        "email": user,
        "code": code,
      }))
          .data;

      b = BaseModel<AuthModel>.fromJson(result, tipo: AuthModel());
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }

  Future<BaseModel<StringResponseModel>> forgetPassword(String? email) async {
    BaseModel<StringResponseModel> b = BaseModel<StringResponseModel>();
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel.networkError();
      }
      var result = (await (await dio).get('/auth/forget-password/$email')).data;

      b = BaseModel<StringResponseModel>.fromJson(result,
          tipo: StringResponseModel());
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }

  Future<BaseModel<EmptyResponseModel>> alterarSenha(
    String senhaAtual,
    String senhaNova,
  ) async {
    var b = BaseModel<EmptyResponseModel>();

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel();
      }

      const url = '/Login/AlterarSenha';

      var result = (await (await dio).post(url, data: {
        "cpf": cpf,
        "senhaAtual": senhaAtual,
        "senhaNova": senhaNova,
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

  Future<BaseModel<EmptyResponseModel>> excluirUsuario() async {
    var b = BaseModel<EmptyResponseModel>();

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel();
      }

      const url = '/Login/ExcluirUsuario';

      var result = (await (await dio).post(url, data: {"cpf": cpf})).data;

      b = BaseModel.fromJson(result, tipo: EmptyResponseModel());
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }

    return b;
  }
}
