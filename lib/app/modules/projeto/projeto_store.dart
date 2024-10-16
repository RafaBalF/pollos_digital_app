import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:pollos_digital/app/apis/projeto.api.dart';
import 'package:pollos_digital/app/models/projeto.model.dart';
import 'package:pollos_digital/app/models/hives/login.hive.dart';
import 'package:pollos_digital/app/models/projeto_modelos.model.dart';
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
  String? urlAmigavelErroMessage;

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
  ObservableList listaProjetos = ObservableList<ProjetoModel>.of([]);

  //ACTIONs
  @action
  setUrlAmigavelErroMessage(value) => urlAmigavelErroMessage = value;
  @action
  setButtonEnabilitiy() => buttonEnabilitiy = false;

  @action
  setNome(value) => projetoModel?.nome = value;

  @action
  setNomePagina(value) {
    projetoModel?.nomePagina = value;
    projetoModel?.urlAmigavel = value;
  }

  @action
  setEmail(value) => projetoModel?.email = value;

  @action
  setTelefone(value) {
    projetoModel?.telefone = value;
    String telefoneSomenteNumero =
        value.replaceAll(RegExp(r'[^0-9]'), ''); // '23'
    projetoModel?.linkContato =
        'https://api.whatsapp.com/send/?phone=55$telefoneSomenteNumero';
  }

  @action
  setDescricao(value) => projetoModel?.descricao = value;

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
  deleteFile() {
    image = null;
    projetoModel?.linkImage = null;
  }

  @action
  handleAudio(File? audio) async {
    var r = ProjetoModel();
    loadingStore.show();
    var token = await _projetoApi.getTokenOpenIaAPI();
    final textTranscripted = await _projetoApi.trancriptAudio(audio!, token);
    r = await _projetoApi.getAiResponse(
        textTranscripted ?? "gere sozinho", token);
    if (r.message == null) {
      projetoModel = r;
    } else {
      projetoModel = ProjetoModel(
        nome: '',
        nomePagina: '',
        email: '',
        telefone: '',
        descricao: '',
        linkContato: '',
        missao: '',
        visao: '',
        valores: '',
        linkImage: null,
        habilidades: ObservableList<String>.of([]),
        extras: ObservableList<ExtrasModel>.of([]),
      );
    }
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
        listaModelos[i] = ProjetoModeloModel(
          descricao: listaModelos[i].descricao,
          id: listaModelos[i].id,
          imgUrl: listaModelos[i].imgUrl,
          modeloUrl: listaModelos[i].modeloUrl,
          nome: listaModelos[i].nome,
          status: listaModelos[i].status,
          selected: true,
        );
      } else {
        listaModelos[i] = ProjetoModeloModel(
          descricao: listaModelos[i].descricao,
          id: listaModelos[i].id,
          imgUrl: listaModelos[i].imgUrl,
          modeloUrl: listaModelos[i].modeloUrl,
          nome: listaModelos[i].nome,
          status: listaModelos[i].status,
          selected: false,
        );
      }
    }
    projetoModel?.modelo = (index + 1).toString();
  }

  @action
  salvarProjeto() async {
    loadingStore.show();
    projetoModel?.linkImage ??= await _projetoApi.uploadImage(image);
    var user = _loginHive.getLogin();
    projetoModel!.usuarioId = int.parse(user.id.toString());
    var r;
    if (projetoModel?.id == null) {
      r = await _projetoApi.criarProjeto(projetoModel);
    } else {
      r = await _projetoApi.editarProjeto(projetoModel);
    }
    loadingStore.hide();
    return r;
  }

  @action
  carregarModelos() async {
    var arrayModelos = await _projetoApi.carregarModelos();
    for (var e in arrayModelos) {
      ProjetoModeloModel projetoModelMapped = ProjetoModeloModel.fromJson(e);
      if (projetoModel?.modelo == projetoModelMapped.id) {
        projetoModelMapped.selected = true;
      }
      listaModelos.add(projetoModelMapped);
    }
  }

  @action
  carregarProjetosCriados() async {
    var user = _loginHive.getLogin();
    var arrayModelos = await _projetoApi.carregarProjetos(user.id);
    for (var e in arrayModelos['projetos']) {
      listaProjetos.add(ProjetoModel.fromJson(e));
    }
    // listaProjetos.add(ProjetoModel(
    //   nome: 'Rafael Baleeiro',
    //   urlAmigavel: 'urlAmigavel',
    //   descricao: 'descricao',
    //   email: 'email',
    //   linkContato: 'linkContato',
    //   linkImage: 'linkImage',
    //   missao: 'missao',
    //   visao: 'visao',
    //   valores: 'valores',
    //   telefone: 'telefone',
    //   modelo: 'modelo',
    //   usuarioId: 6,
    //   id: 'id',
    //   habilidades: ObservableList<String>.of([]),
    //   extras: ObservableList<ExtrasModel>.of([]),
    // ));
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

  @action
  Future<void> initProjetosModelo() async {
    await carregarModelos();
  }

  @action
  Future<String?> validarUrlAmigavel() async {
    var r = await _projetoApi.validarUrlAmigavel(projetoModel?.urlAmigavel);
    String mensagem = r.toString();
    return mensagem != '' ? mensagem : null;
  }
}
