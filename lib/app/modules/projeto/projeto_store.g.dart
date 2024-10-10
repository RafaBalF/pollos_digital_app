// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projeto_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProjetoStore on ProjetoStoreBase, Store {
  late final _$projetoModelAtom =
      Atom(name: 'ProjetoStoreBase.projetoModel', context: context);

  @override
  ProjetoModel? get projetoModel {
    _$projetoModelAtom.reportRead();
    return super.projetoModel;
  }

  @override
  set projetoModel(ProjetoModel? value) {
    _$projetoModelAtom.reportWrite(value, super.projetoModel, () {
      super.projetoModel = value;
    });
  }

  late final _$buttonEnabilitiyAtom =
      Atom(name: 'ProjetoStoreBase.buttonEnabilitiy', context: context);

  @override
  bool get buttonEnabilitiy {
    _$buttonEnabilitiyAtom.reportRead();
    return super.buttonEnabilitiy;
  }

  @override
  set buttonEnabilitiy(bool value) {
    _$buttonEnabilitiyAtom.reportWrite(value, super.buttonEnabilitiy, () {
      super.buttonEnabilitiy = value;
    });
  }

  late final _$audioAtom =
      Atom(name: 'ProjetoStoreBase.audio', context: context);

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

  late final _$habilidadeAtom =
      Atom(name: 'ProjetoStoreBase.habilidade', context: context);

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

  late final _$extraDescricaoAtom =
      Atom(name: 'ProjetoStoreBase.extraDescricao', context: context);

  @override
  String? get extraDescricao {
    _$extraDescricaoAtom.reportRead();
    return super.extraDescricao;
  }

  @override
  set extraDescricao(String? value) {
    _$extraDescricaoAtom.reportWrite(value, super.extraDescricao, () {
      super.extraDescricao = value;
    });
  }

  late final _$extraValorAtom =
      Atom(name: 'ProjetoStoreBase.extraValor', context: context);

  @override
  String? get extraValor {
    _$extraValorAtom.reportRead();
    return super.extraValor;
  }

  @override
  set extraValor(String? value) {
    _$extraValorAtom.reportWrite(value, super.extraValor, () {
      super.extraValor = value;
    });
  }

  late final _$selectedModeloAtom =
      Atom(name: 'ProjetoStoreBase.selectedModelo', context: context);

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
      Atom(name: 'ProjetoStoreBase.skillsCodeModelo1', context: context);

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
      Atom(name: 'ProjetoStoreBase.buttonDisplayed', context: context);

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
      Atom(name: 'ProjetoStoreBase.createdPageUrl', context: context);

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

  late final _$imageAtom =
      Atom(name: 'ProjetoStoreBase.image', context: context);

  @override
  XFile? get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(XFile? value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$listaModelosAtom =
      Atom(name: 'ProjetoStoreBase.listaModelos', context: context);

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

  late final _$listaProjetosAtom =
      Atom(name: 'ProjetoStoreBase.listaProjetos', context: context);

  @override
  ObservableList<dynamic> get listaProjetos {
    _$listaProjetosAtom.reportRead();
    return super.listaProjetos;
  }

  @override
  set listaProjetos(ObservableList<dynamic> value) {
    _$listaProjetosAtom.reportWrite(value, super.listaProjetos, () {
      super.listaProjetos = value;
    });
  }

  late final _$handleAudioAsyncAction =
      AsyncAction('ProjetoStoreBase.handleAudio', context: context);

  @override
  Future handleAudio(File? audio) {
    return _$handleAudioAsyncAction.run(() => super.handleAudio(audio));
  }

  late final _$criarProjetoAsyncAction =
      AsyncAction('ProjetoStoreBase.criarProjeto', context: context);

  @override
  Future criarProjeto() {
    return _$criarProjetoAsyncAction.run(() => super.criarProjeto());
  }

  late final _$carregarModelosAsyncAction =
      AsyncAction('ProjetoStoreBase.carregarModelos', context: context);

  @override
  Future carregarModelos() {
    return _$carregarModelosAsyncAction.run(() => super.carregarModelos());
  }

  late final _$carregarProjetosCriadosAsyncAction =
      AsyncAction('ProjetoStoreBase.carregarProjetosCriados', context: context);

  @override
  Future carregarProjetosCriados() {
    return _$carregarProjetosCriadosAsyncAction
        .run(() => super.carregarProjetosCriados());
  }

  late final _$excluirProjetoAsyncAction =
      AsyncAction('ProjetoStoreBase.excluirProjeto', context: context);

  @override
  Future excluirProjeto(dynamic projetoId) {
    return _$excluirProjetoAsyncAction
        .run(() => super.excluirProjeto(projetoId));
  }

  late final _$initProjetosCriadoAsyncAction =
      AsyncAction('ProjetoStoreBase.initProjetosCriado', context: context);

  @override
  Future<void> initProjetosCriado() {
    return _$initProjetosCriadoAsyncAction
        .run(() => super.initProjetosCriado());
  }

  late final _$initProjetosModeloAsyncAction =
      AsyncAction('ProjetoStoreBase.initProjetosModelo', context: context);

  @override
  Future<void> initProjetosModelo() {
    return _$initProjetosModeloAsyncAction
        .run(() => super.initProjetosModelo());
  }

  late final _$ProjetoStoreBaseActionController =
      ActionController(name: 'ProjetoStoreBase', context: context);

  @override
  dynamic setButtonEnabilitiy() {
    final _$actionInfo = _$ProjetoStoreBaseActionController.startAction(
        name: 'ProjetoStoreBase.setButtonEnabilitiy');
    try {
      return super.setButtonEnabilitiy();
    } finally {
      _$ProjetoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNome(dynamic value) {
    final _$actionInfo = _$ProjetoStoreBaseActionController.startAction(
        name: 'ProjetoStoreBase.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$ProjetoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNomePagina(dynamic value) {
    final _$actionInfo = _$ProjetoStoreBaseActionController.startAction(
        name: 'ProjetoStoreBase.setNomePagina');
    try {
      return super.setNomePagina(value);
    } finally {
      _$ProjetoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(dynamic value) {
    final _$actionInfo = _$ProjetoStoreBaseActionController.startAction(
        name: 'ProjetoStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$ProjetoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTelefone(dynamic value) {
    final _$actionInfo = _$ProjetoStoreBaseActionController.startAction(
        name: 'ProjetoStoreBase.setTelefone');
    try {
      return super.setTelefone(value);
    } finally {
      _$ProjetoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescricao(dynamic value) {
    final _$actionInfo = _$ProjetoStoreBaseActionController.startAction(
        name: 'ProjetoStoreBase.setDescricao');
    try {
      return super.setDescricao(value);
    } finally {
      _$ProjetoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMissao(dynamic value) {
    final _$actionInfo = _$ProjetoStoreBaseActionController.startAction(
        name: 'ProjetoStoreBase.setMissao');
    try {
      return super.setMissao(value);
    } finally {
      _$ProjetoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setVisao(dynamic value) {
    final _$actionInfo = _$ProjetoStoreBaseActionController.startAction(
        name: 'ProjetoStoreBase.setVisao');
    try {
      return super.setVisao(value);
    } finally {
      _$ProjetoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setValores(dynamic value) {
    final _$actionInfo = _$ProjetoStoreBaseActionController.startAction(
        name: 'ProjetoStoreBase.setValores');
    try {
      return super.setValores(value);
    } finally {
      _$ProjetoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAudio(dynamic value) {
    final _$actionInfo = _$ProjetoStoreBaseActionController.startAction(
        name: 'ProjetoStoreBase.setAudio');
    try {
      return super.setAudio(value);
    } finally {
      _$ProjetoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setHabilidade(dynamic value) {
    final _$actionInfo = _$ProjetoStoreBaseActionController.startAction(
        name: 'ProjetoStoreBase.setHabilidade');
    try {
      return super.setHabilidade(value);
    } finally {
      _$ProjetoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setExtraDescricao(dynamic value) {
    final _$actionInfo = _$ProjetoStoreBaseActionController.startAction(
        name: 'ProjetoStoreBase.setExtraDescricao');
    try {
      return super.setExtraDescricao(value);
    } finally {
      _$ProjetoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setExtraValor(dynamic value) {
    final _$actionInfo = _$ProjetoStoreBaseActionController.startAction(
        name: 'ProjetoStoreBase.setExtraValor');
    try {
      return super.setExtraValor(value);
    } finally {
      _$ProjetoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedModelo(dynamic value) {
    final _$actionInfo = _$ProjetoStoreBaseActionController.startAction(
        name: 'ProjetoStoreBase.setSelectedModelo');
    try {
      return super.setSelectedModelo(value);
    } finally {
      _$ProjetoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addFile(dynamic value) {
    final _$actionInfo = _$ProjetoStoreBaseActionController.startAction(
        name: 'ProjetoStoreBase.addFile');
    try {
      return super.addFile(value);
    } finally {
      _$ProjetoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteFile() {
    final _$actionInfo = _$ProjetoStoreBaseActionController.startAction(
        name: 'ProjetoStoreBase.deleteFile');
    try {
      return super.deleteFile();
    } finally {
      _$ProjetoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteHabilidade(dynamic value) {
    final _$actionInfo = _$ProjetoStoreBaseActionController.startAction(
        name: 'ProjetoStoreBase.deleteHabilidade');
    try {
      return super.deleteHabilidade(value);
    } finally {
      _$ProjetoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addHabilidade(dynamic value) {
    final _$actionInfo = _$ProjetoStoreBaseActionController.startAction(
        name: 'ProjetoStoreBase.addHabilidade');
    try {
      return super.addHabilidade(value);
    } finally {
      _$ProjetoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteExtra(dynamic value) {
    final _$actionInfo = _$ProjetoStoreBaseActionController.startAction(
        name: 'ProjetoStoreBase.deleteExtra');
    try {
      return super.deleteExtra(value);
    } finally {
      _$ProjetoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addExtra(dynamic descricao, dynamic valor) {
    final _$actionInfo = _$ProjetoStoreBaseActionController.startAction(
        name: 'ProjetoStoreBase.addExtra');
    try {
      return super.addExtra(descricao, valor);
    } finally {
      _$ProjetoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setModeloSelecionado(dynamic index) {
    final _$actionInfo = _$ProjetoStoreBaseActionController.startAction(
        name: 'ProjetoStoreBase.setModeloSelecionado');
    try {
      return super.setModeloSelecionado(index);
    } finally {
      _$ProjetoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
projetoModel: ${projetoModel},
buttonEnabilitiy: ${buttonEnabilitiy},
audio: ${audio},
habilidade: ${habilidade},
extraDescricao: ${extraDescricao},
extraValor: ${extraValor},
selectedModelo: ${selectedModelo},
skillsCodeModelo1: ${skillsCodeModelo1},
buttonDisplayed: ${buttonDisplayed},
createdPageUrl: ${createdPageUrl},
image: ${image},
listaModelos: ${listaModelos},
listaProjetos: ${listaProjetos}
    ''';
  }
}
