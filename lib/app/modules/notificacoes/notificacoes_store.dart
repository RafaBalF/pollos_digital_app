import 'package:pollos_digital/app/apis/notificacao.api.dart';
import 'package:pollos_digital/app/models/notificacao.model.dart';
import 'package:mobx/mobx.dart';
import 'package:pollos_digital/loading_store.dart';

part 'notificacoes_store.g.dart';

class NotificacoesStore = NotificacoesStoreBase with _$NotificacoesStore;

abstract class NotificacoesStoreBase with Store {
  final LoadingStore loadingStore = LoadingStore();
  final NotificacaoApi _notificacaoApi = NotificacaoApi();

  @observable
  ObservableList<NotificacaoModel> notificacoes = ObservableList.of([]);

  @action
  Future<void> init() async {
    await getNotificacoes();
  }

  @action
  Future<void> getNotificacoes() async {
    notificacoes.clear();
    final r = await _notificacaoApi.listaNotificacoes();

    if (!r.success) return;

    notificacoes.addAll(r.list!);
  }

  @action
  Future<void> lerNotificacao(NotificacaoModel notificacao) async {
    final r = await _notificacaoApi.notificacaoLida(notificacao.codigo!);

    if (!r.success) return;

    final index =
        notificacoes.indexWhere((n) => n.codigo == notificacao.codigo);

    var n = NotificacaoModel.createNew(notificacao);
    n.lido = true;

    notificacoes[index] = n;
  }

  @action
  void reset() {
    notificacoes.clear();
  }
}
