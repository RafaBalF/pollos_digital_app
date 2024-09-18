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

  late final _$selectedColor1Atom =
      Atom(name: 'CurriculoStoreBase.selectedColor1', context: context);

  @override
  Color get selectedColor1 {
    _$selectedColor1Atom.reportRead();
    return super.selectedColor1;
  }

  @override
  set selectedColor1(Color value) {
    _$selectedColor1Atom.reportWrite(value, super.selectedColor1, () {
      super.selectedColor1 = value;
    });
  }

  late final _$selectedWidth1Atom =
      Atom(name: 'CurriculoStoreBase.selectedWidth1', context: context);

  @override
  double get selectedWidth1 {
    _$selectedWidth1Atom.reportRead();
    return super.selectedWidth1;
  }

  @override
  set selectedWidth1(double value) {
    _$selectedWidth1Atom.reportWrite(value, super.selectedWidth1, () {
      super.selectedWidth1 = value;
    });
  }

  late final _$selectedColor2Atom =
      Atom(name: 'CurriculoStoreBase.selectedColor2', context: context);

  @override
  Color get selectedColor2 {
    _$selectedColor2Atom.reportRead();
    return super.selectedColor2;
  }

  @override
  set selectedColor2(Color value) {
    _$selectedColor2Atom.reportWrite(value, super.selectedColor2, () {
      super.selectedColor2 = value;
    });
  }

  late final _$selectedWidth2Atom =
      Atom(name: 'CurriculoStoreBase.selectedWidth2', context: context);

  @override
  double get selectedWidth2 {
    _$selectedWidth2Atom.reportRead();
    return super.selectedWidth2;
  }

  @override
  set selectedWidth2(double value) {
    _$selectedWidth2Atom.reportWrite(value, super.selectedWidth2, () {
      super.selectedWidth2 = value;
    });
  }

  late final _$selectedColor3Atom =
      Atom(name: 'CurriculoStoreBase.selectedColor3', context: context);

  @override
  Color get selectedColor3 {
    _$selectedColor3Atom.reportRead();
    return super.selectedColor3;
  }

  @override
  set selectedColor3(Color value) {
    _$selectedColor3Atom.reportWrite(value, super.selectedColor3, () {
      super.selectedColor3 = value;
    });
  }

  late final _$selectedWidth3Atom =
      Atom(name: 'CurriculoStoreBase.selectedWidth3', context: context);

  @override
  double get selectedWidth3 {
    _$selectedWidth3Atom.reportRead();
    return super.selectedWidth3;
  }

  @override
  set selectedWidth3(double value) {
    _$selectedWidth3Atom.reportWrite(value, super.selectedWidth3, () {
      super.selectedWidth3 = value;
    });
  }

  late final _$handleAudioAsyncAction =
      AsyncAction('CurriculoStoreBase.handleAudio', context: context);

  @override
  Future handleAudio(File? audio) {
    return _$handleAudioAsyncAction.run(() => super.handleAudio(audio));
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
  dynamic setSelectedModelo1() {
    final _$actionInfo = _$CurriculoStoreBaseActionController.startAction(
        name: 'CurriculoStoreBase.setSelectedModelo1');
    try {
      return super.setSelectedModelo1();
    } finally {
      _$CurriculoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedModelo2() {
    final _$actionInfo = _$CurriculoStoreBaseActionController.startAction(
        name: 'CurriculoStoreBase.setSelectedModelo2');
    try {
      return super.setSelectedModelo2();
    } finally {
      _$CurriculoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedModelo3() {
    final _$actionInfo = _$CurriculoStoreBaseActionController.startAction(
        name: 'CurriculoStoreBase.setSelectedModelo3');
    try {
      return super.setSelectedModelo3();
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
selectedColor1: ${selectedColor1},
selectedWidth1: ${selectedWidth1},
selectedColor2: ${selectedColor2},
selectedWidth2: ${selectedWidth2},
selectedColor3: ${selectedColor3},
selectedWidth3: ${selectedWidth3}
    ''';
  }
}
