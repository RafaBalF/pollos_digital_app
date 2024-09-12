import 'package:mobx/mobx.dart';
import 'package:pollos_digital/app/apis/auth.api.dart';
import 'package:pollos_digital/app/models/auth.model.dart';
import 'package:pollos_digital/app/models/base.model.dart';
import 'package:pollos_digital/app/models/hives/login.hive.dart';
import 'package:pollos_digital/app/models/string_response.model.dart';
import 'package:pollos_digital/loading_store.dart';

part 'register_store.g.dart';

class RegisterStore = RegisterStoreBase with _$RegisterStore;

abstract class RegisterStoreBase with Store {
  //APIS
  final AuthApi authApi = AuthApi();
  final LoginHive _loginHive = LoginHive();

  //STORES
  final LoadingStore loadingStore = LoadingStore();

  //CONSTS
  final int defaultCounterValue = 60;

  //VARIABLES
  String? _userCpf;

  //OBSERVABLE

  @observable
  AuthModel? authModel;

  @observable
  String? cpf;

  @observable
  String? password;

  @observable
  String? confirmPassword;

  @observable
  String? code;

  @observable
  int counter = 60;

  // COMPUTED
  bool notEmpty(String? value) {
    return value != "" && value != null;
  }

  @computed
  bool get validCode => notEmpty(code) && code!.length == 6;

  //ACTION
  @action
  void setAuthModel(AuthModel model) => authModel = model;
  @action
  void setCpf(String? value) => cpf = value;
  @action
  void setPassword(String? value) => password = value;
  @action
  void setConfirmPassword(String? value) => confirmPassword = value;
  @action
  void setCode(String? value) => code = value;
  @action
  void setCounter(int value) => counter = value;

  @action
  Future logout() async {
    await _loginHive.logout();
    getAuthModel();
  }

  @action
  Future<void> getAuthModel() async {
    if (_loginHive.isLogged()) {
      authModel = _loginHive.getLogin();
    } else {
      authModel = null;
    }
  }

  @action
  Future<BaseModel<AuthModel>> register() async {
    loadingStore.show();

    if (cpf == null || password == null) return BaseModel<AuthModel>();

    var r = await authApi.cadastrarLogin(cpf!, password!);
    if (r.success) {
      _userCpf = r.data!.cpf;
    }

    loadingStore.hide();
    return r;
  }

  @action
  Future<BaseModel<StringResponseModel>> resendSMS() async {
    if (_userCpf == null) {
      return BaseModel();
    }

    var result = await authApi.resendSMS(_userCpf!);

    setCounter(defaultCounterValue);

    return result;
  }

  @action
  Future<BaseModel<AuthModel>> validateCode() async {
    if (_userCpf == null) {
      return BaseModel();
    }

    loadingStore.show();

    var r = await authApi.confirmCode(_userCpf!, code!);

    if (r.success && r.data != null) {
      await _loginHive.setLogin(r.data!);
    }

    loadingStore.hide();

    return r;
  }

  //MISCS
}
