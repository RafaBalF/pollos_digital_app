import 'package:mobx/mobx.dart';
import 'package:pollos_digital/app/apis/auth.api.dart';
import 'package:pollos_digital/app/models/base.model.dart';
import 'package:pollos_digital/app/models/string_response.model.dart';
import 'package:pollos_digital/loading_store.dart';

part 'recover_password_store.g.dart';

class RecoverPasswordStore = RecoverPasswordStoreBase
    with _$RecoverPasswordStore;

abstract class RecoverPasswordStoreBase with Store {
  //APIS
  final AuthApi authApi = AuthApi();

  //STORES
  final LoadingStore loadingStore = LoadingStore();

  //CONSTS

  //VARIABLES

  //OBSERVABLE

  @observable
  String? email;
  @observable
  String? cpf;

  // COMPUTED

  //ACTION
  @action
  void setEmail(String? value) => email = value;
  @action
  void setCpf(String? value) => cpf = value;

  @action
  Future recoverPassword() async {
    loadingStore.show();

    var result = await authApi.recuperarSenha(email!);

    loadingStore.hide();
    return result;
  }

  //MISCS
}
