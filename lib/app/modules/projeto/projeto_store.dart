import 'dart:io';

import 'package:intl/intl.dart';
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
  String? atividade;

  @observable
  String? extraDescricao;

  @observable
  String? extraValor;

  @observable
  String? faqPergunta;

  @observable
  String? faqResposta;

  @observable
  String? experienciaCargo;

  @observable
  String? experienciaEmpresa;

  @observable
  String? experienciaDataDeInicio;

  @observable
  String? experienciaDataDeFim;

  @observable
  String? experienciaDescricao;

  @observable
  String? depoimentoNome;

  @observable
  String? depoimentoTexto;

  @observable
  String? cardTitulo;

  @observable
  String? cardTexto;

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
  XFile? depoimentoImage;

  @observable
  ObservableList listaModelos = ObservableList<ProjetoModeloModel>.of([]);

  @observable
  ObservableList listaProjetos = ObservableList<ProjetoModel>.of([]);

  @observable
  ObservableList atividades = ObservableList<String>.of([]);

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
  setAtividade(value) => atividade = value;

  @action
  setExtraDescricao(value) => extraDescricao = value;

  @action
  setExtraValor(value) => extraValor = value;

  @action
  setCardTitulo(value) => cardTitulo = value;

  @action
  setCardTexto(value) => cardTexto = value;

  @action
  setFaqPergunta(value) => faqPergunta = value;

  @action
  setFaqResposta(value) => faqResposta = value;

  @action
  setExperienciaCargo(value) => experienciaCargo = value;

  @action
  setExperienciaEmpresa(value) => experienciaEmpresa = value;

  @action
  setExperienciaDataDeInicio(value) => experienciaDataDeInicio = value;

  @action
  setExperienciaDataDeFim(value) => experienciaDataDeFim = value;

  @action
  setExperienciaDescricao(value) => experienciaDescricao = value;

  @action
  setDepoimentoNome(value) => depoimentoNome = value;

  @action
  setDepoimentoTexto(value) => depoimentoTexto = value;

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
    try {
      var token = await _projetoApi.getTokenOpenIaAPI();
      final textTranscripted = await _projetoApi.trancriptAudio(audio!, token);
      r = await _projetoApi.getAiResponse(
          textTranscripted ?? "gere sozinho", token);
      if (r.message == null) {
        r.modelo = projetoModel?.modelo;
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
          faq: ObservableList<FaqModel>.of([]),
          experiencias: ObservableList<ExperienciaModel>.of([]),
        );
      }
    } catch (e) {}
    loadingStore.hide();
  }

  @action
  deleteHabilidade(value) {
    projetoModel!.habilidades?.remove(value);
  }

  @action
  addHabilidade(value, indexForEdit) {
    if (indexForEdit == null) {
      projetoModel!.habilidades?.add(value);
    } else {
      //indexForEdit diferente de nulo edita ao inves de adicionar novo
      projetoModel!.habilidades?[indexForEdit] = value;
    }
  }

  @action
  deleteAtividade(value) {
    atividades.remove(value);
  }

  @action
  addAtividade(value, indexForEdit) {
    if (indexForEdit == null) {
      atividades.add(value);
    } else {
      //indexForEdit diferente de nulo edita ao inves de adicionar novo
      atividades[indexForEdit] = value;
    }
  }

  @action
  deleteExtra(value) {
    projetoModel!.extras?.remove(value);
  }

  @action
  addExtra(descricao, valor, indexForEdit) {
    if (indexForEdit == null) {
      projetoModel!.extras
          ?.add(ExtrasModel(descricao: descricao, valor: int.parse(valor)));
    } else {
      //indexForEdit diferente de nulo edita ao inves de adicionar novo
      projetoModel!.extras?[indexForEdit] =
          ExtrasModel(descricao: descricao, valor: int.parse(valor));
    }
  }

  @action
  deletFaq(value) {
    projetoModel!.faq?.remove(value);
  }

  @action
  addFaq(pergunta, resposta, indexForEdit) {
    if (indexForEdit == null) {
      projetoModel!.faq?.add(FaqModel(pergunta: pergunta, resposta: resposta));
    } else {
      //indexForEdit diferente de nulo edita ao inves de adicionar novo
      projetoModel?.faq?[indexForEdit] =
          FaqModel(pergunta: pergunta, resposta: resposta);
    }
  }

  @action
  deletExperiencia(value) {
    projetoModel!.experiencias?.remove(value);
  }

  @action
  addExperiencia(
      cargo, empresa, dataDeInicio, dataDeFim, descricao, indexForEdit) {
    if (indexForEdit == null) {
      projetoModel!.experiencias?.add(ExperienciaModel(
          cargo: cargo,
          empresa: empresa,
          dataDeInicio: DateFormat('dd/MM/yyyyy').parse(dataDeInicio),
          dataDeFim: DateFormat('dd/MM/yyyyy').parse(dataDeFim),
          descricao: descricao));
    } else {
      //indexForEdit diferente de nulo edita ao inves de adicionar novo
      projetoModel?.experiencias?[indexForEdit] = ExperienciaModel(
          cargo: cargo,
          empresa: empresa,
          dataDeInicio: DateFormat('dd/MM/yyyyy').parse(dataDeInicio),
          dataDeFim: DateFormat('dd/MM/yyyyy').parse(dataDeFim),
          descricao: descricao);
    }
  }

  @action
  deletDepoimento(value) {
    projetoModel!.depoimentos?.remove(value);
  }

  @action
  addDepoimento(nome, depoimento, image, indexForEdit) {
    if (indexForEdit == null) {
      projetoModel!.depoimentos?.add(
          DepoimentoModel(nome: nome, depoimento: depoimento, image: image));
    } else {
      //indexForEdit diferente de nulo edita ao inves de adicionar novo
      projetoModel?.depoimentos?[indexForEdit] =
          DepoimentoModel(nome: nome, depoimento: depoimento, image: image);
    }
  }

  @action
  deletCard(value) {
    projetoModel!.card?.remove(value);
  }

  @action
  addCard(titulo, texto, indexForEdit) {
    if (indexForEdit == null) {
      projetoModel!.card?.add(CardModel(titulo: titulo, texto: texto));
    } else {
      //indexForEdit diferente de nulo edita ao inves de adicionar novo
      projetoModel?.card?[indexForEdit] =
          CardModel(titulo: titulo, texto: texto);
    }
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
    projetoModel?.modelo = listaModelos[index].id;
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
