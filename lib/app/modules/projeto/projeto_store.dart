import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:pollos_digital/app/apis/projeto.api.dart';
import 'package:pollos_digital/app/models/projeto.model.dart';
import 'package:pollos_digital/app/models/hives/login.hive.dart';
import 'package:pollos_digital/app/models/projeto_modelos.model.dart';
import 'package:pollos_digital/app/models/projetos_criados.model.dart';
import 'package:pollos_digital/loading_store.dart';
import 'package:image_picker/image_picker.dart';

part 'projeto_store.g.dart';

class ProjetoStore = ProjetoStoreBase with _$ProjetoStore;

abstract class ProjetoStoreBase with Store {
  //APIs
  final ProjetoApi _projetoApi = ProjetoApi();

  //STOREs
  final LoadingStore loadingStore = LoadingStore();
  final LoginHive _loginHive = LoginHive();

  //OBSERVABLEs
  @observable
  ProjetoModel? projetoModel = ProjetoModel();

  @observable
  bool buttonEnabilitiy = true;

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
  ObservableList listaModelos = ObservableList<ProjetoModeloModel>.of([]);

  @observable
  ObservableList listaProjetos = ObservableList<ProjetosCriadosModel>.of([]);

  //ACTIONs
  @action
  setButtonEnabilitiy() => buttonEnabilitiy = false;

  @action
  setNome(value) => projetoModel?.nome = value;

  @action
  setNomeArquivo(value) => projetoModel?.nomeArquivo = value;

  @action
  setEmail(value) => projetoModel?.email = value;

  @action
  setTelefone(value) => projetoModel?.telefone = value;

  @action
  setDescricao(value) => projetoModel?.descricao = value;

  @action
  setLinkDeContato(value) => projetoModel?.linkContato = value;

  @action
  setMissao(value) => projetoModel?.missao = value;

  @action
  setVisao(value) => projetoModel?.visao = value;

  @action
  setValores(value) => projetoModel?.valores = value;

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
    var r = ProjetoModel();
    loadingStore.show();
    final textTranscripted = await _projetoApi.trancriptAudio(audio!);
    r = await _projetoApi.getAiResponse(textTranscripted);
    projetoModel = r;
    loadingStore.hide();
  }

  @action
  deleteHabilidade(value) {
    projetoModel!.habilidades?.remove(value);
  }

  @action
  addHabilidade(value) {
    projetoModel!.habilidades?.add(value);
  }

  @action
  deleteExtra(value) {
    projetoModel!.extras?.remove(value);
  }

  @action
  addExtra(descricao, valor) {
    var value = ExtrasModel(descricao: descricao, valor: int.parse(valor));
    projetoModel!.extras?.add(value);
  }

  @action
  setModeloSelecionado(index) {
    for (var i = 0; i < listaModelos.length; i++) {
      if (i == index) {
        listaModelos[i] = ProjetoModeloModel();
      } else {
        listaModelos[i] = ProjetoModeloModel();
      }
    }
    projetoModel?.modelo = index + 1;
  }

  @action
  criarProjeto() async {
    loadingStore.show();
    var imageLink = await _projetoApi.uploadImage(image);
    projetoModel?.linkImage = imageLink;
    var r = await _projetoApi.createPage(projetoModel);
    createdPageUrl = r;
    var user = _loginHive.getLogin();
    await _projetoApi.createProject(
        user.id, projetoModel?.nome, createdPageUrl);
    loadingStore.hide();
  }

  @action
  carregarModelos() async {
    var arrayModelos = await _projetoApi.carregarModelos();
    for (var e in arrayModelos) {
      listaModelos.add(ProjetoModeloModel.fromJson(e));
    }
  }

  @action
  carregarProjetosCriados() async {
    var user = _loginHive.getLogin();
    var arrayModelos = await _projetoApi.carregarProjetos(user.id);
    for (var e in arrayModelos['projetos']) {
      listaProjetos.add(ProjetosCriadosModel.fromJson(e));
    }
  }

  @action
  excluirProjeto(projetoId) async {
    await _projetoApi.excluirProjeto(projetoId);
    loadingStore.show();
    listaProjetos.clear();
    await carregarProjetosCriados();
    loadingStore.hide();
  }

  @action
  Future<void> initProjetosCriado() async {
    await carregarProjetosCriados();
  }
}