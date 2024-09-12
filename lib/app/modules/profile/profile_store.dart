import 'package:pollos_digital/app/apis/auth.api.dart';
import 'package:pollos_digital/app/apis/contrato.api.dart';
import 'package:pollos_digital/app/constants/politica_de_privacidade.dart';
import 'package:pollos_digital/app/models/auth.model.dart';
import 'package:pollos_digital/app/models/base.model.dart';
import 'package:pollos_digital/app/models/contrato.model.dart';
import 'package:pollos_digital/app/models/dados_pessoais.model.dart';
import 'package:pollos_digital/app/models/empty.model.dart';
import 'package:pollos_digital/app/models/hives/login.hive.dart';
import 'package:mobx/mobx.dart';
import 'package:pollos_digital/loading_store.dart';

part 'profile_store.g.dart';

class ProfileStore = ProfileStoreBase with _$ProfileStore;

abstract class ProfileStoreBase with Store {
  final LoadingStore loadingStore = LoadingStore();
  final LoginHive _loginHive = LoginHive();
  final ContratoApi _contratoApi = ContratoApi();

  final AuthApi _authApi = AuthApi();

  //==============================================
  //==== PROFILE =================================
  //==============================================

  @action
  Future<void> initProfile() async {}

  @action
  void resetProfile() {}

  //==============================================
  //==== DADOS-PESSOAIS ==========================
  //==============================================

  @observable
  DadosPessoaisModel? dadosPessoaisModel;

  @action
  Future<void> initDadosPessoais() async {
    AuthModel auth = _loginHive.getLogin();

    dadosPessoaisModel = DadosPessoaisModel(
      nome: auth.nome,
      email: auth.email,
      celular: auth.celular,
      cpf: auth.cpf,
    );
  }

  @action
  void resetDadosPessoais() {}

  //==============================================
  //==== CONFIGURAÇÕES ===========================
  //==============================================

  @action
  Future<void> initConfiguracoes() async {}

  @action
  Future<void> logout() async {
    await _loginHive.logout();
  }

  @action
  Future<BaseModel<EmptyResponseModel>> deleteAccount() async {
    var b = BaseModel<EmptyResponseModel>();

    b = await _authApi.excluirUsuario();

    if (b.success) _loginHive.logout();

    return b;
  }

  @action
  void resetConfiguracoes() {}

  //==============================================
  //==== POLÍTICA DE PRIVACIDADE =================
  //==============================================

  @observable
  String politicaDePrivacidade = '';

  @action
  Future<void> initPoliticasDePrivacidade() async {
    politicaDePrivacidade = politicaDePrivacidadeConst;
  }

  @action
  void resetPoliticasDePrivacidade() {}

  //==============================================
  //==== REDEFINIR-SENHA =========================
  //==============================================

  @observable
  String? senhaAtual;

  @action
  Future<void> initRedefinirSenha() async {
    senhaAtual = (_loginHive.getLogin()).senha;
  }

  @action
  void setSenhaAtual(String s) => senhaAtual = s;

  @action
  Future<BaseModel<EmptyResponseModel>> redefinirSenha(
    String senhaAtual,
    String senhaNova,
  ) async {
    return await _authApi.alterarSenha(senhaAtual, senhaNova);
  }

  @action
  void resetRedefinirSenha() {}

  //==============================================
  //==== CONTRATOS ===============================
  //==============================================

  @observable
  ObservableList<ContratoModel> contratos = ObservableList.of([]);

  @action
  Future<void> initContratos() async {
    final r = await _contratoApi.listarContratos();

    if (!r.success) return;

    contratos.clear();
    contratos.addAll(r.list!);
  }

  @action
  void resetContratos() {
    contratos.clear();
  }
}
