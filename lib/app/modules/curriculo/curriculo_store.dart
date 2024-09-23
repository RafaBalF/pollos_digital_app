import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:pollos_digital/app/apis/curriculo.api.dart';
import 'package:pollos_digital/app/models/curriculo.model.dart';
import 'package:pollos_digital/app/models/modelos.model.dart';
import 'package:pollos_digital/loading_store.dart';
import 'package:image_picker/image_picker.dart';

part 'curriculo_store.g.dart';

class CurriculoStore = CurriculoStoreBase with _$CurriculoStore;

abstract class CurriculoStoreBase with Store {
  //APIs
  final CurriculoApi _curriculoApi = CurriculoApi();

  //STOREs
  final LoadingStore loadingStore = LoadingStore();

  //OBSERVABLEs
  @observable
  CurriculoModel? curriculoModel = CurriculoModel();

  @observable
  File? audio;

  @observable
  String? habilidade;

  @observable
  String? extraDescricao;

  @observable
  String? extraValor;

  @observable
  int? selectedModelo;

  @observable
  String? skillsCodeModelo1;

  @observable
  bool buttonDisplayed = true;

  @observable
  String? createdPageUrl;

  @observable
  XFile? image;

  @observable
  ObservableList listaModelos = ObservableList<CurriculoModeloModel>.of([
    CurriculoModeloModel(
        asset: 'assets/images/curriculo/1.png',
        selected: false,
        modelo: 1,
        link: 'https://pollosdigital.com.br/2024/09/18/leonardo-2/'),
    CurriculoModeloModel(
        asset: 'assets/images/curriculo/2.png',
        selected: false,
        modelo: 2,
        link: ''),
    CurriculoModeloModel(
        asset: 'assets/images/curriculo/3.png',
        selected: false,
        modelo: 3,
        link: ''),
    CurriculoModeloModel(
        asset: 'assets/images/curriculo/4.png',
        selected: false,
        modelo: 4,
        link: ''),
    CurriculoModeloModel(
        asset: 'assets/images/curriculo/5.png',
        selected: false,
        modelo: 5,
        link: ''),
    CurriculoModeloModel(
        asset: 'assets/images/curriculo/6.png',
        selected: false,
        modelo: 6,
        link: ''),
    CurriculoModeloModel(
        asset: 'assets/images/curriculo/7.png',
        selected: false,
        modelo: 7,
        link: ''),
    CurriculoModeloModel(
        asset: 'assets/images/curriculo/8.png',
        selected: false,
        modelo: 8,
        link: ''),
    CurriculoModeloModel(
        asset: 'assets/images/curriculo/9.png',
        selected: false,
        modelo: 9,
        link: ''),
    CurriculoModeloModel(
        asset: 'assets/images/curriculo/10.png',
        selected: false,
        modelo: 10,
        link: ''),
    CurriculoModeloModel(
        asset: 'assets/images/curriculo/11.png',
        selected: false,
        modelo: 11,
        link: ''),
  ]);

  //ACTIONs
  @action
  setNome(value) => curriculoModel?.nome = value;

  @action
  setNomeArquivo(value) => curriculoModel?.nomeArquivo = value;

  @action
  setEmail(value) => curriculoModel?.email = value;

  @action
  setTelefone(value) => curriculoModel?.telefone = value;

  @action
  setDescricao(value) => curriculoModel?.descricao = value;

  @action
  setLinkDeContato(value) => curriculoModel?.linkContato = value;

  @action
  setMissao(value) => curriculoModel?.missao = value;

  @action
  setVisao(value) => curriculoModel?.visao = value;

  @action
  setValores(value) => curriculoModel?.valores = value;

  @action
  setAudio(value) => audio = value;

  @action
  setHabilidade(value) => habilidade = value;

  @action
  setExtraDescricao(value) => extraDescricao = value;

  @action
  setExtraValor(value) => extraValor = value;

  @action
  setSelectedModelo(value) => selectedModelo = value;

  @action
  addFile(value) => image = value;

  @action
  deleteFile() => image = null;

  @action
  handleAudio(File? audio) async {
    var r = CurriculoModel();
    loadingStore.show();
    final textTranscripted = await _curriculoApi.trancriptAudio(audio!);
    r = await _curriculoApi.getAiResponse(textTranscripted);
    curriculoModel = r;
    loadingStore.hide();
  }

  @action
  deleteHabilidade(value) {
    curriculoModel!.habilidades?.remove(value);
  }

  @action
  addHabilidade(value) {
    curriculoModel!.habilidades?.add(value);
  }

  @action
  deleteExtra(value) {
    curriculoModel!.extras?.remove(value);
  }

  @action
  addExtra(descricao, valor) {
    var value = ExtrasModel(descricao: descricao, valor: int.parse(valor));
    curriculoModel!.extras?.add(value);
  }

  @action
  setModeloSelecionado(index) {
    for (var i = 0; i < listaModelos.length; i++) {
      if (i == index) {
        listaModelos[i] = CurriculoModeloModel(
            asset: 'assets/images/curriculo/${i + 1}.png',
            selected: true,
            modelo: i + 1);
      } else {
        listaModelos[i] = CurriculoModeloModel(
            asset: 'assets/images/curriculo/${i + 1}.png',
            selected: false,
            modelo: i + 1);
      }
    }
    curriculoModel?.modelo = index + 1;
  }

  @action
  criarCurriculo() async {
    var imageLink = await _curriculoApi.uploadImage(image);
    curriculoModel?.linkImage = imageLink;
    var r = await _curriculoApi.createPage(curriculoModel);
    createdPageUrl = r;
  }
}
