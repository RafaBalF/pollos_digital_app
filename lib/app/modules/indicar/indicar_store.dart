import 'package:pollos_digital/app/apis/indicar.api.dart';
import 'package:pollos_digital/app/models/base.model.dart';
import 'package:pollos_digital/app/models/empty.model.dart';
import 'package:pollos_digital/app/models/hives/login.hive.dart';
import 'package:pollos_digital/app/models/indicado.model.dart';
import 'package:mobx/mobx.dart';
import 'package:pollos_digital/loading_store.dart';

part 'indicar_store.g.dart';

class IndicarStore = IndicarStoreBase with _$IndicarStore;

abstract class IndicarStoreBase with Store {
  final LoadingStore loadingStore = LoadingStore();
  final LoginHive _loginHive = LoginHive();
  final IndicarApi _indicarApi = IndicarApi();

  late final String nomeIndicou;

  @observable
  ObservableList<IndicadoModel> indicados = ObservableList.of([]);

  @action
  Future<void> init() async {
    nomeIndicou = (_loginHive.getLogin()).nome ?? '';
  }

  @action
  Future<BaseModel<EmptyResponseModel>> indicar(
    String nomeIndicou,
    String telefoneIndicado,
  ) async {
    return await _indicarApi.salvarIndique(
      nomeIndicou,
      nomeIndicou,
      telefoneIndicado,
    );
  }

  @action
  void reset() {
    indicados.clear();
  }
}
