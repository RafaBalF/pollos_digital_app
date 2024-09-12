import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pollos_digital/app/apis/sessao.api.dart';
import 'package:pollos_digital/app/models/aplicador.model.dart';
import 'package:pollos_digital/app/models/base.model.dart';
import 'package:pollos_digital/app/models/comanda.model.dart';
import 'package:pollos_digital/app/models/empty.model.dart';
import 'package:pollos_digital/app/models/estabelecimento.model.dart';
import 'package:pollos_digital/app/models/evento_sessao.model.dart';
import 'package:pollos_digital/app/models/excluir_sessao.model.dart';
import 'package:pollos_digital/app/models/horarios_disponiveis_com_opcoes.model.dart';
import 'package:pollos_digital/app/models/sessao.model.dart';
import 'package:pollos_digital/app/models/session_area.model.dart';
import 'package:pollos_digital/app/modules/sessao/models/hora_display.model.dart';
import 'package:pollos_digital/app/modules/sessao/models/horarios_display.model.dart';
import 'package:pollos_digital/app/shared/interfaces/selectable_card.interface.dart';
import 'package:mobx/mobx.dart';
import 'package:pollos_digital/loading_store.dart';

part 'sessao_store.g.dart';

class SessaoStore = SessaoStoreBase with _$SessaoStore;

abstract class SessaoStoreBase with Store {
  final LoadingStore loadingStore = LoadingStore();

  final SessaoApi _sessaoApi = SessaoApi();

  //==============================================
  //==== AGENDAMENTO =============================
  //==============================================

  final ScrollController agendaScrollController = ScrollController();

  void scrollToBottom() {
    agendaScrollController.animateTo(
      agendaScrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  @observable
  ExcluirSessaoModel? sessaoSendoReagendada;

  @action
  void setSessaoSendoReagendada(ExcluirSessaoModel? s) =>
      sessaoSendoReagendada = s;

  @observable
  ObservableList<SelectableCard<ComandaModel>> comandas = ObservableList.of([]);
  @observable
  ComandaModel? comandaSelecionada;

  @action
  Future<void> initAgendamento() async {
    await getComandas();
  }

  @action
  Future<void> getComandas() async {
    final r = await _sessaoApi.listarComandasComSessoesDisponiveisPorCPF();

    if (!r.success) return;

    for (var c in r.list!) {
      if (!podeSerAgendada(c)) continue;

      comandas.add(SelectableCard(
        label: c.item ?? "",
        value: c,
        onSelect: () {
          selectComanda(c);
        },
        onUnselect: () {
          unselectComanda(c);
        },
      ));
    }
  }

  bool podeSerAgendada(ComandaModel c) {
    return c.comandaSemAssinaturas == false ||
        (c.codigoSessaoEmAberto != null && c.dataSessaoEmAberto != null) ||
        c.comandaInadimplente == true ||
        c.comandaTransferida == true;
  }

  @action
  void setComandaSelecionada(ComandaModel? c) => comandaSelecionada = c;

  @observable
  DateTime? startDate;
  @observable
  DateTime? endDate;

  @computed
  bool get podeBuscarHorarios => startDate != null && endDate != null;

  @observable
  int duracaoSessao = 0;

  @action
  void setStartDate(DateTime date) => startDate = date;
  @action
  void setEndDate(DateTime date) => endDate = date;
  @action
  void resetDates() => startDate = endDate = null;

  @action
  void incrementDuracaoSessao(int d) => duracaoSessao += d;
  @action
  void decrementDuracaoSessao(int d) => duracaoSessao -= d;

  @action
  void selectComanda(ComandaModel c) {
    setComandaSelecionada(c);
    incrementDuracaoSessao(c.tempoSessao ?? 0);
  }

  @action
  void unselectComanda(ComandaModel c) {
    setComandaSelecionada(null);
    decrementDuracaoSessao(c.tempoSessao ?? 0);
  }

  @observable
  HorariosDisponiveisComOpcoesModel? horariosDisponiveis;
  @observable
  ObservableList<HorariosDisplayModel> horariosDisplay = ObservableList.of([]);
  @observable
  DateTime? horarioSelecionado;

  @action
  Future<BaseModel<HorariosDisponiveisComOpcoesModel>> buscarHorarios() async {
    loadingStore.show();

    var b = BaseModel<HorariosDisponiveisComOpcoesModel>();

    if (comandaSelecionada == null || startDate == null || endDate == null) {
      b.message = "Faltam informações para buscar horários";
      return b;
    }

    b = await _sessaoApi.listarHorariosDisponiveisComOpcoes(
      comandaSelecionada!.codigoUnidade!,
      comandaSelecionada!.tempoSessao!,
      startDate!,
      endDate!,
    );

    loadingStore.hide();

    if (!b.success) return b;

    horariosDisplay.clear();
    desselecionarHorario();

    horariosDisponiveis = b.data!;

    horariosDisponiveis!.horarios!.length;

    final DateFormat diaFormatter = DateFormat("dd/MM");
    final DateFormat horaFormatter = DateFormat("HH:mm");

    final dias = <int>[];

    for (var i = 0; i < horariosDisponiveis!.horarios!.length; i++) {
      final horario = horariosDisponiveis!.horarios![i];

      final dia = horario.day;

      if (!dias.contains(dia)) dias.add(dia);
    }

    for (var d in dias) {
      final horas =
          horariosDisponiveis!.horarios!.where((h) => h.day == d).toList();

      if (horas.isEmpty) continue;

      List<HoraDisplay> horaDisplays = [];

      for (var h in horas) {
        horaDisplays.add(HoraDisplay(hora: horaFormatter.format(h), valor: h));
      }

      horariosDisplay.add(HorariosDisplayModel(
        dia: diaFormatter.format(horas.first),
        horarios: horaDisplays,
      ));
    }

    return b;
  }

  @action
  void limparHorarios() => horarioSelecionado = null;

  @action
  void setHorariosDisponiveis(HorariosDisponiveisComOpcoesModel d) =>
      horariosDisponiveis = d;
  @action
  void limparHorariosDisponiveis() => horarioSelecionado = null;
  @action
  void selecionarHorario(DateTime d) => horarioSelecionado = d;
  @action
  void desselecionarHorario() => horarioSelecionado = null;

  @action
  Future<BaseModel<EmptyResponseModel>> salvarAgendamento() async {
    loadingStore.show();

    var b = BaseModel<EmptyResponseModel>();

    if (sessaoSendoReagendada != null) {
      b = await _sessaoApi.excluirAgendamento(sessaoSendoReagendada!);

      if (!b.success) return b;

      setSessaoSendoReagendada(null);
    }

    b = await _sessaoApi.salvarAgendamento(
      comandaSelecionada!.codigoUnidade!,
      horariosDisponiveis!.codigoColaborador!,
      comandaSelecionada!.codigoComandaItem!,
      comandaSelecionada!.codigoItemSessao!,
      comandaSelecionada!.item!,
      horarioSelecionado!,
      DateTime.parse(horarioSelecionado.toString())
          .add(Duration(minutes: duracaoSessao)),
    );

    loadingStore.hide();

    return b;
  }

  @action
  void resetDuracaoSessao() {
    duracaoSessao = 0;
  }

  @action
  void resetAgendamento() {
    resetDates();
    resetDuracaoSessao();
    horariosDisplay.clear();
    desselecionarHorario();
    setSessaoSendoReagendada(null);
  }

  //==============================================
  //==== HISTÓRICO ===============================
  //==============================================

  @observable
  ObservableList<SessaoModel> sessoes = ObservableList.of([]);
  @observable
  ObservableList<EventoSessaoModel> history = ObservableList.of([]);

  @action
  Future<void> initHistory() async {
    await getHistory();
  }

  @action
  Future<void> getHistory() async {
    loadingStore.show();

    var r = await _sessaoApi.listarHistoricoUltimasSessoes();

    sessoes.clear();
    sessoes.addAll(r.list ?? []);

    final eventos = <EventoSessaoModel>[];

    for (var sessao in sessoes) {
      eventos.addAll(sessao.eventos!);
    }

    history.clear();
    history.addAll(eventos);

    loadingStore.hide();
  }

  SessaoModel? encontrarSessaoPorEvento(EventoSessaoModel evento) {
    return sessoes
        .where((sessao) =>
            sessao.eventos!
                .where((e) => e.codigoEvento == evento.codigoEvento)
                .first
                .codigoEvento ==
            evento.codigoEvento)
        .firstOrNull;
  }

  @action
  Future<BaseModel<EmptyResponseModel>> confirmarAgendamento(
    EventoSessaoModel evento,
  ) async {
    var r = BaseModel<EmptyResponseModel>();

    final sessao = encontrarSessaoPorEvento(evento);

    if (sessao == null) {
      r.message = "Sessão não encontrada";
      return r;
    }

    r = await _sessaoApi.confirmarAgendamento(
      sessao.codigoComanda!,
      evento.dataHoraIncio!,
    );

    if (r.success) mudarStatusEventoSessao(evento, 'Confirmado');

    return r;
  }

  @action
  void mudarStatusEventoSessao(EventoSessaoModel evento, String status) {
    var s = history.indexWhere((s) => s.codigoEvento == evento.codigoEvento);

    if (s == -1) return;

    var newSession = EventoSessaoModel.createNew(evento);

    newSession.status = status;

    history[s] = newSession;
  }

  @action
  void resetHistory() {
    history.clear();
  }

  //==============================================
  //==== AVALIAR =================================
  //==============================================

  @observable
  EventoSessaoModel? sessaoSendoAvaliada;
  @observable
  AplicadorModel? aplicador;
  @observable
  EstabelecimentoModel? estabelecimento;
  @observable
  double? notaSessao;
  @observable
  double? notaEstabelecimento;

  @action
  Future<void> initAvaliar() async {
    getAplicadorEEstabelecimento();
  }

  @action
  Future<void> getAplicadorEEstabelecimento() async {
    aplicador = AplicadorModel(
      id: 1,
      nome: "Lara Souza",
      atendimentos: 132,
      foto: null,
    );

    estabelecimento = EstabelecimentoModel(
      id: 1,
      nome: "LASER FAST UNIDADE REDENTORA",
      foto: null,
    );
  }

  @action
  void setSessaoSendoAvaliada(EventoSessaoModel? s) => sessaoSendoAvaliada = s;
  @action
  void setNotaSessao(double? d) => notaSessao = d;
  @action
  void setNotaEstabelecimento(double? d) => notaEstabelecimento = d;

  @action
  Future<bool> avaliar() async {
    return true;
  }

  @action
  void resetAvaliar() {
    setSessaoSendoAvaliada(null);
    setNotaSessao(null);
    setNotaEstabelecimento(null);
  }

  //==============================================
  //==== CHECK-IN ================================
  //==============================================

  @observable
  EventoSessaoModel? sessaoParaCheckIn;
  @observable
  XFile? fotoCheckIn;
  @observable
  ObservableList<SelectableCard<SessionAreaModel>> areasDisponiveis =
      ObservableList.of([]);
  @observable
  AplicadorModel? atendidoPor;

  @action
  Future<void> initCheckIn() async {
    await buscarSessao();
  }

  @action
  void setSessaoParaCheckIn(EventoSessaoModel? s) => sessaoParaCheckIn = s;
  @action
  void setfotoCheckIn(XFile? b) => fotoCheckIn = b;

  @action
  Future<bool> buscarSessao() async {
    await getAreasDisponiveis();

    return true;
  }

  @action
  Future<void> getAreasDisponiveis() async {
    areasDisponiveis.clear();

    List<SelectableCard<SessionAreaModel>> items = [];

    areasDisponiveis.addAll(items);
  }

  @action
  void selecionarAreasDaSessao(SessionAreaModel session) {
    if (sessaoParaCheckIn == null) return;
  }

  @action
  Future<bool> fazerCheckIn() async {
    atendidoPor = AplicadorModel(
      id: 1,
      nome: "Lara Souza",
      atendimentos: 132,
      foto: null,
    );

    return true;
  }

  @action
  void resetCheckIn() {
    setSessaoParaCheckIn(null);
    setfotoCheckIn(null);
    areasDisponiveis.clear();
    atendidoPor = null;
  }
}
