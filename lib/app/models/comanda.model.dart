import 'package:pollos_digital/app/shared/convert.dart';

import 'abstract/from_json.abstract.dart';

class ComandaModel extends FromJsonModel {
  int? codigoComanda;
  int? codigoComandaItem;
  int? codigoItemSessao;
  int? codigoPessoa;
  String? cpFPessoa;
  int? suporteCodigo;
  int? quantidade;
  int? quantidadeDisponivel;
  bool? sessaoAvaliacaoPassagem;
  int? sessaoAtual;
  String? item;
  int? tempoSessao;
  int? codigoUnidade;
  String? nomeUnidade;
  DateTime? dataComanda;
  int? codigoSessaoEmAberto;
  int? codigoColaboradorSessaoEmAberto;
  int? codigoUnidadeSessaoEmAberto;
  DateTime? dataSessaoEmAberto;
  int? codigoUltimaSessao;
  DateTime? dataUltimaSessao;
  bool? podeAgendarSessaoPrazo;
  int? statusSessaoEmAberto;
  bool? comandaTransferida;
  bool? comandaInadimplente;
  bool? comandaSemAssinaturas;

  ComandaModel({
    this.codigoComanda,
    this.codigoComandaItem,
    this.codigoItemSessao,
    this.codigoPessoa,
    this.cpFPessoa,
    this.suporteCodigo,
    this.quantidade,
    this.quantidadeDisponivel,
    this.sessaoAvaliacaoPassagem,
    this.sessaoAtual,
    this.item,
    this.tempoSessao,
    this.codigoUnidade,
    this.nomeUnidade,
    this.dataComanda,
    this.codigoSessaoEmAberto,
    this.codigoColaboradorSessaoEmAberto,
    this.codigoUnidadeSessaoEmAberto,
    this.dataSessaoEmAberto,
    this.codigoUltimaSessao,
    this.dataUltimaSessao,
    this.podeAgendarSessaoPrazo,
    this.statusSessaoEmAberto,
    this.comandaTransferida,
    this.comandaInadimplente,
    this.comandaSemAssinaturas,
  });

  ComandaModel.createNew(ComandaModel model) {
    codigoComanda = model.codigoComanda;
    codigoComandaItem = model.codigoComandaItem;
    codigoItemSessao = model.codigoItemSessao;
    codigoPessoa = model.codigoPessoa;
    cpFPessoa = model.cpFPessoa;
    suporteCodigo = model.suporteCodigo;
    quantidade = model.quantidade;
    quantidadeDisponivel = model.quantidadeDisponivel;
    sessaoAvaliacaoPassagem = model.sessaoAvaliacaoPassagem;
    sessaoAtual = model.sessaoAtual;
    item = model.item;
    tempoSessao = model.tempoSessao;
    codigoUnidade = model.codigoUnidade;
    nomeUnidade = model.nomeUnidade;
    dataComanda = model.dataComanda;
    codigoSessaoEmAberto = model.codigoSessaoEmAberto;
    codigoColaboradorSessaoEmAberto = model.codigoColaboradorSessaoEmAberto;
    codigoUnidadeSessaoEmAberto = model.codigoUnidadeSessaoEmAberto;
    dataSessaoEmAberto = model.dataSessaoEmAberto;
    codigoUltimaSessao = model.codigoUltimaSessao;
    dataUltimaSessao = model.dataUltimaSessao;
    podeAgendarSessaoPrazo = model.podeAgendarSessaoPrazo;
    statusSessaoEmAberto = model.statusSessaoEmAberto;
    comandaTransferida = model.comandaTransferida;
    comandaInadimplente = model.comandaInadimplente;
    comandaSemAssinaturas = model.comandaSemAssinaturas;
  }

  ComandaModel.fromJson(Map<String, dynamic> json) {
    codigoComanda = convertInt(json['codigoComanda']);
    codigoComandaItem = convertInt(json['codigoComandaItem']);
    codigoItemSessao = convertInt(json['codigoItemSessao']);
    codigoPessoa = convertInt(json['codigoPessoa']);
    cpFPessoa = json['cpF_Pessoa'];
    suporteCodigo = convertInt(json['suporteCodigo']);
    quantidade = convertInt(json['quantidade']);
    quantidadeDisponivel = convertInt(json['quantidadeDisponivel']);
    sessaoAvaliacaoPassagem =
        convertBool(json['sessaoAvaliacaoPassagem'], returnNull: false);
    sessaoAtual = convertInt(json['sessaoAtual']);
    item = json['item'];
    tempoSessao = convertInt(json['tempoSessao']);
    codigoUnidade = convertInt(json['codigoUnidade']);
    nomeUnidade = json['nomeUnidade'];
    dataComanda = convertDateTime(json['dataComanda']);
    codigoSessaoEmAberto = convertInt(json['codigoSessaoEmAberto']);
    codigoColaboradorSessaoEmAberto =
        convertInt(json['codigoColaboradorSessaoEmAberto']);
    codigoUnidadeSessaoEmAberto =
        convertInt(json['codigoUnidadeSessaoEmAberto']);
    dataSessaoEmAberto = convertDateTime(json['dataSessaoEmAberto']);
    codigoUltimaSessao = convertInt(json['codigoUltimaSessao']);
    dataUltimaSessao = convertDateTime(json['dataUltimaSessao']);
    podeAgendarSessaoPrazo =
        convertBool(json['podeAgendarSessaoPrazo'], returnNull: false);
    statusSessaoEmAberto = convertInt(json['statusSessaoEmAberto']);
    comandaTransferida = convertBool(json['comandaTransferida']);
    comandaInadimplente = convertBool(json['comandaInadimplente']);
    comandaSemAssinaturas = convertBool(json['comandaSemAssinaturas']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => ComandaModel.fromJson(json);
}
