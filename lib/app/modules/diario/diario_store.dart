import 'package:image_picker/image_picker.dart';
import 'package:pollos_digital/app/models/hives/login.hive.dart';
import 'package:mobx/mobx.dart';
import 'package:pollos_digital/loading_store.dart';

part 'diario_store.g.dart';

class DiarioStore = DiarioStoreBase with _$DiarioStore;

abstract class DiarioStoreBase with Store {
  final LoadingStore loadingStore = LoadingStore();
  final LoginHive _loginHive = LoginHive();

  //==============================================
  //==== DIÁRIO ==================================
  //==============================================

  @observable
  bool viuIntro = false;
  @observable
  int etapa = 0;

  @action
  Future<void> initDiario() async {
    verIntro();
    _loginHive.getLogin();
  }

  @action
  void verIntro() => viuIntro = true;
  @action
  void setEtapa(int e) => etapa = e;

  @action
  void resetDiario() {}

  //==============================================
  //==== PRIMEIRA-SESSAO =========================
  //==============================================

  //PS = PRIMEIRA SESSÃO

  @observable
  XFile? fotoPS;
  @observable
  String relatoPS = "";
  @observable
  bool? tomandoMedicamentoPS;
  @observable
  String? qualMedicamentoPS;
  @observable
  bool? tomouNosUltimosSeteDiasPS;
  @observable
  String parametrosPS = "";
  @observable
  String tecnicasPS = "";
  @observable
  String proxSessaoAgendadaPS = "";

  @action
  Future<void> initPrimeiraSessao() async {}

  @action
  void setFotoPS(XFile? f) => fotoPS = f;
  @action
  void setRelatoPS(String s) => relatoPS = s;

  @action
  void setTomandoMedicamentoPS(bool? b) {
    tomandoMedicamentoPS = b;

    setQualMedicamentoPS(null);
    setTomouNosUltimosSeteDiasPS(null);
  }

  @action
  void setQualMedicamentoPS(String? s) => qualMedicamentoPS = s;
  @action
  void setTomouNosUltimosSeteDiasPS(bool? b) => tomouNosUltimosSeteDiasPS = b;
  @action
  void setParametrosPS(String s) => parametrosPS = s;
  @action
  void setTecnicasPS(String s) => tecnicasPS = s;
  @action
  void setProxSessaoAgendadaPS(String s) => proxSessaoAgendadaPS = s;

  @action
  Future<bool> postPS() async {
    etapa = 1;

    return true;
  }

  @action
  void resetPrimeiraSessao() {
    setFotoPS(null);
    setRelatoPS("");
    setTomandoMedicamentoPS(null);
    setParametrosPS("");
    setTecnicasPS("");
    setProxSessaoAgendadaPS("");
  }
}
