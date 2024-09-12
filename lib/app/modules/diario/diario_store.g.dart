// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diario_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DiarioStore on DiarioStoreBase, Store {
  late final _$viuIntroAtom =
      Atom(name: 'DiarioStoreBase.viuIntro', context: context);

  @override
  bool get viuIntro {
    _$viuIntroAtom.reportRead();
    return super.viuIntro;
  }

  @override
  set viuIntro(bool value) {
    _$viuIntroAtom.reportWrite(value, super.viuIntro, () {
      super.viuIntro = value;
    });
  }

  late final _$etapaAtom =
      Atom(name: 'DiarioStoreBase.etapa', context: context);

  @override
  int get etapa {
    _$etapaAtom.reportRead();
    return super.etapa;
  }

  @override
  set etapa(int value) {
    _$etapaAtom.reportWrite(value, super.etapa, () {
      super.etapa = value;
    });
  }

  late final _$fotoPSAtom =
      Atom(name: 'DiarioStoreBase.fotoPS', context: context);

  @override
  XFile? get fotoPS {
    _$fotoPSAtom.reportRead();
    return super.fotoPS;
  }

  @override
  set fotoPS(XFile? value) {
    _$fotoPSAtom.reportWrite(value, super.fotoPS, () {
      super.fotoPS = value;
    });
  }

  late final _$relatoPSAtom =
      Atom(name: 'DiarioStoreBase.relatoPS', context: context);

  @override
  String get relatoPS {
    _$relatoPSAtom.reportRead();
    return super.relatoPS;
  }

  @override
  set relatoPS(String value) {
    _$relatoPSAtom.reportWrite(value, super.relatoPS, () {
      super.relatoPS = value;
    });
  }

  late final _$tomandoMedicamentoPSAtom =
      Atom(name: 'DiarioStoreBase.tomandoMedicamentoPS', context: context);

  @override
  bool? get tomandoMedicamentoPS {
    _$tomandoMedicamentoPSAtom.reportRead();
    return super.tomandoMedicamentoPS;
  }

  @override
  set tomandoMedicamentoPS(bool? value) {
    _$tomandoMedicamentoPSAtom.reportWrite(value, super.tomandoMedicamentoPS,
        () {
      super.tomandoMedicamentoPS = value;
    });
  }

  late final _$qualMedicamentoPSAtom =
      Atom(name: 'DiarioStoreBase.qualMedicamentoPS', context: context);

  @override
  String? get qualMedicamentoPS {
    _$qualMedicamentoPSAtom.reportRead();
    return super.qualMedicamentoPS;
  }

  @override
  set qualMedicamentoPS(String? value) {
    _$qualMedicamentoPSAtom.reportWrite(value, super.qualMedicamentoPS, () {
      super.qualMedicamentoPS = value;
    });
  }

  late final _$tomouNosUltimosSeteDiasPSAtom =
      Atom(name: 'DiarioStoreBase.tomouNosUltimosSeteDiasPS', context: context);

  @override
  bool? get tomouNosUltimosSeteDiasPS {
    _$tomouNosUltimosSeteDiasPSAtom.reportRead();
    return super.tomouNosUltimosSeteDiasPS;
  }

  @override
  set tomouNosUltimosSeteDiasPS(bool? value) {
    _$tomouNosUltimosSeteDiasPSAtom
        .reportWrite(value, super.tomouNosUltimosSeteDiasPS, () {
      super.tomouNosUltimosSeteDiasPS = value;
    });
  }

  late final _$parametrosPSAtom =
      Atom(name: 'DiarioStoreBase.parametrosPS', context: context);

  @override
  String get parametrosPS {
    _$parametrosPSAtom.reportRead();
    return super.parametrosPS;
  }

  @override
  set parametrosPS(String value) {
    _$parametrosPSAtom.reportWrite(value, super.parametrosPS, () {
      super.parametrosPS = value;
    });
  }

  late final _$tecnicasPSAtom =
      Atom(name: 'DiarioStoreBase.tecnicasPS', context: context);

  @override
  String get tecnicasPS {
    _$tecnicasPSAtom.reportRead();
    return super.tecnicasPS;
  }

  @override
  set tecnicasPS(String value) {
    _$tecnicasPSAtom.reportWrite(value, super.tecnicasPS, () {
      super.tecnicasPS = value;
    });
  }

  late final _$proxSessaoAgendadaPSAtom =
      Atom(name: 'DiarioStoreBase.proxSessaoAgendadaPS', context: context);

  @override
  String get proxSessaoAgendadaPS {
    _$proxSessaoAgendadaPSAtom.reportRead();
    return super.proxSessaoAgendadaPS;
  }

  @override
  set proxSessaoAgendadaPS(String value) {
    _$proxSessaoAgendadaPSAtom.reportWrite(value, super.proxSessaoAgendadaPS,
        () {
      super.proxSessaoAgendadaPS = value;
    });
  }

  late final _$initDiarioAsyncAction =
      AsyncAction('DiarioStoreBase.initDiario', context: context);

  @override
  Future<void> initDiario() {
    return _$initDiarioAsyncAction.run(() => super.initDiario());
  }

  late final _$initPrimeiraSessaoAsyncAction =
      AsyncAction('DiarioStoreBase.initPrimeiraSessao', context: context);

  @override
  Future<void> initPrimeiraSessao() {
    return _$initPrimeiraSessaoAsyncAction
        .run(() => super.initPrimeiraSessao());
  }

  late final _$postPSAsyncAction =
      AsyncAction('DiarioStoreBase.postPS', context: context);

  @override
  Future<bool> postPS() {
    return _$postPSAsyncAction.run(() => super.postPS());
  }

  late final _$DiarioStoreBaseActionController =
      ActionController(name: 'DiarioStoreBase', context: context);

  @override
  void verIntro() {
    final _$actionInfo = _$DiarioStoreBaseActionController.startAction(
        name: 'DiarioStoreBase.verIntro');
    try {
      return super.verIntro();
    } finally {
      _$DiarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEtapa(int e) {
    final _$actionInfo = _$DiarioStoreBaseActionController.startAction(
        name: 'DiarioStoreBase.setEtapa');
    try {
      return super.setEtapa(e);
    } finally {
      _$DiarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetDiario() {
    final _$actionInfo = _$DiarioStoreBaseActionController.startAction(
        name: 'DiarioStoreBase.resetDiario');
    try {
      return super.resetDiario();
    } finally {
      _$DiarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFotoPS(XFile? f) {
    final _$actionInfo = _$DiarioStoreBaseActionController.startAction(
        name: 'DiarioStoreBase.setFotoPS');
    try {
      return super.setFotoPS(f);
    } finally {
      _$DiarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRelatoPS(String s) {
    final _$actionInfo = _$DiarioStoreBaseActionController.startAction(
        name: 'DiarioStoreBase.setRelatoPS');
    try {
      return super.setRelatoPS(s);
    } finally {
      _$DiarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTomandoMedicamentoPS(bool? b) {
    final _$actionInfo = _$DiarioStoreBaseActionController.startAction(
        name: 'DiarioStoreBase.setTomandoMedicamentoPS');
    try {
      return super.setTomandoMedicamentoPS(b);
    } finally {
      _$DiarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQualMedicamentoPS(String? s) {
    final _$actionInfo = _$DiarioStoreBaseActionController.startAction(
        name: 'DiarioStoreBase.setQualMedicamentoPS');
    try {
      return super.setQualMedicamentoPS(s);
    } finally {
      _$DiarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTomouNosUltimosSeteDiasPS(bool? b) {
    final _$actionInfo = _$DiarioStoreBaseActionController.startAction(
        name: 'DiarioStoreBase.setTomouNosUltimosSeteDiasPS');
    try {
      return super.setTomouNosUltimosSeteDiasPS(b);
    } finally {
      _$DiarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setParametrosPS(String s) {
    final _$actionInfo = _$DiarioStoreBaseActionController.startAction(
        name: 'DiarioStoreBase.setParametrosPS');
    try {
      return super.setParametrosPS(s);
    } finally {
      _$DiarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTecnicasPS(String s) {
    final _$actionInfo = _$DiarioStoreBaseActionController.startAction(
        name: 'DiarioStoreBase.setTecnicasPS');
    try {
      return super.setTecnicasPS(s);
    } finally {
      _$DiarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProxSessaoAgendadaPS(String s) {
    final _$actionInfo = _$DiarioStoreBaseActionController.startAction(
        name: 'DiarioStoreBase.setProxSessaoAgendadaPS');
    try {
      return super.setProxSessaoAgendadaPS(s);
    } finally {
      _$DiarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetPrimeiraSessao() {
    final _$actionInfo = _$DiarioStoreBaseActionController.startAction(
        name: 'DiarioStoreBase.resetPrimeiraSessao');
    try {
      return super.resetPrimeiraSessao();
    } finally {
      _$DiarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
viuIntro: ${viuIntro},
etapa: ${etapa},
fotoPS: ${fotoPS},
relatoPS: ${relatoPS},
tomandoMedicamentoPS: ${tomandoMedicamentoPS},
qualMedicamentoPS: ${qualMedicamentoPS},
tomouNosUltimosSeteDiasPS: ${tomouNosUltimosSeteDiasPS},
parametrosPS: ${parametrosPS},
tecnicasPS: ${tecnicasPS},
proxSessaoAgendadaPS: ${proxSessaoAgendadaPS}
    ''';
  }
}
