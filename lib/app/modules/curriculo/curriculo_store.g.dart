// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curriculo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CurriculoStore on CurriculoStoreBase, Store {
  late final _$curriculoModelAtom =
      Atom(name: 'CurriculoStoreBase.curriculoModel', context: context);

  @override
  CurriculoModel? get curriculoModel {
    _$curriculoModelAtom.reportRead();
    return super.curriculoModel;
  }

  @override
  set curriculoModel(CurriculoModel? value) {
    _$curriculoModelAtom.reportWrite(value, super.curriculoModel, () {
      super.curriculoModel = value;
    });
  }

  late final _$audioAtom =
      Atom(name: 'CurriculoStoreBase.audio', context: context);

  @override
  File? get audio {
    _$audioAtom.reportRead();
    return super.audio;
  }

  @override
  set audio(File? value) {
    _$audioAtom.reportWrite(value, super.audio, () {
      super.audio = value;
    });
  }

  late final _$nomeAtom =
      Atom(name: 'CurriculoStoreBase.nome', context: context);

  @override
  String? get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String? value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'CurriculoStoreBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$telefoneAtom =
      Atom(name: 'CurriculoStoreBase.telefone', context: context);

  @override
  String? get telefone {
    _$telefoneAtom.reportRead();
    return super.telefone;
  }

  @override
  set telefone(String? value) {
    _$telefoneAtom.reportWrite(value, super.telefone, () {
      super.telefone = value;
    });
  }

  late final _$resumoAtom =
      Atom(name: 'CurriculoStoreBase.resumo', context: context);

  @override
  String? get resumo {
    _$resumoAtom.reportRead();
    return super.resumo;
  }

  @override
  set resumo(String? value) {
    _$resumoAtom.reportWrite(value, super.resumo, () {
      super.resumo = value;
    });
  }

  late final _$habilidadeAtom =
      Atom(name: 'CurriculoStoreBase.habilidade', context: context);

  @override
  String? get habilidade {
    _$habilidadeAtom.reportRead();
    return super.habilidade;
  }

  @override
  set habilidade(String? value) {
    _$habilidadeAtom.reportWrite(value, super.habilidade, () {
      super.habilidade = value;
    });
  }

  late final _$selectedModeloAtom =
      Atom(name: 'CurriculoStoreBase.selectedModelo', context: context);

  @override
  int? get selectedModelo {
    _$selectedModeloAtom.reportRead();
    return super.selectedModelo;
  }

  @override
  set selectedModelo(int? value) {
    _$selectedModeloAtom.reportWrite(value, super.selectedModelo, () {
      super.selectedModelo = value;
    });
  }

  late final _$skillsCodeModelo1Atom =
      Atom(name: 'CurriculoStoreBase.skillsCodeModelo1', context: context);

  @override
  String? get skillsCodeModelo1 {
    _$skillsCodeModelo1Atom.reportRead();
    return super.skillsCodeModelo1;
  }

  @override
  set skillsCodeModelo1(String? value) {
    _$skillsCodeModelo1Atom.reportWrite(value, super.skillsCodeModelo1, () {
      super.skillsCodeModelo1 = value;
    });
  }

  late final _$buttonDisplayedAtom =
      Atom(name: 'CurriculoStoreBase.buttonDisplayed', context: context);

  @override
  bool get buttonDisplayed {
    _$buttonDisplayedAtom.reportRead();
    return super.buttonDisplayed;
  }

  @override
  set buttonDisplayed(bool value) {
    _$buttonDisplayedAtom.reportWrite(value, super.buttonDisplayed, () {
      super.buttonDisplayed = value;
    });
  }

  late final _$createdPageUrlAtom =
      Atom(name: 'CurriculoStoreBase.createdPageUrl', context: context);

  @override
  String? get createdPageUrl {
    _$createdPageUrlAtom.reportRead();
    return super.createdPageUrl;
  }

  @override
  set createdPageUrl(String? value) {
    _$createdPageUrlAtom.reportWrite(value, super.createdPageUrl, () {
      super.createdPageUrl = value;
    });
  }

  late final _$listaModelosAtom =
      Atom(name: 'CurriculoStoreBase.listaModelos', context: context);

  @override
  ObservableList<dynamic> get listaModelos {
    _$listaModelosAtom.reportRead();
    return super.listaModelos;
  }

  @override
  set listaModelos(ObservableList<dynamic> value) {
    _$listaModelosAtom.reportWrite(value, super.listaModelos, () {
      super.listaModelos = value;
    });
  }

  late final _$handleAudioAsyncAction =
      AsyncAction('CurriculoStoreBase.handleAudio', context: context);

  @override
  Future handleAudio(File? audio) {
    return _$handleAudioAsyncAction.run(() => super.handleAudio(audio));
  }

  late final _$criarCurriculoAsyncAction =
      AsyncAction('CurriculoStoreBase.criarCurriculo', context: context);

  @override
  Future criarCurriculo() {
    return _$criarCurriculoAsyncAction.run(() => super.criarCurriculo());
  }

  late final _$CurriculoStoreBaseActionController =
      ActionController(name: 'CurriculoStoreBase', context: context);

  @override
  dynamic setNome(dynamic value) {
    final _$actionInfo = _$CurriculoStoreBaseActionController.startAction(
        name: 'CurriculoStoreBase.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$CurriculoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(dynamic value) {
    final _$actionInfo = _$CurriculoStoreBaseActionController.startAction(
        name: 'CurriculoStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$CurriculoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTelefone(dynamic value) {
    final _$actionInfo = _$CurriculoStoreBaseActionController.startAction(
        name: 'CurriculoStoreBase.setTelefone');
    try {
      return super.setTelefone(value);
    } finally {
      _$CurriculoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setResumo(dynamic value) {
    final _$actionInfo = _$CurriculoStoreBaseActionController.startAction(
        name: 'CurriculoStoreBase.setResumo');
    try {
      return super.setResumo(value);
    } finally {
      _$CurriculoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setHabilidade(dynamic value) {
    final _$actionInfo = _$CurriculoStoreBaseActionController.startAction(
        name: 'CurriculoStoreBase.setHabilidade');
    try {
      return super.setHabilidade(value);
    } finally {
      _$CurriculoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAudio(dynamic value) {
    final _$actionInfo = _$CurriculoStoreBaseActionController.startAction(
        name: 'CurriculoStoreBase.setAudio');
    try {
      return super.setAudio(value);
    } finally {
      _$CurriculoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedModelo(dynamic value) {
    final _$actionInfo = _$CurriculoStoreBaseActionController.startAction(
        name: 'CurriculoStoreBase.setSelectedModelo');
    try {
      return super.setSelectedModelo(value);
    } finally {
      _$CurriculoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteHabilidade(dynamic value) {
    final _$actionInfo = _$CurriculoStoreBaseActionController.startAction(
        name: 'CurriculoStoreBase.deleteHabilidade');
    try {
      return super.deleteHabilidade(value);
    } finally {
      _$CurriculoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addHabilidade(dynamic value) {
    final _$actionInfo = _$CurriculoStoreBaseActionController.startAction(
        name: 'CurriculoStoreBase.addHabilidade');
    try {
      return super.addHabilidade(value);
    } finally {
      _$CurriculoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setModeloSelecionado(dynamic index) {
    final _$actionInfo = _$CurriculoStoreBaseActionController.startAction(
        name: 'CurriculoStoreBase.setModeloSelecionado');
    try {
      return super.setModeloSelecionado(index);
    } finally {
      _$CurriculoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
curriculoModel: ${curriculoModel},
audio: ${audio},
nome: ${nome},
email: ${email},
telefone: ${telefone},
resumo: ${resumo},
habilidade: ${habilidade},
selectedModelo: ${selectedModelo},
skillsCodeModelo1: ${skillsCodeModelo1},
buttonDisplayed: ${buttonDisplayed},
createdPageUrl: ${createdPageUrl},
listaModelos: ${listaModelos}
    ''';
  }
}
