import 'package:pollos_digital/app/models/base.model.dart';
import 'package:mobx/mobx.dart';
import 'package:pollos_digital/app/apis/auth.api.dart';
import 'package:pollos_digital/app/models/auth.model.dart';
import 'package:pollos_digital/app/models/hives/login.hive.dart';
import 'package:pollos_digital/loading_store.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  //APIS
  final AuthApi authApi = AuthApi();
  final LoginHive _loginHive = LoginHive();

  //STORES
  final LoadingStore loadingStore = LoadingStore();

  //OBSERVABLE

  @observable
  AuthModel? authModel;
  @observable
  bool attemptedAutoLogin = false;
  @observable
  bool autoLogged = false;

  // COMPUTED

  //ACTION
  @action
  void setAuthModel(AuthModel model) => authModel = model;

  @action
  Future logout() async {
    await _loginHive.logout();
    getAuthModel();
  }

  @action
  Future<void> getAuthModel() async {
    _loginHive.isLogged()
        ? authModel = _loginHive.getLogin()
        : authModel = null;
  }

  @action
  Future<void> attemptAutoLogin() async {
    await getAuthModel();

    if (authModel?.id == null) {
      attemptedAutoLogin = true;
      return;
    }

    // var r = BaseModel<AuthModel>();

    var r = await authApi.validarLogin(authModel!.email!, authModel!.senha!);

    attemptedAutoLogin = true;

    if (!r.sucesso) return;

    autoLogged = true;
  }

  //MISCS
}
