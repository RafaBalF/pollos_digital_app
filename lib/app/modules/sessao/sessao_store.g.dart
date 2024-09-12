// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sessao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SessaoStore on SessaoStoreBase, Store {
  Computed<bool>? _$podeBuscarHorariosComputed;

  @override
  bool get podeBuscarHorarios => (_$podeBuscarHorariosComputed ??=
          Computed<bool>(() => super.podeBuscarHorarios,
              name: 'SessaoStoreBase.podeBuscarHorarios'))
      .value;

  late final _$sessaoSendoReagendadaAtom =
      Atom(name: 'SessaoStoreBase.sessaoSendoReagendada', context: context);

  @override
  ExcluirSessaoModel? get sessaoSendoReagendada {
    _$sessaoSendoReagendadaAtom.reportRead();
    return super.sessaoSendoReagendada;
  }

  @override
  set sessaoSendoReagendada(ExcluirSessaoModel? value) {
    _$sessaoSendoReagendadaAtom.reportWrite(value, super.sessaoSendoReagendada,
        () {
      super.sessaoSendoReagendada = value;
    });
  }

  late final _$comandasAtom =
      Atom(name: 'SessaoStoreBase.comandas', context: context);

  @override
  ObservableList<SelectableCard<ComandaModel>> get comandas {
    _$comandasAtom.reportRead();
    return super.comandas;
  }

  @override
  set comandas(ObservableList<SelectableCard<ComandaModel>> value) {
    _$comandasAtom.reportWrite(value, super.comandas, () {
      super.comandas = value;
    });
  }

  late final _$comandaSelecionadaAtom =
      Atom(name: 'SessaoStoreBase.comandaSelecionada', context: context);

  @override
  ComandaModel? get comandaSelecionada {
    _$comandaSelecionadaAtom.reportRead();
    return super.comandaSelecionada;
  }

  @override
  set comandaSelecionada(ComandaModel? value) {
    _$comandaSelecionadaAtom.reportWrite(value, super.comandaSelecionada, () {
      super.comandaSelecionada = value;
    });
  }

  late final _$startDateAtom =
      Atom(name: 'SessaoStoreBase.startDate', context: context);

  @override
  DateTime? get startDate {
    _$startDateAtom.reportRead();
    return super.startDate;
  }

  @override
  set startDate(DateTime? value) {
    _$startDateAtom.reportWrite(value, super.startDate, () {
      super.startDate = value;
    });
  }

  late final _$endDateAtom =
      Atom(name: 'SessaoStoreBase.endDate', context: context);

  @override
  DateTime? get endDate {
    _$endDateAtom.reportRead();
    return super.endDate;
  }

  @override
  set endDate(DateTime? value) {
    _$endDateAtom.reportWrite(value, super.endDate, () {
      super.endDate = value;
    });
  }

  late final _$duracaoSessaoAtom =
      Atom(name: 'SessaoStoreBase.duracaoSessao', context: context);

  @override
  int get duracaoSessao {
    _$duracaoSessaoAtom.reportRead();
    return super.duracaoSessao;
  }

  @override
  set duracaoSessao(int value) {
    _$duracaoSessaoAtom.reportWrite(value, super.duracaoSessao, () {
      super.duracaoSessao = value;
    });
  }

  late final _$horariosDisponiveisAtom =
      Atom(name: 'SessaoStoreBase.horariosDisponiveis', context: context);

  @override
  HorariosDisponiveisComOpcoesModel? get horariosDisponiveis {
    _$horariosDisponiveisAtom.reportRead();
    return super.horariosDisponiveis;
  }

  @override
  set horariosDisponiveis(HorariosDisponiveisComOpcoesModel? value) {
    _$horariosDisponiveisAtom.reportWrite(value, super.horariosDisponiveis, () {
      super.horariosDisponiveis = value;
    });
  }

  late final _$horariosDisplayAtom =
      Atom(name: 'SessaoStoreBase.horariosDisplay', context: context);

  @override
  ObservableList<HorariosDisplayModel> get horariosDisplay {
    _$horariosDisplayAtom.reportRead();
    return super.horariosDisplay;
  }

  @override
  set horariosDisplay(ObservableList<HorariosDisplayModel> value) {
    _$horariosDisplayAtom.reportWrite(value, super.horariosDisplay, () {
      super.horariosDisplay = value;
    });
  }

  late final _$horarioSelecionadoAtom =
      Atom(name: 'SessaoStoreBase.horarioSelecionado', context: context);

  @override
  DateTime? get horarioSelecionado {
    _$horarioSelecionadoAtom.reportRead();
    return super.horarioSelecionado;
  }

  @override
  set horarioSelecionado(DateTime? value) {
    _$horarioSelecionadoAtom.reportWrite(value, super.horarioSelecionado, () {
      super.horarioSelecionado = value;
    });
  }

  late final _$sessoesAtom =
      Atom(name: 'SessaoStoreBase.sessoes', context: context);

  @override
  ObservableList<SessaoModel> get sessoes {
    _$sessoesAtom.reportRead();
    return super.sessoes;
  }

  @override
  set sessoes(ObservableList<SessaoModel> value) {
    _$sessoesAtom.reportWrite(value, super.sessoes, () {
      super.sessoes = value;
    });
  }

  late final _$historyAtom =
      Atom(name: 'SessaoStoreBase.history', context: context);

  @override
  ObservableList<EventoSessaoModel> get history {
    _$historyAtom.reportRead();
    return super.history;
  }

  @override
  set history(ObservableList<EventoSessaoModel> value) {
    _$historyAtom.reportWrite(value, super.history, () {
      super.history = value;
    });
  }

  late final _$sessaoSendoAvaliadaAtom =
      Atom(name: 'SessaoStoreBase.sessaoSendoAvaliada', context: context);

  @override
  EventoSessaoModel? get sessaoSendoAvaliada {
    _$sessaoSendoAvaliadaAtom.reportRead();
    return super.sessaoSendoAvaliada;
  }

  @override
  set sessaoSendoAvaliada(EventoSessaoModel? value) {
    _$sessaoSendoAvaliadaAtom.reportWrite(value, super.sessaoSendoAvaliada, () {
      super.sessaoSendoAvaliada = value;
    });
  }

  late final _$aplicadorAtom =
      Atom(name: 'SessaoStoreBase.aplicador', context: context);

  @override
  AplicadorModel? get aplicador {
    _$aplicadorAtom.reportRead();
    return super.aplicador;
  }

  @override
  set aplicador(AplicadorModel? value) {
    _$aplicadorAtom.reportWrite(value, super.aplicador, () {
      super.aplicador = value;
    });
  }

  late final _$estabelecimentoAtom =
      Atom(name: 'SessaoStoreBase.estabelecimento', context: context);

  @override
  EstabelecimentoModel? get estabelecimento {
    _$estabelecimentoAtom.reportRead();
    return super.estabelecimento;
  }

  @override
  set estabelecimento(EstabelecimentoModel? value) {
    _$estabelecimentoAtom.reportWrite(value, super.estabelecimento, () {
      super.estabelecimento = value;
    });
  }

  late final _$notaSessaoAtom =
      Atom(name: 'SessaoStoreBase.notaSessao', context: context);

  @override
  double? get notaSessao {
    _$notaSessaoAtom.reportRead();
    return super.notaSessao;
  }

  @override
  set notaSessao(double? value) {
    _$notaSessaoAtom.reportWrite(value, super.notaSessao, () {
      super.notaSessao = value;
    });
  }

  late final _$notaEstabelecimentoAtom =
      Atom(name: 'SessaoStoreBase.notaEstabelecimento', context: context);

  @override
  double? get notaEstabelecimento {
    _$notaEstabelecimentoAtom.reportRead();
    return super.notaEstabelecimento;
  }

  @override
  set notaEstabelecimento(double? value) {
    _$notaEstabelecimentoAtom.reportWrite(value, super.notaEstabelecimento, () {
      super.notaEstabelecimento = value;
    });
  }

  late final _$sessaoParaCheckInAtom =
      Atom(name: 'SessaoStoreBase.sessaoParaCheckIn', context: context);

  @override
  EventoSessaoModel? get sessaoParaCheckIn {
    _$sessaoParaCheckInAtom.reportRead();
    return super.sessaoParaCheckIn;
  }

  @override
  set sessaoParaCheckIn(EventoSessaoModel? value) {
    _$sessaoParaCheckInAtom.reportWrite(value, super.sessaoParaCheckIn, () {
      super.sessaoParaCheckIn = value;
    });
  }

  late final _$fotoCheckInAtom =
      Atom(name: 'SessaoStoreBase.fotoCheckIn', context: context);

  @override
  XFile? get fotoCheckIn {
    _$fotoCheckInAtom.reportRead();
    return super.fotoCheckIn;
  }

  @override
  set fotoCheckIn(XFile? value) {
    _$fotoCheckInAtom.reportWrite(value, super.fotoCheckIn, () {
      super.fotoCheckIn = value;
    });
  }

  late final _$areasDisponiveisAtom =
      Atom(name: 'SessaoStoreBase.areasDisponiveis', context: context);

  @override
  ObservableList<SelectableCard<SessionAreaModel>> get areasDisponiveis {
    _$areasDisponiveisAtom.reportRead();
    return super.areasDisponiveis;
  }

  @override
  set areasDisponiveis(ObservableList<SelectableCard<SessionAreaModel>> value) {
    _$areasDisponiveisAtom.reportWrite(value, super.areasDisponiveis, () {
      super.areasDisponiveis = value;
    });
  }

  late final _$atendidoPorAtom =
      Atom(name: 'SessaoStoreBase.atendidoPor', context: context);

  @override
  AplicadorModel? get atendidoPor {
    _$atendidoPorAtom.reportRead();
    return super.atendidoPor;
  }

  @override
  set atendidoPor(AplicadorModel? value) {
    _$atendidoPorAtom.reportWrite(value, super.atendidoPor, () {
      super.atendidoPor = value;
    });
  }

  late final _$initAgendamentoAsyncAction =
      AsyncAction('SessaoStoreBase.initAgendamento', context: context);

  @override
  Future<void> initAgendamento() {
    return _$initAgendamentoAsyncAction.run(() => super.initAgendamento());
  }

  late final _$getComandasAsyncAction =
      AsyncAction('SessaoStoreBase.getComandas', context: context);

  @override
  Future<void> getComandas() {
    return _$getComandasAsyncAction.run(() => super.getComandas());
  }

  late final _$buscarHorariosAsyncAction =
      AsyncAction('SessaoStoreBase.buscarHorarios', context: context);

  @override
  Future<BaseModel<HorariosDisponiveisComOpcoesModel>> buscarHorarios() {
    return _$buscarHorariosAsyncAction.run(() => super.buscarHorarios());
  }

  late final _$salvarAgendamentoAsyncAction =
      AsyncAction('SessaoStoreBase.salvarAgendamento', context: context);

  @override
  Future<BaseModel<EmptyResponseModel>> salvarAgendamento() {
    return _$salvarAgendamentoAsyncAction.run(() => super.salvarAgendamento());
  }

  late final _$initHistoryAsyncAction =
      AsyncAction('SessaoStoreBase.initHistory', context: context);

  @override
  Future<void> initHistory() {
    return _$initHistoryAsyncAction.run(() => super.initHistory());
  }

  late final _$getHistoryAsyncAction =
      AsyncAction('SessaoStoreBase.getHistory', context: context);

  @override
  Future<void> getHistory() {
    return _$getHistoryAsyncAction.run(() => super.getHistory());
  }

  late final _$confirmarAgendamentoAsyncAction =
      AsyncAction('SessaoStoreBase.confirmarAgendamento', context: context);

  @override
  Future<BaseModel<EmptyResponseModel>> confirmarAgendamento(
      EventoSessaoModel evento) {
    return _$confirmarAgendamentoAsyncAction
        .run(() => super.confirmarAgendamento(evento));
  }

  late final _$initAvaliarAsyncAction =
      AsyncAction('SessaoStoreBase.initAvaliar', context: context);

  @override
  Future<void> initAvaliar() {
    return _$initAvaliarAsyncAction.run(() => super.initAvaliar());
  }

  late final _$getAplicadorEEstabelecimentoAsyncAction = AsyncAction(
      'SessaoStoreBase.getAplicadorEEstabelecimento',
      context: context);

  @override
  Future<void> getAplicadorEEstabelecimento() {
    return _$getAplicadorEEstabelecimentoAsyncAction
        .run(() => super.getAplicadorEEstabelecimento());
  }

  late final _$avaliarAsyncAction =
      AsyncAction('SessaoStoreBase.avaliar', context: context);

  @override
  Future<bool> avaliar() {
    return _$avaliarAsyncAction.run(() => super.avaliar());
  }

  late final _$initCheckInAsyncAction =
      AsyncAction('SessaoStoreBase.initCheckIn', context: context);

  @override
  Future<void> initCheckIn() {
    return _$initCheckInAsyncAction.run(() => super.initCheckIn());
  }

  late final _$buscarSessaoAsyncAction =
      AsyncAction('SessaoStoreBase.buscarSessao', context: context);

  @override
  Future<bool> buscarSessao() {
    return _$buscarSessaoAsyncAction.run(() => super.buscarSessao());
  }

  late final _$getAreasDisponiveisAsyncAction =
      AsyncAction('SessaoStoreBase.getAreasDisponiveis', context: context);

  @override
  Future<void> getAreasDisponiveis() {
    return _$getAreasDisponiveisAsyncAction
        .run(() => super.getAreasDisponiveis());
  }

  late final _$fazerCheckInAsyncAction =
      AsyncAction('SessaoStoreBase.fazerCheckIn', context: context);

  @override
  Future<bool> fazerCheckIn() {
    return _$fazerCheckInAsyncAction.run(() => super.fazerCheckIn());
  }

  late final _$SessaoStoreBaseActionController =
      ActionController(name: 'SessaoStoreBase', context: context);

  @override
  void setSessaoSendoReagendada(ExcluirSessaoModel? s) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.setSessaoSendoReagendada');
    try {
      return super.setSessaoSendoReagendada(s);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setComandaSelecionada(ComandaModel? c) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.setComandaSelecionada');
    try {
      return super.setComandaSelecionada(c);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStartDate(DateTime date) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.setStartDate');
    try {
      return super.setStartDate(date);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEndDate(DateTime date) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.setEndDate');
    try {
      return super.setEndDate(date);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetDates() {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.resetDates');
    try {
      return super.resetDates();
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementDuracaoSessao(int d) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.incrementDuracaoSessao');
    try {
      return super.incrementDuracaoSessao(d);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementDuracaoSessao(int d) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.decrementDuracaoSessao');
    try {
      return super.decrementDuracaoSessao(d);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectComanda(ComandaModel c) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.selectComanda');
    try {
      return super.selectComanda(c);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void unselectComanda(ComandaModel c) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.unselectComanda');
    try {
      return super.unselectComanda(c);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void limparHorarios() {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.limparHorarios');
    try {
      return super.limparHorarios();
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHorariosDisponiveis(HorariosDisponiveisComOpcoesModel d) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.setHorariosDisponiveis');
    try {
      return super.setHorariosDisponiveis(d);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void limparHorariosDisponiveis() {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.limparHorariosDisponiveis');
    try {
      return super.limparHorariosDisponiveis();
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selecionarHorario(DateTime d) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.selecionarHorario');
    try {
      return super.selecionarHorario(d);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void desselecionarHorario() {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.desselecionarHorario');
    try {
      return super.desselecionarHorario();
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetDuracaoSessao() {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.resetDuracaoSessao');
    try {
      return super.resetDuracaoSessao();
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetAgendamento() {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.resetAgendamento');
    try {
      return super.resetAgendamento();
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void mudarStatusEventoSessao(EventoSessaoModel evento, String status) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.mudarStatusEventoSessao');
    try {
      return super.mudarStatusEventoSessao(evento, status);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetHistory() {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.resetHistory');
    try {
      return super.resetHistory();
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSessaoSendoAvaliada(EventoSessaoModel? s) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.setSessaoSendoAvaliada');
    try {
      return super.setSessaoSendoAvaliada(s);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNotaSessao(double? d) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.setNotaSessao');
    try {
      return super.setNotaSessao(d);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNotaEstabelecimento(double? d) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.setNotaEstabelecimento');
    try {
      return super.setNotaEstabelecimento(d);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetAvaliar() {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.resetAvaliar');
    try {
      return super.resetAvaliar();
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSessaoParaCheckIn(EventoSessaoModel? s) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.setSessaoParaCheckIn');
    try {
      return super.setSessaoParaCheckIn(s);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setfotoCheckIn(XFile? b) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.setfotoCheckIn');
    try {
      return super.setfotoCheckIn(b);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selecionarAreasDaSessao(SessionAreaModel session) {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.selecionarAreasDaSessao');
    try {
      return super.selecionarAreasDaSessao(session);
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetCheckIn() {
    final _$actionInfo = _$SessaoStoreBaseActionController.startAction(
        name: 'SessaoStoreBase.resetCheckIn');
    try {
      return super.resetCheckIn();
    } finally {
      _$SessaoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sessaoSendoReagendada: ${sessaoSendoReagendada},
comandas: ${comandas},
comandaSelecionada: ${comandaSelecionada},
startDate: ${startDate},
endDate: ${endDate},
duracaoSessao: ${duracaoSessao},
horariosDisponiveis: ${horariosDisponiveis},
horariosDisplay: ${horariosDisplay},
horarioSelecionado: ${horarioSelecionado},
sessoes: ${sessoes},
history: ${history},
sessaoSendoAvaliada: ${sessaoSendoAvaliada},
aplicador: ${aplicador},
estabelecimento: ${estabelecimento},
notaSessao: ${notaSessao},
notaEstabelecimento: ${notaEstabelecimento},
sessaoParaCheckIn: ${sessaoParaCheckIn},
fotoCheckIn: ${fotoCheckIn},
areasDisponiveis: ${areasDisponiveis},
atendidoPor: ${atendidoPor},
podeBuscarHorarios: ${podeBuscarHorarios}
    ''';
  }
}
