import 'package:pollos_digital/app/models/hives/app_presentation.hive.dart';
import 'package:mobx/mobx.dart';
import 'package:pollos_digital/app/apis/auth.api.dart';
import 'package:pollos_digital/app/models/auth.model.dart';
import 'package:pollos_digital/app/models/base.model.dart';
import 'package:pollos_digital/app/models/hives/login.hive.dart';
import 'package:pollos_digital/loading_store.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  //APIS
  final AuthApi authApi = AuthApi();
  final LoginHive _loginHive = LoginHive();
  final AppPresentationHive _appPresentationHive = AppPresentationHive();

  //STORES
  final LoadingStore loadingStore = LoadingStore();

  //OBSERVABLE
  @observable
  AuthModel? authModel;

  @observable
  String? cpf;
  @observable
  String? senha;

  // COMPUTED

  //ACTION
  @action
  void setAuthModel(AuthModel model) => authModel = model;
  @action
  void setCpf(String? value) => cpf = value;
  @action
  void setSenha(String? value) => senha = value;

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
  Future<BaseModel<AuthModel>> login() async {
    loadingStore.show();

    BaseModel<AuthModel> r = BaseModel<AuthModel>();
    r = await authApi.validarLogin(cpf!, senha!);

    if (r.success) _appPresentationHive.setHasSeenAppPresentationBefore(true);

    loadingStore.hide();
    return r;
  }
}
