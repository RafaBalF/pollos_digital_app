import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pollos_digital/app/apis/curriculo.api.dart';
import 'package:pollos_digital/app/models/curriculo.model.dart';
import 'package:pollos_digital/app/models/modelos.model.dart';
import 'package:pollos_digital/loading_store.dart';

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
  String? nome;

  @observable
  String? email;

  @observable
  String? telefone;

  @observable
  String? resumo;

  @observable
  String? habilidade;

  @observable
  Color selectedColor1 = Colors.grey;

  @observable
  double selectedWidth1 = 1;

  @observable
  Color selectedColor2 = Colors.grey;

  @observable
  double selectedWidth2 = 1;

  @observable
  Color selectedColor3 = Colors.grey;

  @observable
  double selectedWidth3 = 1;

  @observable
  int? selectedModelo;

  @observable
  String? skillsCodeModelo1;

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
  setNome(value) => nome = value;

  @action
  setEmail(value) => email = value;

  @action
  setTelefone(value) => telefone = value;

  @action
  setResumo(value) => resumo = value;

  @action
  setHabilidade(value) => habilidade = value;

  @action
  setAudio(value) => audio = value;

  @action
  setSelectedModelo(value) => selectedModelo = value;

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
    selectedModelo = index + 1;
  }

  @action
  criarCurriculo() async {
    for (var i = 0; i < curriculoModel!.habilidades!.length; i++) {
      skillsCodeModelo1 =
          '''$skillsCodeModelo1<li class="elementor-icon-list-item">
											<span class="elementor-icon-list-icon">
							<svg aria-hidden="true" class="e-font-icon-svg e-fas-check-circle" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="M504 256c0 136.967-111.033 248-248 248S8 392.967 8 256 119.033 8 256 8s248 111.033 248 248zM227.314 387.314l184-184c6.248-6.248 6.248-16.379 0-22.627l-22.627-22.627c-6.248-6.249-16.379-6.249-22.628 0L216 308.118l-70.059-70.059c-6.248-6.248-16.379-6.248-22.628 0l-22.627 22.627c-6.248 6.248-6.248 16.379 0 22.627l104 104c6.249 6.249 16.379 6.249 22.628.001z"></path></svg>						</span>
										<span class="elementor-icon-list-text">${curriculoModel?.habilidades?[i]}</span>
									</li>''';
    }
    var modeloCurriculo1 = """
<style>/*! elementor - v3.23.0 - 05-08-2024 */<br />
.elementor-widget-image{text-align:center}.elementor-widget-image a{display:inline-block}.elementor-widget-image a img[src\$=".svg"]{width:48px}.elementor-widget-image img{vertical-align:middle;display:inline-block}</style>
<p>										<img width="385" height="333" src="https://pollosdigital.com.br/wp-content/uploads/2024/09/logo-progress.png" alt="" srcset="https://pollosdigital.com.br/wp-content/uploads/2024/09/logo-progress.png 385w, https://pollosdigital.com.br/wp-content/uploads/2024/09/logo-progress-300x259.png 300w" sizes="(max-width: 385px) 100vw, 385px" />													</p>
<style>/*! elementor - v3.23.0 - 05-08-2024 */<br />
.elementor-heading-title{padding:0;margin:0;line-height:1}.elementor-widget-heading .elementor-heading-title[class*=elementor-size-]>a{color:inherit;font-size:inherit;line-height:inherit}.elementor-widget-heading .elementor-heading-title.elementor-size-small{font-size:15px}.elementor-widget-heading .elementor-heading-title.elementor-size-medium{font-size:19px}.elementor-widget-heading .elementor-heading-title.elementor-size-large{font-size:29px}.elementor-widget-heading .elementor-heading-title.elementor-size-xl{font-size:39px}.elementor-widget-heading .elementor-heading-title.elementor-size-xxl{font-size:59px}</style>
<h2>Você que deseja <b style="font-weight: 900;">iniciar seu progresso no mercado digital</b> acaba de encontrar um meio seguro de dar o primeiro passo!</h2>
<p>		https://www.youtube.com/watch?v=XHOmBV4js_E<br />
			<a href="#"><br />
									QUERO MEU PROGRESSO<br />
					</a></p>
<h2>Entenda <b>o que você vai aprender<b></h2>
<h2>de forma simples e objetiva</h2>
<style>/*! elementor - v3.23.0 - 05-08-2024 */<br />
.elementor-widget-image-box .elementor-image-box-content{width:100%}@media (min-width:768px){.elementor-widget-image-box.elementor-position-left .elementor-image-box-wrapper,.elementor-widget-image-box.elementor-position-right .elementor-image-box-wrapper{display:flex}.elementor-widget-image-box.elementor-position-right .elementor-image-box-wrapper{text-align:end;flex-direction:row-reverse}.elementor-widget-image-box.elementor-position-left .elementor-image-box-wrapper{text-align:start;flex-direction:row}.elementor-widget-image-box.elementor-position-top .elementor-image-box-img{margin:auto}.elementor-widget-image-box.elementor-vertical-align-top .elementor-image-box-wrapper{align-items:flex-start}.elementor-widget-image-box.elementor-vertical-align-middle .elementor-image-box-wrapper{align-items:center}.elementor-widget-image-box.elementor-vertical-align-bottom .elementor-image-box-wrapper{align-items:flex-end}}@media (max-width:767px){.elementor-widget-image-box .elementor-image-box-img{margin-left:auto!important;margin-right:auto!important;margin-bottom:15px}}.elementor-widget-image-box .elementor-image-box-img{display:inline-block}.elementor-widget-image-box .elementor-image-box-title a{color:inherit}.elementor-widget-image-box .elementor-image-box-wrapper{text-align:center}.elementor-widget-image-box .elementor-image-box-description{margin:0}</style>
<figure><img width="200" height="200" src="https://pollosdigital.com.br/wp-content/uploads/2024/09/list-interest-1.png" alt="" /></figure>
<h3>Criar uma máquina de captura de clientes</h3>
<figure><img width="150" height="150" src="https://pollosdigital.com.br/wp-content/uploads/2024/09/list-interest-2-150x150.png" alt="" /></figure>
<h3>Criar uma lista com  os interessados</h3>
<figure><img width="150" height="150" src="https://pollosdigital.com.br/wp-content/uploads/2024/09/list-interest-3-150x150.png" alt="" /></figure>
<h3>Vender para essa lista todos os dias.</h3>
<p>													<img width="693" height="693" src="https://pollosdigital.com.br/wp-content/uploads/2024/09/Businessman-Transparent.png" alt="" srcset="https://pollosdigital.com.br/wp-content/uploads/2024/09/Businessman-Transparent.png 693w, https://pollosdigital.com.br/wp-content/uploads/2024/09/Businessman-Transparent-300x300.png 300w, https://pollosdigital.com.br/wp-content/uploads/2024/09/Businessman-Transparent-150x150.png 150w" sizes="(max-width: 693px) 100vw, 693px" />													</p>
<h2><b>Pedro Costa</b> é o mentor por trás do treinamento. Acumula experiência em vendas desde a adolescência. Se apaixonou pelo mercado digital aos 22 anos e desde então já faturou mais de 6 dígitos com venda de infoprodutos através do celular.</p>
<p>Já iniciou mais de 2 mil pessoas na profissão de forma segura, simples, sem enrolação e sendo bem objetivo.</p>
<p>Os feedbacks que recebe confirmam o bom desempenho, e mostram que tem um conteúdo aplicável e de valor.</h2>
<h2>OS <b>MÓDULOS DO PROGRESSO</b><br />
</h2>
<link rel="stylesheet" href="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/css/widget-icon-box.min.css">
				<svg aria-hidden="true" viewBox="0 0 640 512" xmlns="http://www.w3.org/2000/svg"><path d="M622.34 153.2L343.4 67.5c-15.2-4.67-31.6-4.67-46.79 0L17.66 153.2c-23.54 7.23-23.54 38.36 0 45.59l48.63 14.94c-10.67 13.19-17.23 29.28-17.88 46.9C38.78 266.15 32 276.11 32 288c0 10.78 5.68 19.85 13.86 25.65L20.33 428.53C18.11 438.52 25.71 448 35.94 448h56.11c10.24 0 17.84-9.48 15.62-19.47L82.14 313.65C90.32 307.85 96 298.78 96 288c0-11.57-6.47-21.25-15.66-26.87.76-15.02 8.44-28.3 20.69-36.72L296.6 284.5c9.06 2.78 26.44 6.25 46.79 0l278.95-85.7c23.55-7.24 23.55-38.36 0-45.6zM352.79 315.09c-28.53 8.76-52.84 3.92-65.59 0l-145.02-44.55L128 384c0 35.35 85.96 64 192 64s192-28.65 192-64l-14.18-113.47-145.03 44.56z"></path></svg>				</p>
<h3>
							Introdução<br />
					</h3>
<p>				<svg aria-hidden="true" viewBox="0 0 640 512" xmlns="http://www.w3.org/2000/svg"><path d="M622.34 153.2L343.4 67.5c-15.2-4.67-31.6-4.67-46.79 0L17.66 153.2c-23.54 7.23-23.54 38.36 0 45.59l48.63 14.94c-10.67 13.19-17.23 29.28-17.88 46.9C38.78 266.15 32 276.11 32 288c0 10.78 5.68 19.85 13.86 25.65L20.33 428.53C18.11 438.52 25.71 448 35.94 448h56.11c10.24 0 17.84-9.48 15.62-19.47L82.14 313.65C90.32 307.85 96 298.78 96 288c0-11.57-6.47-21.25-15.66-26.87.76-15.02 8.44-28.3 20.69-36.72L296.6 284.5c9.06 2.78 26.44 6.25 46.79 0l278.95-85.7c23.55-7.24 23.55-38.36 0-45.6zM352.79 315.09c-28.53 8.76-52.84 3.92-65.59 0l-145.02-44.55L128 384c0 35.35 85.96 64 192 64s192-28.65 192-64l-14.18-113.47-145.03 44.56z"></path></svg>				</p>
<h3>
							Suporte<br />
					</h3>
<p>				<svg aria-hidden="true" viewBox="0 0 640 512" xmlns="http://www.w3.org/2000/svg"><path d="M622.34 153.2L343.4 67.5c-15.2-4.67-31.6-4.67-46.79 0L17.66 153.2c-23.54 7.23-23.54 38.36 0 45.59l48.63 14.94c-10.67 13.19-17.23 29.28-17.88 46.9C38.78 266.15 32 276.11 32 288c0 10.78 5.68 19.85 13.86 25.65L20.33 428.53C18.11 438.52 25.71 448 35.94 448h56.11c10.24 0 17.84-9.48 15.62-19.47L82.14 313.65C90.32 307.85 96 298.78 96 288c0-11.57-6.47-21.25-15.66-26.87.76-15.02 8.44-28.3 20.69-36.72L296.6 284.5c9.06 2.78 26.44 6.25 46.79 0l278.95-85.7c23.55-7.24 23.55-38.36 0-45.6zM352.79 315.09c-28.53 8.76-52.84 3.92-65.59 0l-145.02-44.55L128 384c0 35.35 85.96 64 192 64s192-28.65 192-64l-14.18-113.47-145.03 44.56z"></path></svg>				</p>
<h3>
							Primeiros Passos<br />
					</h3>
<p>				<svg aria-hidden="true" viewBox="0 0 640 512" xmlns="http://www.w3.org/2000/svg"><path d="M622.34 153.2L343.4 67.5c-15.2-4.67-31.6-4.67-46.79 0L17.66 153.2c-23.54 7.23-23.54 38.36 0 45.59l48.63 14.94c-10.67 13.19-17.23 29.28-17.88 46.9C38.78 266.15 32 276.11 32 288c0 10.78 5.68 19.85 13.86 25.65L20.33 428.53C18.11 438.52 25.71 448 35.94 448h56.11c10.24 0 17.84-9.48 15.62-19.47L82.14 313.65C90.32 307.85 96 298.78 96 288c0-11.57-6.47-21.25-15.66-26.87.76-15.02 8.44-28.3 20.69-36.72L296.6 284.5c9.06 2.78 26.44 6.25 46.79 0l278.95-85.7c23.55-7.24 23.55-38.36 0-45.6zM352.79 315.09c-28.53 8.76-52.84 3.92-65.59 0l-145.02-44.55L128 384c0 35.35 85.96 64 192 64s192-28.65 192-64l-14.18-113.47-145.03 44.56z"></path></svg>				</p>
<h3>
							Máquina de Vendas<br />
					</h3>
<p>				<svg aria-hidden="true" viewBox="0 0 640 512" xmlns="http://www.w3.org/2000/svg"><path d="M622.34 153.2L343.4 67.5c-15.2-4.67-31.6-4.67-46.79 0L17.66 153.2c-23.54 7.23-23.54 38.36 0 45.59l48.63 14.94c-10.67 13.19-17.23 29.28-17.88 46.9C38.78 266.15 32 276.11 32 288c0 10.78 5.68 19.85 13.86 25.65L20.33 428.53C18.11 438.52 25.71 448 35.94 448h56.11c10.24 0 17.84-9.48 15.62-19.47L82.14 313.65C90.32 307.85 96 298.78 96 288c0-11.57-6.47-21.25-15.66-26.87.76-15.02 8.44-28.3 20.69-36.72L296.6 284.5c9.06 2.78 26.44 6.25 46.79 0l278.95-85.7c23.55-7.24 23.55-38.36 0-45.6zM352.79 315.09c-28.53 8.76-52.84 3.92-65.59 0l-145.02-44.55L128 384c0 35.35 85.96 64 192 64s192-28.65 192-64l-14.18-113.47-145.03 44.56z"></path></svg>				</p>
<h3>
							Automação<br />
					</h3>
<p>				<svg aria-hidden="true" viewBox="0 0 640 512" xmlns="http://www.w3.org/2000/svg"><path d="M622.34 153.2L343.4 67.5c-15.2-4.67-31.6-4.67-46.79 0L17.66 153.2c-23.54 7.23-23.54 38.36 0 45.59l48.63 14.94c-10.67 13.19-17.23 29.28-17.88 46.9C38.78 266.15 32 276.11 32 288c0 10.78 5.68 19.85 13.86 25.65L20.33 428.53C18.11 438.52 25.71 448 35.94 448h56.11c10.24 0 17.84-9.48 15.62-19.47L82.14 313.65C90.32 307.85 96 298.78 96 288c0-11.57-6.47-21.25-15.66-26.87.76-15.02 8.44-28.3 20.69-36.72L296.6 284.5c9.06 2.78 26.44 6.25 46.79 0l278.95-85.7c23.55-7.24 23.55-38.36 0-45.6zM352.79 315.09c-28.53 8.76-52.84 3.92-65.59 0l-145.02-44.55L128 384c0 35.35 85.96 64 192 64s192-28.65 192-64l-14.18-113.47-145.03 44.56z"></path></svg>				</p>
<h3>
							WhatsApp Business<br />
					</h3>
<p>				<svg aria-hidden="true" viewBox="0 0 640 512" xmlns="http://www.w3.org/2000/svg"><path d="M622.34 153.2L343.4 67.5c-15.2-4.67-31.6-4.67-46.79 0L17.66 153.2c-23.54 7.23-23.54 38.36 0 45.59l48.63 14.94c-10.67 13.19-17.23 29.28-17.88 46.9C38.78 266.15 32 276.11 32 288c0 10.78 5.68 19.85 13.86 25.65L20.33 428.53C18.11 438.52 25.71 448 35.94 448h56.11c10.24 0 17.84-9.48 15.62-19.47L82.14 313.65C90.32 307.85 96 298.78 96 288c0-11.57-6.47-21.25-15.66-26.87.76-15.02 8.44-28.3 20.69-36.72L296.6 284.5c9.06 2.78 26.44 6.25 46.79 0l278.95-85.7c23.55-7.24 23.55-38.36 0-45.6zM352.79 315.09c-28.53 8.76-52.84 3.92-65.59 0l-145.02-44.55L128 384c0 35.35 85.96 64 192 64s192-28.65 192-64l-14.18-113.47-145.03 44.56z"></path></svg>				</p>
<h3>
							Afiliado Digital<br />
					</h3>
<p>				<svg aria-hidden="true" viewBox="0 0 640 512" xmlns="http://www.w3.org/2000/svg"><path d="M622.34 153.2L343.4 67.5c-15.2-4.67-31.6-4.67-46.79 0L17.66 153.2c-23.54 7.23-23.54 38.36 0 45.59l48.63 14.94c-10.67 13.19-17.23 29.28-17.88 46.9C38.78 266.15 32 276.11 32 288c0 10.78 5.68 19.85 13.86 25.65L20.33 428.53C18.11 438.52 25.71 448 35.94 448h56.11c10.24 0 17.84-9.48 15.62-19.47L82.14 313.65C90.32 307.85 96 298.78 96 288c0-11.57-6.47-21.25-15.66-26.87.76-15.02 8.44-28.3 20.69-36.72L296.6 284.5c9.06 2.78 26.44 6.25 46.79 0l278.95-85.7c23.55-7.24 23.55-38.36 0-45.6zM352.79 315.09c-28.53 8.76-52.84 3.92-65.59 0l-145.02-44.55L128 384c0 35.35 85.96 64 192 64s192-28.65 192-64l-14.18-113.47-145.03 44.56z"></path></svg>				</p>
<h3>
							Primeiros Clientes<br />
					</h3>
<p>				<svg aria-hidden="true" viewBox="0 0 640 512" xmlns="http://www.w3.org/2000/svg"><path d="M622.34 153.2L343.4 67.5c-15.2-4.67-31.6-4.67-46.79 0L17.66 153.2c-23.54 7.23-23.54 38.36 0 45.59l48.63 14.94c-10.67 13.19-17.23 29.28-17.88 46.9C38.78 266.15 32 276.11 32 288c0 10.78 5.68 19.85 13.86 25.65L20.33 428.53C18.11 438.52 25.71 448 35.94 448h56.11c10.24 0 17.84-9.48 15.62-19.47L82.14 313.65C90.32 307.85 96 298.78 96 288c0-11.57-6.47-21.25-15.66-26.87.76-15.02 8.44-28.3 20.69-36.72L296.6 284.5c9.06 2.78 26.44 6.25 46.79 0l278.95-85.7c23.55-7.24 23.55-38.36 0-45.6zM352.79 315.09c-28.53 8.76-52.84 3.92-65.59 0l-145.02-44.55L128 384c0 35.35 85.96 64 192 64s192-28.65 192-64l-14.18-113.47-145.03 44.56z"></path></svg>				</p>
<h3>
							E muito+!<br />
					</h3>
<h2><b>E NÃO ACABOU!</b><br />
</h2>
<h2>SÉRIE DE BÔNUS PARA AUMENTAR SEUS RESULTADOS</h2>
<figure><img width="600" height="600" src="https://pollosdigital.com.br/wp-content/uploads/2024/09/bonus-automacao.jpg" alt="" /></figure>
<h3>Aula avançada de Criação de Conteúdo</h3>
<figure><img width="600" height="600" src="https://pollosdigital.com.br/wp-content/uploads/2024/09/bonus-conteudo.jpg" alt="" /></figure>
<h3>Aula de Automatização no Instagram</h3>
<figure><img width="600" height="600" src="https://pollosdigital.com.br/wp-content/uploads/2024/09/bonus-conteudo-1.jpg" alt="" /></figure>
<h3>Aula de Estratégias de Crescimento Rápido</h3>
<h2><b>DEPOIMENTOS</b> DE ALUNOS</h2>
<style>/*! elementor - v3.23.0 - 05-08-2024 */<br />
.elementor-widget-image-carousel .swiper,.elementor-widget-image-carousel .swiper-container{position:static}.elementor-widget-image-carousel .swiper-container .swiper-slide figure,.elementor-widget-image-carousel .swiper .swiper-slide figure{line-height:inherit}.elementor-widget-image-carousel .swiper-slide{text-align:center}.elementor-image-carousel-wrapper:not(.swiper-container-initialized):not(.swiper-initialized) .swiper-slide{max-width:calc(100% / var(--e-image-carousel-slides-to-show, 3))}</style>
<figure><img data-src="https://pollosdigital.com.br/wp-content/uploads/elementor/thumbs/print-qtxbn2n6ilhp1zawfi2fryht4hsnesuk6qk0sf9b7k.png" alt="print.png" /></figure>
<h2>COMO FAÇO PARA TER <b>ACESSO AO PROGRESSO DIGITAL</b>?</h2>
<h2>O treinamento progresso digital vai pegar na sua mão e mesmo sem experiência vai te levar a receber comissões todos os dias,  aqui abaixo<br />
você garante sua vaga e vem pro time de sucesso!<br />
</h2>
<p>			<a href="#"><br />
									QUERO MEU PROGRESSO<br />
					</a></p>
<h2>MAIS UMA FORMA DE <b>CONFIRMAR QUE VOCÊ PODE INICIAR</b></h2>
<p>													<img width="150" height="150" src="https://pollosdigital.com.br/wp-content/uploads/2024/09/SELO-GARANTIA-150x150.png" alt="" srcset="https://pollosdigital.com.br/wp-content/uploads/2024/09/SELO-GARANTIA-150x150.png 150w, https://pollosdigital.com.br/wp-content/uploads/2024/09/SELO-GARANTIA-300x300.png 300w, https://pollosdigital.com.br/wp-content/uploads/2024/09/SELO-GARANTIA.png 500w" sizes="(max-width: 150px) 100vw, 150px" />													</p>
<h2>Como o foco do Progresso Digital é levar liberdade financeira para o máximo de pessoas possível através do digital, <b>EU RESOLVI LIBERAR O TREINAMENTO COMPLETO GRATUITAMENTE PARA VOCÊ POR 7 DIAS.</b></p>
<p>Você tem 7 dias para testar todas as informações que serão passadas para você, e se achar que não é pra você basta uma única mensagem e devolvo todo seu dinheiro. </h2>
<h2><b>DÚVIDAS</b> COMUNS</h2>
<style>/*! elementor - v3.23.0 - 05-08-2024 */<br />
.elementor-toggle{text-align:start}.elementor-toggle .elementor-tab-title{font-weight:700;line-height:1;margin:0;padding:15px;border-bottom:1px solid #d5d8dc;cursor:pointer;outline:none}.elementor-toggle .elementor-tab-title .elementor-toggle-icon{display:inline-block;width:1em}.elementor-toggle .elementor-tab-title .elementor-toggle-icon svg{margin-inline-start:-5px;width:1em;height:1em}.elementor-toggle .elementor-tab-title .elementor-toggle-icon.elementor-toggle-icon-right{float:right;text-align:right}.elementor-toggle .elementor-tab-title .elementor-toggle-icon.elementor-toggle-icon-left{float:left;text-align:left}.elementor-toggle .elementor-tab-title .elementor-toggle-icon .elementor-toggle-icon-closed{display:block}.elementor-toggle .elementor-tab-title .elementor-toggle-icon .elementor-toggle-icon-opened{display:none}.elementor-toggle .elementor-tab-title.elementor-active{border-bottom:none}.elementor-toggle .elementor-tab-title.elementor-active .elementor-toggle-icon-closed{display:none}.elementor-toggle .elementor-tab-title.elementor-active .elementor-toggle-icon-opened{display:block}.elementor-toggle .elementor-tab-content{padding:15px;border-bottom:1px solid #d5d8dc;display:none}@media (max-width:767px){.elementor-toggle .elementor-tab-title{padding:12px}.elementor-toggle .elementor-tab-content{padding:12px 10px}}.e-con-inner>.elementor-widget-toggle,.e-con>.elementor-widget-toggle{width:var(--container-widget-width);--flex-grow:var(--container-widget-flex-grow)}</style>
<p>															<svg viewBox="0 0 320 512" xmlns="http://www.w3.org/2000/svg"><path d="M143 352.3L7 216.3c-9.4-9.4-9.4-24.6 0-33.9l22.6-22.6c9.4-9.4 24.6-9.4 33.9 0l96.4 96.4 96.4-96.4c9.4-9.4 24.6-9.4 33.9 0l22.6 22.6c9.4 9.4 9.4 24.6 0 33.9l-136 136c-9.2 9.4-24.4 9.4-33.8 0z"></path></svg><br />
								<svg viewBox="0 0 320 512" xmlns="http://www.w3.org/2000/svg"><path d="M177 159.7l136 136c9.4 9.4 9.4 24.6 0 33.9l-22.6 22.6c-9.4 9.4-24.6 9.4-33.9 0L160 255.9l-96.4 96.4c-9.4 9.4-24.6 9.4-33.9 0L7 329.7c-9.4-9.4-9.4-24.6 0-33.9l136-136c9.4-9.5 24.6-9.5 34-.1z"></path></svg><br />
												<a tabindex="0">Como funciona o suporte ?</a></p>
<p>Pela comunidade no telegram, pelo whatsapp, e por ligações semanais com o produtor.</p>
<p>															<svg viewBox="0 0 320 512" xmlns="http://www.w3.org/2000/svg"><path d="M143 352.3L7 216.3c-9.4-9.4-9.4-24.6 0-33.9l22.6-22.6c9.4-9.4 24.6-9.4 33.9 0l96.4 96.4 96.4-96.4c9.4-9.4 24.6-9.4 33.9 0l22.6 22.6c9.4 9.4 9.4 24.6 0 33.9l-136 136c-9.2 9.4-24.4 9.4-33.8 0z"></path></svg><br />
								<svg viewBox="0 0 320 512" xmlns="http://www.w3.org/2000/svg"><path d="M177 159.7l136 136c9.4 9.4 9.4 24.6 0 33.9l-22.6 22.6c-9.4 9.4-24.6 9.4-33.9 0L160 255.9l-96.4 96.4c-9.4 9.4-24.6 9.4-33.9 0L7 329.7c-9.4-9.4-9.4-24.6 0-33.9l136-136c9.4-9.5 24.6-9.5 34-.1z"></path></svg><br />
												<a tabindex="0">Preciso investir para aplicar as técnicas do curso?</a></p>
<p>Pode fazer sem investir, mas investindo você pode ganhar muito mais.</p>
<p>															<svg viewBox="0 0 320 512" xmlns="http://www.w3.org/2000/svg"><path d="M143 352.3L7 216.3c-9.4-9.4-9.4-24.6 0-33.9l22.6-22.6c9.4-9.4 24.6-9.4 33.9 0l96.4 96.4 96.4-96.4c9.4-9.4 24.6-9.4 33.9 0l22.6 22.6c9.4 9.4 9.4 24.6 0 33.9l-136 136c-9.2 9.4-24.4 9.4-33.8 0z"></path></svg><br />
								<svg viewBox="0 0 320 512" xmlns="http://www.w3.org/2000/svg"><path d="M177 159.7l136 136c9.4 9.4 9.4 24.6 0 33.9l-22.6 22.6c-9.4 9.4-24.6 9.4-33.9 0L160 255.9l-96.4 96.4c-9.4 9.4-24.6 9.4-33.9 0L7 329.7c-9.4-9.4-9.4-24.6 0-33.9l136-136c9.4-9.5 24.6-9.5 34-.1z"></path></svg><br />
												<a tabindex="0">Quanto tempo para iniciar os resultados?</a></p>
<p>Geralmente isso acontece em 25 dias, vários alunos iniciam antes mas respeite seu tempo, foque em fazer certo e o sucesso vem.</p>
<p>															<svg viewBox="0 0 320 512" xmlns="http://www.w3.org/2000/svg"><path d="M143 352.3L7 216.3c-9.4-9.4-9.4-24.6 0-33.9l22.6-22.6c9.4-9.4 24.6-9.4 33.9 0l96.4 96.4 96.4-96.4c9.4-9.4 24.6-9.4 33.9 0l22.6 22.6c9.4 9.4 9.4 24.6 0 33.9l-136 136c-9.2 9.4-24.4 9.4-33.8 0z"></path></svg><br />
								<svg viewBox="0 0 320 512" xmlns="http://www.w3.org/2000/svg"><path d="M177 159.7l136 136c9.4 9.4 9.4 24.6 0 33.9l-22.6 22.6c-9.4 9.4-24.6 9.4-33.9 0L160 255.9l-96.4 96.4c-9.4 9.4-24.6 9.4-33.9 0L7 329.7c-9.4-9.4-9.4-24.6 0-33.9l136-136c9.4-9.5 24.6-9.5 34-.1z"></path></svg><br />
												<a tabindex="0">Quanto tempo tenho acesso ao curso?</a></p>
<p>Acesso vitalício, inclusive acesso grátis as próximas atualizações lá dentro.</p>
<h2>Copyright © Paginas de Alta Conversão</h2>
""";

    var modeloCurriculo2 = '''<!DOCTYPE html>
<html lang="pt-PT">
<head>
	<meta charset="UTF-8">
		<title>Leonardo v02 &#8211; Pollos Digital</title>
<meta name='robots' content='max-image-preview:large' />
<link rel="alternate" type="application/rss+xml" title="Pollos Digital &raquo; Feed" href="https://pollosdigital.com.br/feed/" />
<link rel="alternate" type="application/rss+xml" title="Pollos Digital &raquo; Feed de comentários" href="https://pollosdigital.com.br/comments/feed/" />
<link rel="alternate" type="application/rss+xml" title="Feed de comentários de Pollos Digital &raquo; Leonardo v02" href="https://pollosdigital.com.br/2024/09/17/leonardo-v02/feed/" />
<script>
window._wpemojiSettings = {"baseUrl":"https:\/\/s.w.org\/images\/core\/emoji\/15.0.3\/72x72\/","ext":".png","svgUrl":"https:\/\/s.w.org\/images\/core\/emoji\/15.0.3\/svg\/","svgExt":".svg","source":{"concatemoji":"https:\/\/pollosdigital.com.br\/wp-includes\/js\/wp-emoji-release.min.js?ver=6.6.2"}};
/*! This file is auto-generated */
!function(i,n){var o,s,e;function c(e){try{var t={supportTests:e,timestamp:(new Date).valueOf()};sessionStorage.setItem(o,JSON.stringify(t))}catch(e){}}function p(e,t,n){e.clearRect(0,0,e.canvas.width,e.canvas.height),e.fillText(t,0,0);var t=new Uint32Array(e.getImageData(0,0,e.canvas.width,e.canvas.height).data),r=(e.clearRect(0,0,e.canvas.width,e.canvas.height),e.fillText(n,0,0),new Uint32Array(e.getImageData(0,0,e.canvas.width,e.canvas.height).data));return t.every(function(e,t){return e===r[t]})}function u(e,t,n){switch(t){case"flag":return n(e,"\ud83c\udff3\ufe0f\u200d\u26a7\ufe0f","\ud83c\udff3\ufe0f\u200b\u26a7\ufe0f")?!1:!n(e,"\ud83c\uddfa\ud83c\uddf3","\ud83c\uddfa\u200b\ud83c\uddf3")&&!n(e,"\ud83c\udff4\udb40\udc67\udb40\udc62\udb40\udc65\udb40\udc6e\udb40\udc67\udb40\udc7f","\ud83c\udff4\u200b\udb40\udc67\u200b\udb40\udc62\u200b\udb40\udc65\u200b\udb40\udc6e\u200b\udb40\udc67\u200b\udb40\udc7f");case"emoji":return!n(e,"\ud83d\udc26\u200d\u2b1b","\ud83d\udc26\u200b\u2b1b")}return!1}function f(e,t,n){var r="undefined"!=typeof WorkerGlobalScope&&self instanceof WorkerGlobalScope?new OffscreenCanvas(300,150):i.createElement("canvas"),a=r.getContext("2d",{willReadFrequently:!0}),o=(a.textBaseline="top",a.font="600 32px Arial",{});return e.forEach(function(e){o[e]=t(a,e,n)}),o}function t(e){var t=i.createElement("script");t.src=e,t.defer=!0,i.head.appendChild(t)}"undefined"!=typeof Promise&&(o="wpEmojiSettingsSupports",s=["flag","emoji"],n.supports={everything:!0,everythingExceptFlag:!0},e=new Promise(function(e){i.addEventListener("DOMContentLoaded",e,{once:!0})}),new Promise(function(t){var n=function(){try{var e=JSON.parse(sessionStorage.getItem(o));if("object"==typeof e&&"number"==typeof e.timestamp&&(new Date).valueOf()<e.timestamp+604800&&"object"==typeof e.supportTests)return e.supportTests}catch(e){}return null}();if(!n){if("undefined"!=typeof Worker&&"undefined"!=typeof OffscreenCanvas&&"undefined"!=typeof URL&&URL.createObjectURL&&"undefined"!=typeof Blob)try{var e="postMessage("+f.toString()+"("+[JSON.stringify(s),u.toString(),p.toString()].join(",")+"));",r=new Blob([e],{type:"text/javascript"}),a=new Worker(URL.createObjectURL(r),{name:"wpTestEmojiSupports"});return void(a.onmessage=function(e){c(n=e.data),a.terminate(),t(n)})}catch(e){}c(n=f(s,u,p))}t(n)}).then(function(e){for(var t in e)n.supports[t]=e[t],n.supports.everything=n.supports.everything&&n.supports[t],"flag"!==t&&(n.supports.everythingExceptFlag=n.supports.everythingExceptFlag&&n.supports[t]);n.supports.everythingExceptFlag=n.supports.everythingExceptFlag&&!n.supports.flag,n.DOMReady=!1,n.readyCallback=function(){n.DOMReady=!0}}).then(function(){return e}).then(function(){var e;n.supports.everything||(n.readyCallback(),(e=n.source||{}).concatemoji?t(e.concatemoji):e.wpemoji&&e.twemoji&&(t(e.twemoji),t(e.wpemoji)))}))}((window,document),window._wpemojiSettings);
</script>
<link rel='stylesheet' id='dashicons-css' href='https://pollosdigital.com.br/wp-includes/css/dashicons.min.css?ver=6.6.2' media='all' />
<link rel='stylesheet' id='admin-bar-css' href='https://pollosdigital.com.br/wp-includes/css/admin-bar.min.css?ver=6.6.2' media='all' />
<style id='admin-bar-inline-css'>

		@media screen { html { margin-top: 32px !important; } }
		@media screen and ( max-width: 782px ) { html { margin-top: 46px !important; } }
	
@media print { #wpadminbar { display:none; } }
</style>
<link rel='stylesheet' id='elementor-icons-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/lib/eicons/css/elementor-icons.min.css?ver=5.31.0' media='all' />
<link rel='stylesheet' id='elementor-common-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/css/common.min.css?ver=3.24.2' media='all' />
<link rel='stylesheet' id='e-theme-ui-light-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/css/theme-light.min.css?ver=3.24.2' media='all' />
<style id='wp-emoji-styles-inline-css'>

	img.wp-smiley, img.emoji {
		display: inline !important;
		border: none !important;
		box-shadow: none !important;
		height: 1em !important;
		width: 1em !important;
		margin: 0 0.07em !important;
		vertical-align: -0.1em !important;
		background: none !important;
		padding: 0 !important;
	}
</style>
<style id='classic-theme-styles-inline-css'>
/*! This file is auto-generated */
.wp-block-button__link{color:#fff;background-color:#32373c;border-radius:9999px;box-shadow:none;text-decoration:none;padding:calc(.667em + 2px) calc(1.333em + 2px);font-size:1.125em}.wp-block-file__button{background:#32373c;color:#fff;text-decoration:none}
</style>
<style id='global-styles-inline-css'>
:root{--wp--preset--aspect-ratio--square: 1;--wp--preset--aspect-ratio--4-3: 4/3;--wp--preset--aspect-ratio--3-4: 3/4;--wp--preset--aspect-ratio--3-2: 3/2;--wp--preset--aspect-ratio--2-3: 2/3;--wp--preset--aspect-ratio--16-9: 16/9;--wp--preset--aspect-ratio--9-16: 9/16;--wp--preset--color--black: #000000;--wp--preset--color--cyan-bluish-gray: #abb8c3;--wp--preset--color--white: #ffffff;--wp--preset--color--pale-pink: #f78da7;--wp--preset--color--vivid-red: #cf2e2e;--wp--preset--color--luminous-vivid-orange: #ff6900;--wp--preset--color--luminous-vivid-amber: #fcb900;--wp--preset--color--light-green-cyan: #7bdcb5;--wp--preset--color--vivid-green-cyan: #00d084;--wp--preset--color--pale-cyan-blue: #8ed1fc;--wp--preset--color--vivid-cyan-blue: #0693e3;--wp--preset--color--vivid-purple: #9b51e0;--wp--preset--gradient--vivid-cyan-blue-to-vivid-purple: linear-gradient(135deg,rgba(6,147,227,1) 0%,rgb(155,81,224) 100%);--wp--preset--gradient--light-green-cyan-to-vivid-green-cyan: linear-gradient(135deg,rgb(122,220,180) 0%,rgb(0,208,130) 100%);--wp--preset--gradient--luminous-vivid-amber-to-luminous-vivid-orange: linear-gradient(135deg,rgba(252,185,0,1) 0%,rgba(255,105,0,1) 100%);--wp--preset--gradient--luminous-vivid-orange-to-vivid-red: linear-gradient(135deg,rgba(255,105,0,1) 0%,rgb(207,46,46) 100%);--wp--preset--gradient--very-light-gray-to-cyan-bluish-gray: linear-gradient(135deg,rgb(238,238,238) 0%,rgb(169,184,195) 100%);--wp--preset--gradient--cool-to-warm-spectrum: linear-gradient(135deg,rgb(74,234,220) 0%,rgb(151,120,209) 20%,rgb(207,42,186) 40%,rgb(238,44,130) 60%,rgb(251,105,98) 80%,rgb(254,248,76) 100%);--wp--preset--gradient--blush-light-purple: linear-gradient(135deg,rgb(255,206,236) 0%,rgb(152,150,240) 100%);--wp--preset--gradient--blush-bordeaux: linear-gradient(135deg,rgb(254,205,165) 0%,rgb(254,45,45) 50%,rgb(107,0,62) 100%);--wp--preset--gradient--luminous-dusk: linear-gradient(135deg,rgb(255,203,112) 0%,rgb(199,81,192) 50%,rgb(65,88,208) 100%);--wp--preset--gradient--pale-ocean: linear-gradient(135deg,rgb(255,245,203) 0%,rgb(182,227,212) 50%,rgb(51,167,181) 100%);--wp--preset--gradient--electric-grass: linear-gradient(135deg,rgb(202,248,128) 0%,rgb(113,206,126) 100%);--wp--preset--gradient--midnight: linear-gradient(135deg,rgb(2,3,129) 0%,rgb(40,116,252) 100%);--wp--preset--font-size--small: 13px;--wp--preset--font-size--medium: 20px;--wp--preset--font-size--large: 36px;--wp--preset--font-size--x-large: 42px;--wp--preset--spacing--20: 0.44rem;--wp--preset--spacing--30: 0.67rem;--wp--preset--spacing--40: 1rem;--wp--preset--spacing--50: 1.5rem;--wp--preset--spacing--60: 2.25rem;--wp--preset--spacing--70: 3.38rem;--wp--preset--spacing--80: 5.06rem;--wp--preset--shadow--natural: 6px 6px 9px rgba(0, 0, 0, 0.2);--wp--preset--shadow--deep: 12px 12px 50px rgba(0, 0, 0, 0.4);--wp--preset--shadow--sharp: 6px 6px 0px rgba(0, 0, 0, 0.2);--wp--preset--shadow--outlined: 6px 6px 0px -3px rgba(255, 255, 255, 1), 6px 6px rgba(0, 0, 0, 1);--wp--preset--shadow--crisp: 6px 6px 0px rgba(0, 0, 0, 1);}:where(.is-layout-flex){gap: 0.5em;}:where(.is-layout-grid){gap: 0.5em;}body .is-layout-flex{display: flex;}.is-layout-flex{flex-wrap: wrap;align-items: center;}.is-layout-flex > :is(*, div){margin: 0;}body .is-layout-grid{display: grid;}.is-layout-grid > :is(*, div){margin: 0;}:where(.wp-block-columns.is-layout-flex){gap: 2em;}:where(.wp-block-columns.is-layout-grid){gap: 2em;}:where(.wp-block-post-template.is-layout-flex){gap: 1.25em;}:where(.wp-block-post-template.is-layout-grid){gap: 1.25em;}.has-black-color{color: var(--wp--preset--color--black) !important;}.has-cyan-bluish-gray-color{color: var(--wp--preset--color--cyan-bluish-gray) !important;}.has-white-color{color: var(--wp--preset--color--white) !important;}.has-pale-pink-color{color: var(--wp--preset--color--pale-pink) !important;}.has-vivid-red-color{color: var(--wp--preset--color--vivid-red) !important;}.has-luminous-vivid-orange-color{color: var(--wp--preset--color--luminous-vivid-orange) !important;}.has-luminous-vivid-amber-color{color: var(--wp--preset--color--luminous-vivid-amber) !important;}.has-light-green-cyan-color{color: var(--wp--preset--color--light-green-cyan) !important;}.has-vivid-green-cyan-color{color: var(--wp--preset--color--vivid-green-cyan) !important;}.has-pale-cyan-blue-color{color: var(--wp--preset--color--pale-cyan-blue) !important;}.has-vivid-cyan-blue-color{color: var(--wp--preset--color--vivid-cyan-blue) !important;}.has-vivid-purple-color{color: var(--wp--preset--color--vivid-purple) !important;}.has-black-background-color{background-color: var(--wp--preset--color--black) !important;}.has-cyan-bluish-gray-background-color{background-color: var(--wp--preset--color--cyan-bluish-gray) !important;}.has-white-background-color{background-color: var(--wp--preset--color--white) !important;}.has-pale-pink-background-color{background-color: var(--wp--preset--color--pale-pink) !important;}.has-vivid-red-background-color{background-color: var(--wp--preset--color--vivid-red) !important;}.has-luminous-vivid-orange-background-color{background-color: var(--wp--preset--color--luminous-vivid-orange) !important;}.has-luminous-vivid-amber-background-color{background-color: var(--wp--preset--color--luminous-vivid-amber) !important;}.has-light-green-cyan-background-color{background-color: var(--wp--preset--color--light-green-cyan) !important;}.has-vivid-green-cyan-background-color{background-color: var(--wp--preset--color--vivid-green-cyan) !important;}.has-pale-cyan-blue-background-color{background-color: var(--wp--preset--color--pale-cyan-blue) !important;}.has-vivid-cyan-blue-background-color{background-color: var(--wp--preset--color--vivid-cyan-blue) !important;}.has-vivid-purple-background-color{background-color: var(--wp--preset--color--vivid-purple) !important;}.has-black-border-color{border-color: var(--wp--preset--color--black) !important;}.has-cyan-bluish-gray-border-color{border-color: var(--wp--preset--color--cyan-bluish-gray) !important;}.has-white-border-color{border-color: var(--wp--preset--color--white) !important;}.has-pale-pink-border-color{border-color: var(--wp--preset--color--pale-pink) !important;}.has-vivid-red-border-color{border-color: var(--wp--preset--color--vivid-red) !important;}.has-luminous-vivid-orange-border-color{border-color: var(--wp--preset--color--luminous-vivid-orange) !important;}.has-luminous-vivid-amber-border-color{border-color: var(--wp--preset--color--luminous-vivid-amber) !important;}.has-light-green-cyan-border-color{border-color: var(--wp--preset--color--light-green-cyan) !important;}.has-vivid-green-cyan-border-color{border-color: var(--wp--preset--color--vivid-green-cyan) !important;}.has-pale-cyan-blue-border-color{border-color: var(--wp--preset--color--pale-cyan-blue) !important;}.has-vivid-cyan-blue-border-color{border-color: var(--wp--preset--color--vivid-cyan-blue) !important;}.has-vivid-purple-border-color{border-color: var(--wp--preset--color--vivid-purple) !important;}.has-vivid-cyan-blue-to-vivid-purple-gradient-background{background: var(--wp--preset--gradient--vivid-cyan-blue-to-vivid-purple) !important;}.has-light-green-cyan-to-vivid-green-cyan-gradient-background{background: var(--wp--preset--gradient--light-green-cyan-to-vivid-green-cyan) !important;}.has-luminous-vivid-amber-to-luminous-vivid-orange-gradient-background{background: var(--wp--preset--gradient--luminous-vivid-amber-to-luminous-vivid-orange) !important;}.has-luminous-vivid-orange-to-vivid-red-gradient-background{background: var(--wp--preset--gradient--luminous-vivid-orange-to-vivid-red) !important;}.has-very-light-gray-to-cyan-bluish-gray-gradient-background{background: var(--wp--preset--gradient--very-light-gray-to-cyan-bluish-gray) !important;}.has-cool-to-warm-spectrum-gradient-background{background: var(--wp--preset--gradient--cool-to-warm-spectrum) !important;}.has-blush-light-purple-gradient-background{background: var(--wp--preset--gradient--blush-light-purple) !important;}.has-blush-bordeaux-gradient-background{background: var(--wp--preset--gradient--blush-bordeaux) !important;}.has-luminous-dusk-gradient-background{background: var(--wp--preset--gradient--luminous-dusk) !important;}.has-pale-ocean-gradient-background{background: var(--wp--preset--gradient--pale-ocean) !important;}.has-electric-grass-gradient-background{background: var(--wp--preset--gradient--electric-grass) !important;}.has-midnight-gradient-background{background: var(--wp--preset--gradient--midnight) !important;}.has-small-font-size{font-size: var(--wp--preset--font-size--small) !important;}.has-medium-font-size{font-size: var(--wp--preset--font-size--medium) !important;}.has-large-font-size{font-size: var(--wp--preset--font-size--large) !important;}.has-x-large-font-size{font-size: var(--wp--preset--font-size--x-large) !important;}
:where(.wp-block-post-template.is-layout-flex){gap: 1.25em;}:where(.wp-block-post-template.is-layout-grid){gap: 1.25em;}
:where(.wp-block-columns.is-layout-flex){gap: 2em;}:where(.wp-block-columns.is-layout-grid){gap: 2em;}
:root :where(.wp-block-pullquote){font-size: 1.5em;line-height: 1.6;}
</style>
<link rel='stylesheet' id='hello-elementor-css' href='https://pollosdigital.com.br/wp-content/themes/hello-elementor/style.min.css?ver=3.1.1' media='all' />
<link rel='stylesheet' id='hello-elementor-theme-style-css' href='https://pollosdigital.com.br/wp-content/themes/hello-elementor/theme.min.css?ver=3.1.1' media='all' />
<link rel='stylesheet' id='hello-elementor-header-footer-css' href='https://pollosdigital.com.br/wp-content/themes/hello-elementor/header-footer.min.css?ver=3.1.1' media='all' />
<link rel='stylesheet' id='elementor-frontend-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/css/frontend.min.css?ver=3.24.2' media='all' />
<link rel='stylesheet' id='elementor-post-8-css' href='https://pollosdigital.com.br/wp-content/uploads/elementor/css/post-8.css?ver=1726670858' media='all' />
<link rel='stylesheet' id='elementor-pro-notes-frontend-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor-pro/assets/css/modules/notes/frontend.min.css?ver=3.24.1' media='all' />
<link rel='stylesheet' id='swiper-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/lib/swiper/v8/css/swiper.min.css?ver=8.4.5' media='all' />
<link rel='stylesheet' id='e-swiper-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/css/conditionals/e-swiper.min.css?ver=3.24.2' media='all' />
<link rel='stylesheet' id='elementor-wp-admin-bar-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/css/admin-bar.min.css?ver=3.24.2' media='all' />
<link rel='stylesheet' id='elementor-pro-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor-pro/assets/css/frontend.min.css?ver=3.24.1' media='all' />
<link rel='stylesheet' id='elementor-global-css' href='https://pollosdigital.com.br/wp-content/uploads/elementor/css/global.css?ver=1726670859' media='all' />
<link rel='stylesheet' id='widget-heading-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/css/widget-heading.min.css?ver=3.24.2' media='all' />
<link rel='stylesheet' id='widget-divider-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/css/widget-divider.min.css?ver=3.24.2' media='all' />
<link rel='stylesheet' id='widget-icon-box-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/css/widget-icon-box.min.css?ver=3.24.2' media='all' />
<link rel='stylesheet' id='widget-text-editor-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/css/widget-text-editor.min.css?ver=3.24.2' media='all' />
<link rel='stylesheet' id='elementor-post-3564-css' href='https://pollosdigital.com.br/wp-content/uploads/elementor/css/post-3564.css?ver=1726676857' media='all' />
<link rel='stylesheet' id='google-fonts-1-css' href='https://fonts.googleapis.com/css?family=Roboto%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic%7CRoboto+Slab%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic&#038;display=swap&#038;ver=6.6.2' media='all' />
<link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin><script src="https://pollosdigital.com.br/wp-includes/js/jquery/jquery.min.js?ver=3.7.1" id="jquery-core-js"></script>
<script src="https://pollosdigital.com.br/wp-includes/js/jquery/jquery-migrate.min.js?ver=3.4.1" id="jquery-migrate-js"></script>
<script id="elementor-pro-app-js-before">
var elementorAppProConfig = {"baseUrl":"https:\/\/pollosdigital.com.br\/wp-content\/plugins\/elementor-pro\/","site-editor":{"urls":{"legacy_view":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?post_type=elementor_library&tabs_group=theme"},"utms":{"utm_source":"theme-builder","utm_medium":"wp-dash"}},"kit-library":[],"onboarding":[],"import-export":[]};
</script>
<link rel="https://api.w.org/" href="https://pollosdigital.com.br/wp-json/" /><link rel="alternate" title="JSON" type="application/json" href="https://pollosdigital.com.br/wp-json/wp/v2/posts/3564" /><link rel="EditURI" type="application/rsd+xml" title="RSD" href="https://pollosdigital.com.br/xmlrpc.php?rsd" />
<meta name="generator" content="WordPress 6.6.2" />
<link rel="canonical" href="https://pollosdigital.com.br/2024/09/17/leonardo-v02/" />
<link rel='shortlink' href='https://pollosdigital.com.br/?p=3564' />
<link rel="alternate" title="oEmbed (JSON)" type="application/json+oembed" href="https://pollosdigital.com.br/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fpollosdigital.com.br%2F2024%2F09%2F17%2Fleonardo-v02%2F" />
<link rel="alternate" title="oEmbed (XML)" type="text/xml+oembed" href="https://pollosdigital.com.br/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fpollosdigital.com.br%2F2024%2F09%2F17%2Fleonardo-v02%2F&#038;format=xml" />
<meta name="generator" content="Elementor 3.24.2; features: e_font_icon_svg, additional_custom_breakpoints, e_optimized_control_loading, e_element_cache; settings: css_print_method-external, google_font-enabled, font_display-swap">
			<style>
				.e-con.e-parent:nth-of-type(n+4):not(.e-lazyloaded):not(.e-no-lazyload),
				.e-con.e-parent:nth-of-type(n+4):not(.e-lazyloaded):not(.e-no-lazyload) * {
					background-image: none !important;
				}
				@media screen and (max-height: 1024px) {
					.e-con.e-parent:nth-of-type(n+3):not(.e-lazyloaded):not(.e-no-lazyload),
					.e-con.e-parent:nth-of-type(n+3):not(.e-lazyloaded):not(.e-no-lazyload) * {
						background-image: none !important;
					}
				}
				@media screen and (max-height: 640px) {
					.e-con.e-parent:nth-of-type(n+2):not(.e-lazyloaded):not(.e-no-lazyload),
					.e-con.e-parent:nth-of-type(n+2):not(.e-lazyloaded):not(.e-no-lazyload) * {
						background-image: none !important;
					}
				}
			</style>
				<meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover" /></head>
<body class="post-template post-template-elementor_canvas single single-post postid-3564 single-format-standard logged-in admin-bar no-customize-support wp-custom-logo elementor-default elementor-template-canvas elementor-kit-8 elementor-page elementor-page-3564">
	<script>
		(function() {
			var request, b = document.body, c = 'className', cs = 'customize-support', rcs = new RegExp('(^|\\s+)(no-)?'+cs+'(\\s+|\$)');

				request = true;
	
			b[c] = b[c].replace( rcs, ' ' );
			// The customizer requires postMessage and CORS (if the site is cross domain).
			b[c] += ( window.postMessage && request ? ' ' : ' no-' ) + cs;
		}());
	
</script>
		<div id="wpadminbar" class="nojq nojs">
						<div class="quicklinks" id="wp-toolbar" role="navigation" aria-label="Barra de ferramentas">
				<ul role='menu' id='wp-admin-bar-root-default' class="ab-top-menu"><li role='group' id='wp-admin-bar-wp-logo' class="menupop"><a class='ab-item' role="menuitem" aria-expanded="false" href='https://pollosdigital.com.br/wp-admin/about.php'><span class="ab-icon" aria-hidden="true"></span><span class="screen-reader-text">Sobre o WordPress</span></a><div class="ab-sub-wrapper"><ul role='menu' aria-label='Sobre o WordPress' id='wp-admin-bar-wp-logo-default' class="ab-submenu"><li role='group' id='wp-admin-bar-about'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/about.php'>Sobre o WordPress</a></li><li role='group' id='wp-admin-bar-contribute'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/contribute.php'>Participe</a></li></ul><ul role='menu' aria-label='Sobre o WordPress' id='wp-admin-bar-wp-logo-external' class="ab-sub-secondary ab-submenu"><li role='group' id='wp-admin-bar-wporg'><a class='ab-item' role="menuitem" href='https://pt.wordpress.org/'>WordPress.org</a></li><li role='group' id='wp-admin-bar-documentation'><a class='ab-item' role="menuitem" href='https://wordpress.org/documentation/'>Documentação</a></li><li role='group' id='wp-admin-bar-learn'><a class='ab-item' role="menuitem" href='https://learn.wordpress.org/'>Learn WordPress</a></li><li role='group' id='wp-admin-bar-support-forums'><a class='ab-item' role="menuitem" href='https://pt.wordpress.org/support/forums/'>Suporte</a></li><li role='group' id='wp-admin-bar-feedback'><a class='ab-item' role="menuitem" href='https://wordpress.org/support/forum/requests-and-feedback'>Feedback</a></li></ul></div></li><li role='group' id='wp-admin-bar-site-name' class="menupop"><a class='ab-item' role="menuitem" aria-expanded="false" href='https://pollosdigital.com.br/wp-admin/'>Pollos Digital</a><div class="ab-sub-wrapper"><ul role='menu' aria-label='Pollos Digital' id='wp-admin-bar-site-name-default' class="ab-submenu"><li role='group' id='wp-admin-bar-dashboard'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/'>Painel</a></li><li role='group' id='wp-admin-bar-plugins'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/plugins.php'>Plugins</a></li></ul><ul role='menu' aria-label='Pollos Digital' id='wp-admin-bar-appearance' class="ab-submenu"><li role='group' id='wp-admin-bar-themes'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/themes.php'>Temas</a></li><li role='group' id='wp-admin-bar-menus'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/nav-menus.php'>Menus</a></li></ul></div></li><li role='group' id='wp-admin-bar-customize' class="hide-if-no-customize"><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/customize.php?url=https%3A%2F%2Fpollosdigital.com.br%2F2024%2F09%2F17%2Fleonardo-v02%2F'>Personalizar</a></li><li role='group' id='wp-admin-bar-updates'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/update-core.php'><span class="ab-icon" aria-hidden="true"></span><span class="ab-label" aria-hidden="true">2</span><span class="screen-reader-text updates-available-text">2 actualizações disponíveis</span></a></li><li role='group' id='wp-admin-bar-comments'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/edit-comments.php'><span class="ab-icon" aria-hidden="true"></span><span class="ab-label awaiting-mod pending-count count-0" aria-hidden="true">0</span><span class="screen-reader-text comments-in-moderation-text">0 comentários em moderação</span></a></li><li role='group' id='wp-admin-bar-new-content' class="menupop"><a class='ab-item' role="menuitem" aria-expanded="false" href='https://pollosdigital.com.br/wp-admin/post-new.php'><span class="ab-icon" aria-hidden="true"></span><span class="ab-label">Adicionar</span></a><div class="ab-sub-wrapper"><ul role='menu' aria-label='Adicionar' id='wp-admin-bar-new-content-default' class="ab-submenu"><li role='group' id='wp-admin-bar-new-post'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/post-new.php'>Artigo</a></li><li role='group' id='wp-admin-bar-new-media'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/media-new.php'>Multimédia</a></li><li role='group' id='wp-admin-bar-new-page'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/post-new.php?post_type=page'>Página</a></li><li role='group' id='wp-admin-bar-new-e-floating-buttons'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/edit.php?action=elementor_new_post&#038;post_type=e-floating-buttons&#038;template_type=floating-buttons&#038;_wpnonce=13c7aba68d'>Floating Element</a></li><li role='group' id='wp-admin-bar-new-elementor_library'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/post-new.php?post_type=elementor_library'>Modelo</a></li><li role='group' id='wp-admin-bar-new-user'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/user-new.php'>Utilizador</a></li></ul></div></li><li role='group' id='wp-admin-bar-edit'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/post.php?post=3564&#038;action=edit'>Editar artigo</a></li><li role='group' id='wp-admin-bar-epc_purge_menu' class="menupop"><div class="ab-item ab-empty-item" role="menuitem" aria-expanded="false">Caching</div><div class="ab-sub-wrapper"><ul role='menu' id='wp-admin-bar-epc_purge_menu-default' class="ab-submenu"><li role='group' id='wp-admin-bar-epc_purge_menu-purge_all'><a class='ab-item' role="menuitem" href='/2024/09/17/leonardo-v02/?epc_purge_all=1'>Purge All</a></li><li role='group' id='wp-admin-bar-epc_purge_menu-purge_single'><a class='ab-item' role="menuitem" href='/2024/09/17/leonardo-v02/?epc_purge_single=1'>Purge This Page</a></li><li role='group' id='wp-admin-bar-epc_purge_menu-cache_settings'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/options-general.php#epc_settings'>Cache Settings</a></li></ul></div></li><li role='group' id='wp-admin-bar-elementor_notes'><a class='ab-item' role="menuitem" href='#'>Notes</a></li></ul><ul role='menu' id='wp-admin-bar-top-secondary' class="ab-top-secondary ab-top-menu"><li role='group' id='wp-admin-bar-my-account' class="menupop with-avatar"><a class='ab-item' role="menuitem" aria-expanded="false" href='https://pollosdigital.com.br/wp-admin/profile.php'>Olá, <span class="display-name">rafa</span><img alt='' src='https://secure.gravatar.com/avatar/c3df3500de6a169abe00d2ac564a0c40?s=26&#038;d=mm&#038;r=g' srcset='https://secure.gravatar.com/avatar/c3df3500de6a169abe00d2ac564a0c40?s=52&#038;d=mm&#038;r=g 2x' class='avatar avatar-26 photo' height='26' width='26' decoding='async'/></a><div class="ab-sub-wrapper"><ul role='menu' aria-label='Olá, rafa' id='wp-admin-bar-user-actions' class="ab-submenu"><li role='group' id='wp-admin-bar-user-info'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/profile.php'><img alt='' src='https://secure.gravatar.com/avatar/c3df3500de6a169abe00d2ac564a0c40?s=64&#038;d=mm&#038;r=g' srcset='https://secure.gravatar.com/avatar/c3df3500de6a169abe00d2ac564a0c40?s=128&#038;d=mm&#038;r=g 2x' class='avatar avatar-64 photo' height='64' width='64' decoding='async'/><span class='display-name'>rafa</span><span class='display-name edit-profile'>Editar perfil</span></a></li><li role='group' id='wp-admin-bar-logout'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-login.php?action=logout&#038;_wpnonce=4bf2853d8d'>Terminar sessão</a></li></ul></div></li><li role='group' id='wp-admin-bar-search' class="admin-bar-search"><div class="ab-item ab-empty-item" tabindex="-1" role="menuitem"><form action="https://pollosdigital.com.br/" method="get" id="adminbarsearch"><input class="adminbar-input" name="s" id="adminbar-search" type="text" value="" maxlength="150" /><label for="adminbar-search" class="screen-reader-text">Pesquisar</label><input type="submit" class="adminbar-button" value="Pesquisar" /></form></div></li></ul>			</div>
		</div>

				<div data-elementor-type="wp-post" data-elementor-id="3564" class="elementor elementor-3564" data-elementor-post-type="post">
				<div class="elementor-element elementor-element-a16edd6 e-flex e-con-boxed e-con e-parent" data-id="a16edd6" data-element_type="container">
					<div class="e-con-inner">
				<div class="elementor-element elementor-element-50bd8f7 elementor-widget elementor-widget-heading" data-id="50bd8f7" data-element_type="widget" data-widget_type="heading.default">
				<div class="elementor-widget-container">
			<h2 class="elementor-heading-title elementor-size-default">${curriculoModel?.nome}</h2>		</div>
				</div>
				<div class="elementor-element elementor-element-f7497cc elementor-widget-divider--view-line elementor-widget elementor-widget-divider" data-id="f7497cc" data-element_type="widget" data-widget_type="divider.default">
				<div class="elementor-widget-container">
					<div class="elementor-divider">
			<span class="elementor-divider-separator">
						</span>
		</div>
				</div>
				</div>
					</div>
				</div>
		<div class="elementor-element elementor-element-daa68a8 e-flex e-con-boxed e-con e-parent" data-id="daa68a8" data-element_type="container">
					<div class="e-con-inner">
				<div class="elementor-element elementor-element-d11dd82 elementor-position-left elementor-mobile-position-left elementor-view-default elementor-vertical-align-top elementor-widget elementor-widget-icon-box" data-id="d11dd82" data-element_type="widget" data-widget_type="icon-box.default">
				<div class="elementor-widget-container">
					<div class="elementor-icon-box-wrapper">

						<div class="elementor-icon-box-icon">
				<span  class="elementor-icon elementor-animation-">
				<svg aria-hidden="true" class="e-font-icon-svg e-far-envelope" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="M464 64H48C21.49 64 0 85.49 0 112v288c0 26.51 21.49 48 48 48h416c26.51 0 48-21.49 48-48V112c0-26.51-21.49-48-48-48zm0 48v40.805c-22.422 18.259-58.168 46.651-134.587 106.49-16.841 13.247-50.201 45.072-73.413 44.701-23.208.375-56.579-31.459-73.413-44.701C106.18 199.465 70.425 171.067 48 152.805V112h416zM48 400V214.398c22.914 18.251 55.409 43.862 104.938 82.646 21.857 17.205 60.134 55.186 103.062 54.955 42.717.231 80.509-37.199 103.053-54.947 49.528-38.783 82.032-64.401 104.947-82.653V400H48z"></path></svg>				</span>
			</div>
			
						<div class="elementor-icon-box-content">

									<h3 class="elementor-icon-box-title">
						<span  >
							${curriculoModel?.email}						</span>
					</h3>
				
				
			</div>
			
		</div>
				</div>
				</div>
				<div class="elementor-element elementor-element-f949edb elementor-position-left elementor-mobile-position-left elementor-view-default elementor-vertical-align-top elementor-widget elementor-widget-icon-box" data-id="f949edb" data-element_type="widget" data-widget_type="icon-box.default">
				<div class="elementor-widget-container">
					<div class="elementor-icon-box-wrapper">

						<div class="elementor-icon-box-icon">
				<span  class="elementor-icon elementor-animation-">
				<svg aria-hidden="true" class="e-font-icon-svg e-fas-phone-alt" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="M497.39 361.8l-112-48a24 24 0 0 0-28 6.9l-49.6 60.6A370.66 370.66 0 0 1 130.6 204.11l60.6-49.6a23.94 23.94 0 0 0 6.9-28l-48-112A24.16 24.16 0 0 0 122.6.61l-104 24A24 24 0 0 0 0 48c0 256.5 207.9 464 464 464a24 24 0 0 0 23.4-18.6l24-104a24.29 24.29 0 0 0-14.01-27.6z"></path></svg>				</span>
			</div>
			
						<div class="elementor-icon-box-content">

									<h3 class="elementor-icon-box-title">
						<span  >
							${curriculoModel?.telefone}						</span>
					</h3>
				
				
			</div>
			
		</div>
				</div>
				</div>
				<div class="elementor-element elementor-element-cd6514f elementor-widget elementor-widget-heading" data-id="cd6514f" data-element_type="widget" data-widget_type="heading.default">
				<div class="elementor-widget-container">
			<h2 class="elementor-heading-title elementor-size-default">Resumo Profissional</h2>		</div>
				</div>
				<div class="elementor-element elementor-element-6d42771 elementor-widget-divider--view-line elementor-widget elementor-widget-divider" data-id="6d42771" data-element_type="widget" data-widget_type="divider.default">
				<div class="elementor-widget-container">
					<div class="elementor-divider">
			<span class="elementor-divider-separator">
						</span>
		</div>
				</div>
				</div>
				<div class="elementor-element elementor-element-620273c elementor-widget elementor-widget-text-editor" data-id="620273c" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
							<p>${curriculoModel?.resumo}</p>						</div>
				</div>
				<div class="elementor-element elementor-element-a5968ac elementor-widget elementor-widget-heading" data-id="a5968ac" data-element_type="widget" data-widget_type="heading.default">
				<div class="elementor-widget-container">
			<h2 class="elementor-heading-title elementor-size-default">Objetivo</h2>		</div>
				</div>
				<div class="elementor-element elementor-element-d10054e elementor-widget-divider--view-line elementor-widget elementor-widget-divider" data-id="d10054e" data-element_type="widget" data-widget_type="divider.default">
				<div class="elementor-widget-container">
					<div class="elementor-divider">
			<span class="elementor-divider-separator">
						</span>
		</div>
				</div>
				</div>
				<div class="elementor-element elementor-element-8d86844 elementor-widget elementor-widget-text-editor" data-id="8d86844" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
							<p>${curriculoModel?.resumo}</p>						</div>
				</div>
				<div class="elementor-element elementor-element-3764442 elementor-widget elementor-widget-heading" data-id="3764442" data-element_type="widget" data-widget_type="heading.default">
				<div class="elementor-widget-container">
			<h2 class="elementor-heading-title elementor-size-default">Experiência Profissional</h2>		</div>
				</div>
				<div class="elementor-element elementor-element-308232d elementor-widget-divider--view-line elementor-widget elementor-widget-divider" data-id="308232d" data-element_type="widget" data-widget_type="divider.default">
				<div class="elementor-widget-container">
					<div class="elementor-divider">
			<span class="elementor-divider-separator">
						</span>
		</div>
				</div>
				</div>
				<div class="elementor-element elementor-element-1e7fa67 elementor-widget elementor-widget-text-editor" data-id="1e7fa67" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
							<p>${curriculoModel?.resumo}</p>						</div>
				</div>
					</div>
				</div>
				</div>
					<script type='text/javascript'>
				const lazyloadRunObserver = () => {
					const lazyloadBackgrounds = document.querySelectorAll( `.e-con.e-parent:not(.e-lazyloaded)` );
					const lazyloadBackgroundObserver = new IntersectionObserver( ( entries ) => {
						entries.forEach( ( entry ) => {
							if ( entry.isIntersecting ) {
								let lazyloadBackground = entry.target;
								if( lazyloadBackground ) {
									lazyloadBackground.classList.add( 'e-lazyloaded' );
								}
								lazyloadBackgroundObserver.unobserve( entry.target );
							}
						});
					}, { rootMargin: '200px 0px 200px 0px' } );
					lazyloadBackgrounds.forEach( ( lazyloadBackground ) => {
						lazyloadBackgroundObserver.observe( lazyloadBackground );
					} );
				};
				const events = [
					'DOMContentLoaded',
					'elementor/lazyload/observe',
				];
				events.forEach( ( event ) => {
					document.addEventListener( event, lazyloadRunObserver );
				} );
			</script>
			<script type="text/template" id="tmpl-elementor-templates-modal__header">
	<div class="elementor-templates-modal__header__logo-area"></div>
	<div class="elementor-templates-modal__header__menu-area"></div>
	<div class="elementor-templates-modal__header__items-area">
		<# if ( closeType ) { #>
			<div class="elementor-templates-modal__header__close elementor-templates-modal__header__close--{{{ closeType }}} elementor-templates-modal__header__item">
				<# if ( 'skip' === closeType ) { #>
				<span>Ignorar</span>
				<# } #>
				<i class="eicon-close"
				   aria-hidden="true"
				   title="{{{ \$e.components?.get( 'document/elements' )?.utils?.getTitleForLibraryClose() }}}"></i>
				<span class="elementor-screen-only">{{{ \$e.components?.get( 'document/elements' )?.utils?.getTitleForLibraryClose() }}}</span>
			</div>
		<# } #>
		<div id="elementor-template-library-header-tools"></div>
	</div>
</script>

<script type="text/template" id="tmpl-elementor-templates-modal__header__logo">
	<span class="elementor-templates-modal__header__logo__icon-wrapper e-logo-wrapper">
		<i class="eicon-elementor"></i>
	</span>
	<span class="elementor-templates-modal__header__logo__title">{{{ title }}}</span>
</script>
<script type="text/template" id="tmpl-elementor-finder">
	<div id="elementor-finder__search">
		<i class="eicon-search" aria-hidden="true"></i>
		<input id="elementor-finder__search__input" placeholder="Type to find anything in Elementor" autocomplete="off">
	</div>
	<div id="elementor-finder__content"></div>
</script>

<script type="text/template" id="tmpl-elementor-finder-results-container">
	<div id="elementor-finder__no-results">Nenhum resultado encontrado</div>
	<div id="elementor-finder__results"></div>
</script>

<script type="text/template" id="tmpl-elementor-finder__results__category">
	<div class="elementor-finder__results__category__title">{{{ title }}}</div>
	<div class="elementor-finder__results__category__items"></div>
</script>

<script type="text/template" id="tmpl-elementor-finder__results__item">
	<a href="{{ url }}" class="elementor-finder__results__item__link">
		<div class="elementor-finder__results__item__icon">
			<i class="eicon-{{{ icon }}}" aria-hidden="true"></i>
		</div>
		<div class="elementor-finder__results__item__title">{{{ title }}}</div>
		<# if ( description ) { #>
			<div class="elementor-finder__results__item__description">- {{{ description }}}</div>
		<# } #>

		<# if ( lock ) { #>
		<div class="elementor-finder__results__item__badge"><i class="{{{ lock.badge.icon }}}"></i>{{ lock.badge.text }}</div>
		<# } #>
	</a>
	<# if ( actions.length ) { #>
		<div class="elementor-finder__results__item__actions">
		<# jQuery.each( actions, function() { #>
			<a class="elementor-finder__results__item__action elementor-finder__results__item__action--{{ this.name }}" href="{{ this.url }}" target="_blank">
				<i class="eicon-{{{ this.icon }}}"></i>
			</a>
		<# } ); #>
		</div>
	<# } #>
</script>
<script id="elementor-web-cli-js-before">
var elementorWebCliConfig = {"isDebug":false,"urls":{"rest":"https:\/\/pollosdigital.com.br\/wp-json\/","assets":"https:\/\/pollosdigital.com.br\/wp-content\/plugins\/elementor\/assets\/"},"nonce":"e8303afb0d","version":"3.24.2"};
var elementorWebCliConfig = {"isDebug":false,"urls":{"rest":"https:\/\/pollosdigital.com.br\/wp-json\/","assets":"https:\/\/pollosdigital.com.br\/wp-content\/plugins\/elementor\/assets\/"},"nonce":"e8303afb0d","version":"3.24.2"};
</script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/js/web-cli.min.js?ver=3.24.2" id="elementor-web-cli-js"></script>
<script src="https://pollosdigital.com.br/wp-includes/js/dist/vendor/react.min.js?ver=18.3.1" id="react-js"></script>
<script src="https://pollosdigital.com.br/wp-includes/js/dist/vendor/react-dom.min.js?ver=18.3.1" id="react-dom-js"></script>
<script src="https://pollosdigital.com.br/wp-includes/js/dist/hooks.min.js?ver=2810c76e705dd1a53b18" id="wp-hooks-js"></script>
<script src="https://pollosdigital.com.br/wp-includes/js/dist/i18n.min.js?ver=5e580eb46a90c2b997e6" id="wp-i18n-js"></script>
<script id="wp-i18n-js-after">
wp.i18n.setLocaleData( { 'text direction\u0004ltr': [ 'ltr' ] } );
</script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor-pro/assets/js/notes/notes.min.js?ver=3.24.1" id="elementor-pro-notes-js"></script>
<script id="elementor-pro-notes-app-initiator-js-before">
var elementorNotesConfig = {"route":{"title":"Leonardo v02","url":"\/?p=3564","note_url_pattern":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-pro-notes-proxy&note-id={{NOTE_ID}}","post_id":3564,"is_elementor_library":false},"direction":"ltr","is_debug":false,"current_user_can":{"create":true,"create_users":true,"edit_users":true},"urls":{"admin_url_create_user":"https:\/\/pollosdigital.com.br\/wp-admin\/user-new.php","admin_url_edit_user":"https:\/\/pollosdigital.com.br\/wp-admin\/user-edit.php","avatar_defaults":{"24":"https:\/\/secure.gravatar.com\/avatar\/?s=24&d=mm&r=g","48":"https:\/\/secure.gravatar.com\/avatar\/?s=48&d=mm&r=g","96":"https:\/\/secure.gravatar.com\/avatar\/?s=96&d=mm&r=g"},"help_notes_features":"https:\/\/go.elementor.com\/app-notes"}};
</script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor-pro/assets/js/notes/notes-app-initiator.min.js?ver=3.24.1" id="elementor-pro-notes-app-initiator-js"></script>
<script src="https://pollosdigital.com.br/wp-content/themes/hello-elementor/assets/js/hello-frontend.min.js?ver=3.1.1" id="hello-theme-frontend-js"></script>
<script src="https://pollosdigital.com.br/wp-includes/js/jquery/ui/core.min.js?ver=1.13.3" id="jquery-ui-core-js"></script>
<script src="https://pollosdigital.com.br/wp-includes/js/jquery/ui/mouse.min.js?ver=1.13.3" id="jquery-ui-mouse-js"></script>
<script src="https://pollosdigital.com.br/wp-includes/js/jquery/ui/draggable.min.js?ver=1.13.3" id="jquery-ui-draggable-js"></script>
<script src="https://pollosdigital.com.br/wp-includes/js/underscore.min.js?ver=1.13.4" id="underscore-js"></script>
<script src="https://pollosdigital.com.br/wp-includes/js/backbone.min.js?ver=1.5.0" id="backbone-js"></script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/lib/backbone/backbone.marionette.min.js?ver=2.4.5.e1" id="backbone-marionette-js"></script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/lib/backbone/backbone.radio.min.js?ver=1.0.4" id="backbone-radio-js"></script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/js/common-modules.min.js?ver=3.24.2" id="elementor-common-modules-js"></script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/lib/dialog/dialog.min.js?ver=4.9.3" id="elementor-dialog-js"></script>
<script id="wp-api-request-js-extra">
var wpApiSettings = {"root":"https:\/\/pollosdigital.com.br\/wp-json\/","nonce":"e8303afb0d","versionString":"wp\/v2\/"};
</script>
<script src="https://pollosdigital.com.br/wp-includes/js/api-request.min.js?ver=6.6.2" id="wp-api-request-js"></script>
<script id="elementor-dev-tools-js-before">
var elementorDevToolsConfig = {"isDebug":false,"urls":{"assets":"https:\/\/pollosdigital.com.br\/wp-content\/plugins\/elementor\/assets\/"},"deprecation":{"soft_notices":[],"soft_version_count":4,"hard_version_count":8,"current_version":"3.24.2"}};
var elementorDevToolsConfig = {"isDebug":false,"urls":{"assets":"https:\/\/pollosdigital.com.br\/wp-content\/plugins\/elementor\/assets\/"},"deprecation":{"soft_notices":[],"soft_version_count":4,"hard_version_count":8,"current_version":"3.24.2"}};
var elementorDevToolsConfig = {"isDebug":false,"urls":{"assets":"https:\/\/pollosdigital.com.br\/wp-content\/plugins\/elementor\/assets\/"},"deprecation":{"soft_notices":[],"soft_version_count":4,"hard_version_count":8,"current_version":"3.24.2"}};
</script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/js/dev-tools.min.js?ver=3.24.2" id="elementor-dev-tools-js"></script>
<script id="elementor-common-js-translations">
( function( domain, translations ) {
	var localeData = translations.locale_data[ domain ] || translations.locale_data.messages;
	localeData[""].domain = domain;
	wp.i18n.setLocaleData( localeData, domain );
} )( "elementor", {"translation-revision-date":"2024-09-11 14:11:30+0000","generator":"GlotPress\/4.0.1","domain":"messages","locale_data":{"messages":{"":{"domain":"messages","plural-forms":"nplurals=2; plural=n != 1;","lang":"pt"},"Before you enable unfiltered files upload, note that such files include a security risk. Elementor does run a process to remove possible malicious code, but there is still risk involved when using such files.":["Antes de ativares o carregamento de ficheiros SVG, observa que os ficheiros SVG incluem um risco de seguran\u00e7a. O Elementor executa um processo para remover poss\u00edveis c\u00f3digos maliciosos, mas ainda h\u00e1 riscos envolvidos ao usar esses ficheiros."],"Enable":["Activar"],"Cancel":["Cancelar"]}},"comment":{"reference":"assets\/js\/common.js"}} );
</script>
<script id="elementor-common-js-before">
var elementorCommonConfig = {"version":"3.24.2","isRTL":false,"isDebug":false,"isElementorDebug":false,"activeModules":["ajax","finder","connect","event-tracker"],"experimentalFeatures":{"e_font_icon_svg":true,"additional_custom_breakpoints":true,"container":true,"container_grid":true,"e_swiper_latest":true,"e_nested_atomic_repeaters":true,"e_optimized_control_loading":true,"e_onboarding":true,"theme_builder_v2":true,"hello-theme-header-footer":true,"home_screen":true,"ai-layout":true,"editor_v2":true,"e_element_cache":true,"link-in-bio":true,"floating-buttons":true,"display-conditions":true,"form-submissions":true},"urls":{"assets":"https:\/\/pollosdigital.com.br\/wp-content\/plugins\/elementor\/assets\/","rest":"https:\/\/pollosdigital.com.br\/wp-json\/"},"filesUpload":{"unfilteredFiles":true},"library_connect":{"is_connected":false,"subscription_plans":{"free":{"label":null,"promotion_url":null,"color":null},"essential":{"label":"Pro","promotion_url":"https:\/\/my.elementor.com\/upgrade-subscription\/?utm_source=template-library&utm_medium=wp-dash&utm_campaign=gopro","color":"#92003B"},"essential-oct2023":{"label":"Advanced","promotion_url":"https:\/\/my.elementor.com\/upgrade-subscription\/?utm_source=template-library&utm_medium=wp-dash&utm_campaign=gopro","color":"#92003B"},"advanced":{"label":"Advanced","promotion_url":"https:\/\/my.elementor.com\/upgrade-subscription\/?utm_source=template-library&utm_medium=wp-dash&utm_campaign=gopro","color":"#92003B"},"expert":{"label":"Expert","promotion_url":"https:\/\/my.elementor.com\/upgrade-subscription\/?utm_source=template-library&utm_medium=wp-dash&utm_campaign=gopro","color":"#92003B"},"agency":{"label":"Agency","promotion_url":"https:\/\/my.elementor.com\/upgrade-subscription\/?utm_source=template-library&utm_medium=wp-dash&utm_campaign=gopro","color":"#92003B"}},"base_access_level":0,"base_access_tier":"free","current_access_level":1,"current_access_tier":"advanced"},"ajax":{"url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin-ajax.php","nonce":"402febcdcf"},"finder":{"data":{"edit":{"title":"Editar","dynamic":true,"name":"edit"},"general":{"title":"Geral","dynamic":false,"items":{"saved-templates":{"title":"Modelos guardados","icon":"library-save","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?post_type=elementor_library&tabs_group=library","keywords":["template","section","page","library"]},"system-info":{"title":"Informa\u00e7\u00f5es do sistema","icon":"info-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-system-info","keywords":["system","info","environment","elementor"]},"role-manager":{"title":"Gestor de pap\u00e9is","icon":"person","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-role-manager","keywords":["role","manager","user","elementor"]},"knowledge-base":{"title":"Base de conhecimento","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=go_knowledge_base_site","keywords":["help","knowledge","docs","elementor"]},"theme-builder":{"title":"Construtor de tema","icon":"library-save","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-app&ver=3.24.2#\/site-editor","keywords":["template","header","footer","single","archive","search","404","library"]},"kit-library":{"title":"Kit Library","icon":"kit-parts","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-app&ver=3.24.2#\/kit-library","keywords":["kit library","kit","library","site parts","parts","assets","templates"]},"popups":{"title":"Popups","icon":"library-save","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?post_type=elementor_library&tabs_group=popup&elementor_library_type=popup","keywords":["template","popup","library"]}},"name":"general"},"create":{"title":"Criar","dynamic":false,"items":{"page":{"title":"Add New Page Template","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&template_type=page&_wpnonce=13c7aba68d","keywords":["Add New Page Template","post","page","template","new","create"]},"section":{"title":"Adicionar novo Section","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=13c7aba68d&template_type=section","keywords":["Adicionar novo Section","post","page","template","new","create"]},"container":{"title":"Adicionar novo Container","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&template_type=container&_wpnonce=13c7aba68d","keywords":["Adicionar novo Container","post","page","template","new","create"]},"wp-post":{"title":"Adicionar novo Artigo","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=post&template_type=wp-post&_wpnonce=13c7aba68d","keywords":["Adicionar novo Artigo","post","page","template","new","create"]},"wp-page":{"title":"Adicionar novo P\u00e1gina","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=page&template_type=wp-page&_wpnonce=13c7aba68d","keywords":["Adicionar novo P\u00e1gina","post","page","template","new","create"]},"popup":{"title":"Adicionar novo Popup","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=13c7aba68d&template_type=popup","keywords":["Adicionar novo Popup","post","page","template","new","create"]},"header":{"title":"Adicionar novo Header","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=13c7aba68d&template_type=header","keywords":["Adicionar novo Header","post","page","template","new","create"]},"footer":{"title":"Adicionar novo Footer","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=13c7aba68d&template_type=footer","keywords":["Adicionar novo Footer","post","page","template","new","create"]},"single":{"title":"Adicionar novo Single","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=13c7aba68d&template_type=single","keywords":["Adicionar novo Single","post","page","template","new","create"]},"single-post":{"title":"Adicionar novo Single Post","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=13c7aba68d&template_type=single-post","keywords":["Adicionar novo Single Post","post","page","template","new","create"]},"single-page":{"title":"Adicionar novo Single Page","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=13c7aba68d&template_type=single-page&_elementor_template_sub_type=page","keywords":["Adicionar novo Single Page","post","page","template","new","create"]},"archive":{"title":"Adicionar novo Archive","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=13c7aba68d&template_type=archive","keywords":["Adicionar novo Archive","post","page","template","new","create"]},"search-results":{"title":"Adicionar novo Resultados da pesquisa","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=13c7aba68d&template_type=search-results&_elementor_template_sub_type=search","keywords":["Adicionar novo Resultados da pesquisa","post","page","template","new","create"]},"error-404":{"title":"Adicionar novo Error 404","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=13c7aba68d&template_type=error-404&_elementor_template_sub_type=not_found404","keywords":["Adicionar novo Error 404","post","page","template","new","create"]},"code_snippet":{"title":"Adicionar novo Custom Code","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/post-new.php?post_type=elementor_snippet","keywords":["Adicionar novo Custom Code","post","page","template","new","create"]},"floating-buttons":{"title":"Adicionar novo Floating Element","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=13c7aba68d&template_type=floating-buttons","keywords":["Adicionar novo Floating Element","post","page","template","new","create"]},"loop-item":{"title":"Adicionar novo Loop Item","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=13c7aba68d&template_type=loop-item","keywords":["Adicionar novo Loop Item","post","page","template","new","create"]},"theme-template":{"title":"Add New Theme Template","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-app&ver=3.24.2#\/site-editor\/add-new","keywords":["template","theme","new","create"]},"loop-template":{"title":"Add New Loop Template","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?post_type=elementor_library&tabs_group=theme&elementor_library_type=loop-item#add_new","keywords":["template","theme","new","create","loop","dynamic","listing","archive","repeater"]}},"name":"create"},"site":{"title":"Site","dynamic":false,"items":{"homepage":{"title":"P\u00e1gina inicial","url":"https:\/\/pollosdigital.com.br","icon":"home-heart","keywords":["home","page"]},"wordpress-dashboard":{"title":"Painel","icon":"dashboard","url":"https:\/\/pollosdigital.com.br\/wp-admin\/","keywords":["dashboard","wordpress"]},"wordpress-menus":{"title":"Menus","icon":"wordpress","url":"https:\/\/pollosdigital.com.br\/wp-admin\/nav-menus.php","keywords":["menu","wordpress"]},"wordpress-themes":{"title":"Temas","icon":"wordpress","url":"https:\/\/pollosdigital.com.br\/wp-admin\/themes.php","keywords":["themes","wordpress"]},"wordpress-customizer":{"title":"Personalizador","icon":"wordpress","url":"https:\/\/pollosdigital.com.br\/wp-admin\/customize.php","keywords":["customizer","wordpress"]},"wordpress-plugins":{"title":"Plugins","icon":"wordpress","url":"https:\/\/pollosdigital.com.br\/wp-admin\/plugins.php","keywords":["plugins","wordpress"]},"wordpress-users":{"title":"Utilizadores","icon":"wordpress","url":"https:\/\/pollosdigital.com.br\/wp-admin\/users.php","keywords":["users","profile","wordpress"]},"apps":{"title":"Add-ons","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-apps","icon":"apps","keywords":["apps","addon","plugin","extension","integration"]}},"name":"site"},"settings":{"title":"Defini\u00e7\u00f5es","dynamic":false,"items":{"general-settings":{"title":"Defini\u00e7\u00f5es gerais","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-settings#tab-general","keywords":["general","settings","elementor"]},"integrations":{"title":"Integra\u00e7\u00f5es","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-settings#tab-integrations","keywords":["integrations","settings","elementor"]},"advanced":{"title":"Avan\u00e7ado","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-settings#tab-advanced","keywords":["advanced","settings","elementor"]},"performance":{"title":"Performance","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-settings#tab-performance","keywords":["performance","settings","elementor"]},"experiments":{"title":"Experiments","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-settings#tab-experiments","keywords":["settings","elementor","experiments"]},"features":{"title":"Features","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-settings#tab-experiments","keywords":["settings","elementor","features"]},"element-manager":{"title":"Element Manager","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-element-manager","keywords":["settings","elements","widgets","manager"]},"custom-fonts":{"title":"Custom Fonts","icon":"typography","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?post_type=elementor_font","keywords":["custom","fonts","elementor"]},"custom-icons":{"title":"Custom Icons","icon":"favorite","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?post_type=elementor_icons","keywords":["custom","icons","elementor"]}},"name":"settings"},"tools":{"title":"Ferramentas","dynamic":false,"items":{"tools":{"title":"Ferramentas","icon":"tools","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-tools","keywords":["tools","regenerate css","safe mode","debug bar","sync library","elementor"]},"replace-url":{"title":"Substituir URL","icon":"tools","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-tools#tab-replace_url","keywords":["tools","replace url","domain","elementor"]},"maintenance-mode":{"title":"Modo de manuten\u00e7\u00e3o","icon":"tools","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-tools#tab-maintenance_mode","keywords":["tools","maintenance","coming soon","elementor"]},"import-export":{"title":"Import Export","icon":"import-export","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-tools#tab-import-export-kit","keywords":["tools","import export","import","export","kit"]},"version-control":{"title":"Controlo de vers\u00f5es","icon":"time-line","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-tools#tab-versions","keywords":["tools","version","control","rollback","beta","elementor"]}},"name":"tools"}}},"connect":[],"event-tracker":{"isUserDataShared":true}};
</script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/js/common.min.js?ver=3.24.2" id="elementor-common-js"></script>
<script id="elementor-app-loader-js-before">
var elementorAppConfig = {"menu_url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-app&ver=3.24.2#\/site-editor","assets_url":"https:\/\/pollosdigital.com.br\/wp-content\/plugins\/elementor\/assets\/","pages_url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?post_type=page","return_url":"https:\/\/pollosdigital.com.br\/wp-admin\/","hasPro":true,"admin_url":"https:\/\/pollosdigital.com.br\/wp-admin\/","login_url":"https:\/\/pollosdigital.com.br\/wp-login.php","base_url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-app&ver=3.24.2","promotion":{"upgrade_url":"https:\/\/go.elementor.com\/go-pro-theme-builder\/"},"site-editor":[],"import-export":[],"kit-library":[],"onboarding":[]};
</script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/js/app-loader.min.js?ver=3.24.2" id="elementor-app-loader-js"></script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor-pro/assets/js/webpack-pro.runtime.min.js?ver=3.24.1" id="elementor-pro-webpack-runtime-js"></script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/js/webpack.runtime.min.js?ver=3.24.2" id="elementor-webpack-runtime-js"></script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/js/frontend-modules.min.js?ver=3.24.2" id="elementor-frontend-modules-js"></script>
<script id="elementor-pro-frontend-js-before">
var ElementorProFrontendConfig = {"ajaxurl":"https:\/\/pollosdigital.com.br\/wp-admin\/admin-ajax.php","nonce":"e0f29272c2","urls":{"assets":"https:\/\/pollosdigital.com.br\/wp-content\/plugins\/elementor-pro\/assets\/","rest":"https:\/\/pollosdigital.com.br\/wp-json\/"},"settings":{"lazy_load_background_images":true},"shareButtonsNetworks":{"facebook":{"title":"Facebook","has_counter":true},"twitter":{"title":"Twitter"},"linkedin":{"title":"LinkedIn","has_counter":true},"pinterest":{"title":"Pinterest","has_counter":true},"reddit":{"title":"Reddit","has_counter":true},"vk":{"title":"VK","has_counter":true},"odnoklassniki":{"title":"OK","has_counter":true},"tumblr":{"title":"Tumblr"},"digg":{"title":"Digg"},"skype":{"title":"Skype"},"stumbleupon":{"title":"StumbleUpon","has_counter":true},"mix":{"title":"Mix"},"telegram":{"title":"Telegram"},"pocket":{"title":"Pocket","has_counter":true},"xing":{"title":"XING","has_counter":true},"whatsapp":{"title":"WhatsApp"},"email":{"title":"Email"},"print":{"title":"Print"},"x-twitter":{"title":"X"},"threads":{"title":"Threads"}},"facebook_sdk":{"lang":"pt_PT","app_id":""},"lottie":{"defaultAnimationUrl":"https:\/\/pollosdigital.com.br\/wp-content\/plugins\/elementor-pro\/modules\/lottie\/assets\/animations\/default.json"}};
</script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor-pro/assets/js/frontend.min.js?ver=3.24.1" id="elementor-pro-frontend-js"></script>
<script id="elementor-frontend-js-before">
var elementorFrontendConfig = {"environmentMode":{"edit":false,"wpPreview":false,"isScriptDebug":false},"i18n":{"shareOnFacebook":"Partilhar no Facebook","shareOnTwitter":"Partilhar no Twitter","pinIt":"Fix\u00e1-lo","download":"Download","downloadImage":"Descarregar Imagem","fullscreen":"\u00c9cr\u00e3 Inteiro","zoom":"Zoom","share":"Partilhar","playVideo":"Reproduzir v\u00eddeo","previous":"Anterior","next":"Seguinte","close":"Fechar","a11yCarouselWrapperAriaLabel":"Carousel | Horizontal scrolling: Arrow Left & Right","a11yCarouselPrevSlideMessage":"Previous slide","a11yCarouselNextSlideMessage":"Next slide","a11yCarouselFirstSlideMessage":"This is the first slide","a11yCarouselLastSlideMessage":"This is the last slide","a11yCarouselPaginationBulletMessage":"Go to slide"},"is_rtl":false,"breakpoints":{"xs":0,"sm":480,"md":768,"lg":1025,"xl":1440,"xxl":1600},"responsive":{"breakpoints":{"mobile":{"label":"Mobile ao alto","value":767,"default_value":767,"direction":"max","is_enabled":true},"mobile_extra":{"label":"Mobile ao baixo","value":880,"default_value":880,"direction":"max","is_enabled":false},"tablet":{"label":"Tablet Portrait","value":1024,"default_value":1024,"direction":"max","is_enabled":true},"tablet_extra":{"label":"Tablet Landscape","value":1200,"default_value":1200,"direction":"max","is_enabled":false},"laptop":{"label":"Port\u00e1til","value":1366,"default_value":1366,"direction":"max","is_enabled":false},"widescreen":{"label":"Widescreen","value":2400,"default_value":2400,"direction":"min","is_enabled":false}}},"version":"3.24.2","is_static":false,"experimentalFeatures":{"e_font_icon_svg":true,"additional_custom_breakpoints":true,"container":true,"container_grid":true,"e_swiper_latest":true,"e_nested_atomic_repeaters":true,"e_optimized_control_loading":true,"e_onboarding":true,"theme_builder_v2":true,"hello-theme-header-footer":true,"home_screen":true,"ai-layout":true,"editor_v2":true,"e_element_cache":true,"link-in-bio":true,"floating-buttons":true,"display-conditions":true,"form-submissions":true},"urls":{"assets":"https:\/\/pollosdigital.com.br\/wp-content\/plugins\/elementor\/assets\/","ajaxurl":"https:\/\/pollosdigital.com.br\/wp-admin\/admin-ajax.php"},"nonces":{"floatingButtonsClickTracking":"b13e0d8a4b"},"swiperClass":"swiper","settings":{"page":[],"editorPreferences":[]},"kit":{"active_breakpoints":["viewport_mobile","viewport_tablet"],"global_image_lightbox":"yes","lightbox_enable_counter":"yes","lightbox_enable_fullscreen":"yes","lightbox_enable_zoom":"yes","lightbox_enable_share":"yes","lightbox_title_src":"title","lightbox_description_src":"description","hello_header_logo_type":"logo","hello_header_menu_layout":"horizontal","hello_footer_logo_type":"logo"},"post":{"id":3564,"title":"Leonardo%20v02%20%E2%80%93%20Pollos%20Digital","excerpt":"","featuredImage":false},"user":{"roles":["administrator"]}};
</script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/js/frontend.min.js?ver=3.24.2" id="elementor-frontend-js"></script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor-pro/assets/js/elements-handlers.min.js?ver=3.24.1" id="pro-elements-handlers-js"></script>
<script id="elementor-admin-bar-js-before">
var elementorAdminBarConfig = {"elementor_edit_page":{"id":"elementor_edit_page","title":"Editar com o Elementor","href":"https:\/\/pollosdigital.com.br\/wp-admin\/post.php?post=3564&action=elementor","children":{"3565":{"id":"elementor_site_settings","title":"Defini\u00e7\u00f5es do site","sub_title":"Site","href":"https:\/\/pollosdigital.com.br\/wp-admin\/post.php?post=3564&action=elementor&active-document=8","class":"elementor-site-settings","parent_class":"elementor-second-section"},"3566":{"id":"elementor_app_site_editor","title":"Construtor de tema","sub_title":"Site","href":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-app&ver=3.24.2#\/site-editor","class":"elementor-app-link","parent_class":"elementor-second-section"}}}};
</script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/js/elementor-admin-bar.min.js?ver=3.24.2" id="elementor-admin-bar-js"></script>
<script src="https://pollosdigital.com.br/wp-includes/js/hoverintent-js.min.js?ver=2.2.1" id="hoverintent-js-js"></script>
<script src="https://pollosdigital.com.br/wp-includes/js/admin-bar.min.js?ver=6.6.2" id="admin-bar-js"></script>
	</body>
</html>
''';

    var modeloCurriculo3 = '''<!DOCTYPE html>
<html lang="pt-PT">
<head>
	<meta charset="UTF-8">
		<title>Leonardo &#8211; Pollos Digital</title>
<meta name='robots' content='max-image-preview:large' />
<link rel="alternate" type="application/rss+xml" title="Pollos Digital &raquo; Feed" href="https://pollosdigital.com.br/feed/" />
<link rel="alternate" type="application/rss+xml" title="Pollos Digital &raquo; Feed de comentários" href="https://pollosdigital.com.br/comments/feed/" />
<link rel="alternate" type="application/rss+xml" title="Feed de comentários de Pollos Digital &raquo; Leonardo" href="https://pollosdigital.com.br/2024/09/17/leonardo/feed/" />
<script>
window._wpemojiSettings = {"baseUrl":"https:\/\/s.w.org\/images\/core\/emoji\/15.0.3\/72x72\/","ext":".png","svgUrl":"https:\/\/s.w.org\/images\/core\/emoji\/15.0.3\/svg\/","svgExt":".svg","source":{"concatemoji":"https:\/\/pollosdigital.com.br\/wp-includes\/js\/wp-emoji-release.min.js?ver=6.6.2"}};
/*! This file is auto-generated */
!function(i,n){var o,s,e;function c(e){try{var t={supportTests:e,timestamp:(new Date).valueOf()};sessionStorage.setItem(o,JSON.stringify(t))}catch(e){}}function p(e,t,n){e.clearRect(0,0,e.canvas.width,e.canvas.height),e.fillText(t,0,0);var t=new Uint32Array(e.getImageData(0,0,e.canvas.width,e.canvas.height).data),r=(e.clearRect(0,0,e.canvas.width,e.canvas.height),e.fillText(n,0,0),new Uint32Array(e.getImageData(0,0,e.canvas.width,e.canvas.height).data));return t.every(function(e,t){return e===r[t]})}function u(e,t,n){switch(t){case"flag":return n(e,"\ud83c\udff3\ufe0f\u200d\u26a7\ufe0f","\ud83c\udff3\ufe0f\u200b\u26a7\ufe0f")?!1:!n(e,"\ud83c\uddfa\ud83c\uddf3","\ud83c\uddfa\u200b\ud83c\uddf3")&&!n(e,"\ud83c\udff4\udb40\udc67\udb40\udc62\udb40\udc65\udb40\udc6e\udb40\udc67\udb40\udc7f","\ud83c\udff4\u200b\udb40\udc67\u200b\udb40\udc62\u200b\udb40\udc65\u200b\udb40\udc6e\u200b\udb40\udc67\u200b\udb40\udc7f");case"emoji":return!n(e,"\ud83d\udc26\u200d\u2b1b","\ud83d\udc26\u200b\u2b1b")}return!1}function f(e,t,n){var r="undefined"!=typeof WorkerGlobalScope&&self instanceof WorkerGlobalScope?new OffscreenCanvas(300,150):i.createElement("canvas"),a=r.getContext("2d",{willReadFrequently:!0}),o=(a.textBaseline="top",a.font="600 32px Arial",{});return e.forEach(function(e){o[e]=t(a,e,n)}),o}function t(e){var t=i.createElement("script");t.src=e,t.defer=!0,i.head.appendChild(t)}"undefined"!=typeof Promise&&(o="wpEmojiSettingsSupports",s=["flag","emoji"],n.supports={everything:!0,everythingExceptFlag:!0},e=new Promise(function(e){i.addEventListener("DOMContentLoaded",e,{once:!0})}),new Promise(function(t){var n=function(){try{var e=JSON.parse(sessionStorage.getItem(o));if("object"==typeof e&&"number"==typeof e.timestamp&&(new Date).valueOf()<e.timestamp+604800&&"object"==typeof e.supportTests)return e.supportTests}catch(e){}return null}();if(!n){if("undefined"!=typeof Worker&&"undefined"!=typeof OffscreenCanvas&&"undefined"!=typeof URL&&URL.createObjectURL&&"undefined"!=typeof Blob)try{var e="postMessage("+f.toString()+"("+[JSON.stringify(s),u.toString(),p.toString()].join(",")+"));",r=new Blob([e],{type:"text/javascript"}),a=new Worker(URL.createObjectURL(r),{name:"wpTestEmojiSupports"});return void(a.onmessage=function(e){c(n=e.data),a.terminate(),t(n)})}catch(e){}c(n=f(s,u,p))}t(n)}).then(function(e){for(var t in e)n.supports[t]=e[t],n.supports.everything=n.supports.everything&&n.supports[t],"flag"!==t&&(n.supports.everythingExceptFlag=n.supports.everythingExceptFlag&&n.supports[t]);n.supports.everythingExceptFlag=n.supports.everythingExceptFlag&&!n.supports.flag,n.DOMReady=!1,n.readyCallback=function(){n.DOMReady=!0}}).then(function(){return e}).then(function(){var e;n.supports.everything||(n.readyCallback(),(e=n.source||{}).concatemoji?t(e.concatemoji):e.wpemoji&&e.twemoji&&(t(e.twemoji),t(e.wpemoji)))}))}((window,document),window._wpemojiSettings);
</script>
<style id='wp-emoji-styles-inline-css'>

	img.wp-smiley, img.emoji {
		display: inline !important;
		border: none !important;
		box-shadow: none !important;
		height: 1em !important;
		width: 1em !important;
		margin: 0 0.07em !important;
		vertical-align: -0.1em !important;
		background: none !important;
		padding: 0 !important;
	}
</style>
<style id='classic-theme-styles-inline-css'>
/*! This file is auto-generated */
.wp-block-button__link{color:#fff;background-color:#32373c;border-radius:9999px;box-shadow:none;text-decoration:none;padding:calc(.667em + 2px) calc(1.333em + 2px);font-size:1.125em}.wp-block-file__button{background:#32373c;color:#fff;text-decoration:none}
</style>
<style id='global-styles-inline-css'>
:root{--wp--preset--aspect-ratio--square: 1;--wp--preset--aspect-ratio--4-3: 4/3;--wp--preset--aspect-ratio--3-4: 3/4;--wp--preset--aspect-ratio--3-2: 3/2;--wp--preset--aspect-ratio--2-3: 2/3;--wp--preset--aspect-ratio--16-9: 16/9;--wp--preset--aspect-ratio--9-16: 9/16;--wp--preset--color--black: #000000;--wp--preset--color--cyan-bluish-gray: #abb8c3;--wp--preset--color--white: #ffffff;--wp--preset--color--pale-pink: #f78da7;--wp--preset--color--vivid-red: #cf2e2e;--wp--preset--color--luminous-vivid-orange: #ff6900;--wp--preset--color--luminous-vivid-amber: #fcb900;--wp--preset--color--light-green-cyan: #7bdcb5;--wp--preset--color--vivid-green-cyan: #00d084;--wp--preset--color--pale-cyan-blue: #8ed1fc;--wp--preset--color--vivid-cyan-blue: #0693e3;--wp--preset--color--vivid-purple: #9b51e0;--wp--preset--gradient--vivid-cyan-blue-to-vivid-purple: linear-gradient(135deg,rgba(6,147,227,1) 0%,rgb(155,81,224) 100%);--wp--preset--gradient--light-green-cyan-to-vivid-green-cyan: linear-gradient(135deg,rgb(122,220,180) 0%,rgb(0,208,130) 100%);--wp--preset--gradient--luminous-vivid-amber-to-luminous-vivid-orange: linear-gradient(135deg,rgba(252,185,0,1) 0%,rgba(255,105,0,1) 100%);--wp--preset--gradient--luminous-vivid-orange-to-vivid-red: linear-gradient(135deg,rgba(255,105,0,1) 0%,rgb(207,46,46) 100%);--wp--preset--gradient--very-light-gray-to-cyan-bluish-gray: linear-gradient(135deg,rgb(238,238,238) 0%,rgb(169,184,195) 100%);--wp--preset--gradient--cool-to-warm-spectrum: linear-gradient(135deg,rgb(74,234,220) 0%,rgb(151,120,209) 20%,rgb(207,42,186) 40%,rgb(238,44,130) 60%,rgb(251,105,98) 80%,rgb(254,248,76) 100%);--wp--preset--gradient--blush-light-purple: linear-gradient(135deg,rgb(255,206,236) 0%,rgb(152,150,240) 100%);--wp--preset--gradient--blush-bordeaux: linear-gradient(135deg,rgb(254,205,165) 0%,rgb(254,45,45) 50%,rgb(107,0,62) 100%);--wp--preset--gradient--luminous-dusk: linear-gradient(135deg,rgb(255,203,112) 0%,rgb(199,81,192) 50%,rgb(65,88,208) 100%);--wp--preset--gradient--pale-ocean: linear-gradient(135deg,rgb(255,245,203) 0%,rgb(182,227,212) 50%,rgb(51,167,181) 100%);--wp--preset--gradient--electric-grass: linear-gradient(135deg,rgb(202,248,128) 0%,rgb(113,206,126) 100%);--wp--preset--gradient--midnight: linear-gradient(135deg,rgb(2,3,129) 0%,rgb(40,116,252) 100%);--wp--preset--font-size--small: 13px;--wp--preset--font-size--medium: 20px;--wp--preset--font-size--large: 36px;--wp--preset--font-size--x-large: 42px;--wp--preset--spacing--20: 0.44rem;--wp--preset--spacing--30: 0.67rem;--wp--preset--spacing--40: 1rem;--wp--preset--spacing--50: 1.5rem;--wp--preset--spacing--60: 2.25rem;--wp--preset--spacing--70: 3.38rem;--wp--preset--spacing--80: 5.06rem;--wp--preset--shadow--natural: 6px 6px 9px rgba(0, 0, 0, 0.2);--wp--preset--shadow--deep: 12px 12px 50px rgba(0, 0, 0, 0.4);--wp--preset--shadow--sharp: 6px 6px 0px rgba(0, 0, 0, 0.2);--wp--preset--shadow--outlined: 6px 6px 0px -3px rgba(255, 255, 255, 1), 6px 6px rgba(0, 0, 0, 1);--wp--preset--shadow--crisp: 6px 6px 0px rgba(0, 0, 0, 1);}:where(.is-layout-flex){gap: 0.5em;}:where(.is-layout-grid){gap: 0.5em;}body .is-layout-flex{display: flex;}.is-layout-flex{flex-wrap: wrap;align-items: center;}.is-layout-flex > :is(*, div){margin: 0;}body .is-layout-grid{display: grid;}.is-layout-grid > :is(*, div){margin: 0;}:where(.wp-block-columns.is-layout-flex){gap: 2em;}:where(.wp-block-columns.is-layout-grid){gap: 2em;}:where(.wp-block-post-template.is-layout-flex){gap: 1.25em;}:where(.wp-block-post-template.is-layout-grid){gap: 1.25em;}.has-black-color{color: var(--wp--preset--color--black) !important;}.has-cyan-bluish-gray-color{color: var(--wp--preset--color--cyan-bluish-gray) !important;}.has-white-color{color: var(--wp--preset--color--white) !important;}.has-pale-pink-color{color: var(--wp--preset--color--pale-pink) !important;}.has-vivid-red-color{color: var(--wp--preset--color--vivid-red) !important;}.has-luminous-vivid-orange-color{color: var(--wp--preset--color--luminous-vivid-orange) !important;}.has-luminous-vivid-amber-color{color: var(--wp--preset--color--luminous-vivid-amber) !important;}.has-light-green-cyan-color{color: var(--wp--preset--color--light-green-cyan) !important;}.has-vivid-green-cyan-color{color: var(--wp--preset--color--vivid-green-cyan) !important;}.has-pale-cyan-blue-color{color: var(--wp--preset--color--pale-cyan-blue) !important;}.has-vivid-cyan-blue-color{color: var(--wp--preset--color--vivid-cyan-blue) !important;}.has-vivid-purple-color{color: var(--wp--preset--color--vivid-purple) !important;}.has-black-background-color{background-color: var(--wp--preset--color--black) !important;}.has-cyan-bluish-gray-background-color{background-color: var(--wp--preset--color--cyan-bluish-gray) !important;}.has-white-background-color{background-color: var(--wp--preset--color--white) !important;}.has-pale-pink-background-color{background-color: var(--wp--preset--color--pale-pink) !important;}.has-vivid-red-background-color{background-color: var(--wp--preset--color--vivid-red) !important;}.has-luminous-vivid-orange-background-color{background-color: var(--wp--preset--color--luminous-vivid-orange) !important;}.has-luminous-vivid-amber-background-color{background-color: var(--wp--preset--color--luminous-vivid-amber) !important;}.has-light-green-cyan-background-color{background-color: var(--wp--preset--color--light-green-cyan) !important;}.has-vivid-green-cyan-background-color{background-color: var(--wp--preset--color--vivid-green-cyan) !important;}.has-pale-cyan-blue-background-color{background-color: var(--wp--preset--color--pale-cyan-blue) !important;}.has-vivid-cyan-blue-background-color{background-color: var(--wp--preset--color--vivid-cyan-blue) !important;}.has-vivid-purple-background-color{background-color: var(--wp--preset--color--vivid-purple) !important;}.has-black-border-color{border-color: var(--wp--preset--color--black) !important;}.has-cyan-bluish-gray-border-color{border-color: var(--wp--preset--color--cyan-bluish-gray) !important;}.has-white-border-color{border-color: var(--wp--preset--color--white) !important;}.has-pale-pink-border-color{border-color: var(--wp--preset--color--pale-pink) !important;}.has-vivid-red-border-color{border-color: var(--wp--preset--color--vivid-red) !important;}.has-luminous-vivid-orange-border-color{border-color: var(--wp--preset--color--luminous-vivid-orange) !important;}.has-luminous-vivid-amber-border-color{border-color: var(--wp--preset--color--luminous-vivid-amber) !important;}.has-light-green-cyan-border-color{border-color: var(--wp--preset--color--light-green-cyan) !important;}.has-vivid-green-cyan-border-color{border-color: var(--wp--preset--color--vivid-green-cyan) !important;}.has-pale-cyan-blue-border-color{border-color: var(--wp--preset--color--pale-cyan-blue) !important;}.has-vivid-cyan-blue-border-color{border-color: var(--wp--preset--color--vivid-cyan-blue) !important;}.has-vivid-purple-border-color{border-color: var(--wp--preset--color--vivid-purple) !important;}.has-vivid-cyan-blue-to-vivid-purple-gradient-background{background: var(--wp--preset--gradient--vivid-cyan-blue-to-vivid-purple) !important;}.has-light-green-cyan-to-vivid-green-cyan-gradient-background{background: var(--wp--preset--gradient--light-green-cyan-to-vivid-green-cyan) !important;}.has-luminous-vivid-amber-to-luminous-vivid-orange-gradient-background{background: var(--wp--preset--gradient--luminous-vivid-amber-to-luminous-vivid-orange) !important;}.has-luminous-vivid-orange-to-vivid-red-gradient-background{background: var(--wp--preset--gradient--luminous-vivid-orange-to-vivid-red) !important;}.has-very-light-gray-to-cyan-bluish-gray-gradient-background{background: var(--wp--preset--gradient--very-light-gray-to-cyan-bluish-gray) !important;}.has-cool-to-warm-spectrum-gradient-background{background: var(--wp--preset--gradient--cool-to-warm-spectrum) !important;}.has-blush-light-purple-gradient-background{background: var(--wp--preset--gradient--blush-light-purple) !important;}.has-blush-bordeaux-gradient-background{background: var(--wp--preset--gradient--blush-bordeaux) !important;}.has-luminous-dusk-gradient-background{background: var(--wp--preset--gradient--luminous-dusk) !important;}.has-pale-ocean-gradient-background{background: var(--wp--preset--gradient--pale-ocean) !important;}.has-electric-grass-gradient-background{background: var(--wp--preset--gradient--electric-grass) !important;}.has-midnight-gradient-background{background: var(--wp--preset--gradient--midnight) !important;}.has-small-font-size{font-size: var(--wp--preset--font-size--small) !important;}.has-medium-font-size{font-size: var(--wp--preset--font-size--medium) !important;}.has-large-font-size{font-size: var(--wp--preset--font-size--large) !important;}.has-x-large-font-size{font-size: var(--wp--preset--font-size--x-large) !important;}
:where(.wp-block-post-template.is-layout-flex){gap: 1.25em;}:where(.wp-block-post-template.is-layout-grid){gap: 1.25em;}
:where(.wp-block-columns.is-layout-flex){gap: 2em;}:where(.wp-block-columns.is-layout-grid){gap: 2em;}
:root :where(.wp-block-pullquote){font-size: 1.5em;line-height: 1.6;}
</style>
<link rel='stylesheet' id='hello-elementor-css' href='https://pollosdigital.com.br/wp-content/themes/hello-elementor/style.min.css?ver=3.1.1' media='all' />
<link rel='stylesheet' id='hello-elementor-theme-style-css' href='https://pollosdigital.com.br/wp-content/themes/hello-elementor/theme.min.css?ver=3.1.1' media='all' />
<link rel='stylesheet' id='hello-elementor-header-footer-css' href='https://pollosdigital.com.br/wp-content/themes/hello-elementor/header-footer.min.css?ver=3.1.1' media='all' />
<link rel='stylesheet' id='elementor-frontend-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/css/frontend.min.css?ver=3.24.2' media='all' />
<link rel='stylesheet' id='elementor-post-8-css' href='https://pollosdigital.com.br/wp-content/uploads/elementor/css/post-8.css?ver=1726670858' media='all' />
<link rel='stylesheet' id='swiper-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/lib/swiper/v8/css/swiper.min.css?ver=8.4.5' media='all' />
<link rel='stylesheet' id='e-swiper-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/css/conditionals/e-swiper.min.css?ver=3.24.2' media='all' />
<link rel='stylesheet' id='elementor-pro-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor-pro/assets/css/frontend.min.css?ver=3.24.1' media='all' />
<link rel='stylesheet' id='elementor-global-css' href='https://pollosdigital.com.br/wp-content/uploads/elementor/css/global.css?ver=1726670859' media='all' />
<link rel='stylesheet' id='elementor-post-3542-css' href='https://pollosdigital.com.br/wp-content/uploads/elementor/css/post-3542.css?ver=1726676856' media='all' />
<link rel='stylesheet' id='google-fonts-1-css' href='https://fonts.googleapis.com/css?family=Roboto%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic%7CRoboto+Slab%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic%7CMontserrat%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic&#038;display=swap&#038;ver=6.6.2' media='all' />
<link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin><link rel="https://api.w.org/" href="https://pollosdigital.com.br/wp-json/" /><link rel="alternate" title="JSON" type="application/json" href="https://pollosdigital.com.br/wp-json/wp/v2/posts/3542" /><link rel="EditURI" type="application/rsd+xml" title="RSD" href="https://pollosdigital.com.br/xmlrpc.php?rsd" />
<meta name="generator" content="WordPress 6.6.2" />
<link rel="canonical" href="https://pollosdigital.com.br/2024/09/17/leonardo/" />
<link rel='shortlink' href='https://pollosdigital.com.br/?p=3542' />
<link rel="alternate" title="oEmbed (JSON)" type="application/json+oembed" href="https://pollosdigital.com.br/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fpollosdigital.com.br%2F2024%2F09%2F17%2Fleonardo%2F" />
<link rel="alternate" title="oEmbed (XML)" type="text/xml+oembed" href="https://pollosdigital.com.br/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fpollosdigital.com.br%2F2024%2F09%2F17%2Fleonardo%2F&#038;format=xml" />
<meta name="generator" content="Elementor 3.24.2; features: e_font_icon_svg, additional_custom_breakpoints, e_optimized_control_loading, e_element_cache; settings: css_print_method-external, google_font-enabled, font_display-swap">
			<style>
				.e-con.e-parent:nth-of-type(n+4):not(.e-lazyloaded):not(.e-no-lazyload),
				.e-con.e-parent:nth-of-type(n+4):not(.e-lazyloaded):not(.e-no-lazyload) * {
					background-image: none !important;
				}
				@media screen and (max-height: 1024px) {
					.e-con.e-parent:nth-of-type(n+3):not(.e-lazyloaded):not(.e-no-lazyload),
					.e-con.e-parent:nth-of-type(n+3):not(.e-lazyloaded):not(.e-no-lazyload) * {
						background-image: none !important;
					}
				}
				@media screen and (max-height: 640px) {
					.e-con.e-parent:nth-of-type(n+2):not(.e-lazyloaded):not(.e-no-lazyload),
					.e-con.e-parent:nth-of-type(n+2):not(.e-lazyloaded):not(.e-no-lazyload) * {
						background-image: none !important;
					}
				}
			</style>
				<meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover" /></head>
<body class="post-template post-template-elementor_canvas single single-post postid-3542 single-format-standard wp-custom-logo elementor-default elementor-template-canvas elementor-kit-8 elementor-page elementor-page-3542">
			<div data-elementor-type="wp-post" data-elementor-id="3542" class="elementor elementor-3542" data-elementor-post-type="post">
				<div class="elementor-element elementor-element-b16e687 e-flex e-con-boxed e-con e-parent" data-id="b16e687" data-element_type="container">
					<div class="e-con-inner">
		<div class="elementor-element elementor-element-8a0dda2 e-con-full e-flex e-con e-child" data-id="8a0dda2" data-element_type="container" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
		<div class="elementor-element elementor-element-231c6e5 e-con-full e-flex e-con e-child" data-id="231c6e5" data-element_type="container">
				<div class="elementor-element elementor-element-117bbd3 elementor-invisible elementor-widget elementor-widget-image" data-id="117bbd3" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeIn&quot;}" data-widget_type="image.default">
				<div class="elementor-widget-container">
													<img fetchpriority="high" decoding="async" width="706" height="1189" src="https://pollosdigital.com.br/wp-content/uploads/2024/09/Quem-e.webp" class="attachment-full size-full wp-image-2589" alt="" srcset="https://pollosdigital.com.br/wp-content/uploads/2024/09/Quem-e.webp 706w, https://pollosdigital.com.br/wp-content/uploads/2024/09/Quem-e-178x300.webp 178w, https://pollosdigital.com.br/wp-content/uploads/2024/09/Quem-e-608x1024.webp 608w" sizes="(max-width: 706px) 100vw, 706px" />													</div>
				</div>
				<div class="elementor-element elementor-element-69c5809 elementor-position-left elementor-mobile-position-left elementor-view-default elementor-vertical-align-top elementor-widget elementor-widget-icon-box" data-id="69c5809" data-element_type="widget" data-widget_type="icon-box.default">
				<div class="elementor-widget-container">
					<div class="elementor-icon-box-wrapper">

						<div class="elementor-icon-box-icon">
				<span  class="elementor-icon elementor-animation-">
				<svg aria-hidden="true" class="e-font-icon-svg e-far-envelope" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="M464 64H48C21.49 64 0 85.49 0 112v288c0 26.51 21.49 48 48 48h416c26.51 0 48-21.49 48-48V112c0-26.51-21.49-48-48-48zm0 48v40.805c-22.422 18.259-58.168 46.651-134.587 106.49-16.841 13.247-50.201 45.072-73.413 44.701-23.208.375-56.579-31.459-73.413-44.701C106.18 199.465 70.425 171.067 48 152.805V112h416zM48 400V214.398c22.914 18.251 55.409 43.862 104.938 82.646 21.857 17.205 60.134 55.186 103.062 54.955 42.717.231 80.509-37.199 103.053-54.947 49.528-38.783 82.032-64.401 104.947-82.653V400H48z"></path></svg>				</span>
			</div>
			
						<div class="elementor-icon-box-content">

									<h3 class="elementor-icon-box-title">
						<span  >
							${curriculoModel?.email}						</span>
					</h3>
				
				
			</div>
			
		</div>
				</div>
				</div>
				<div class="elementor-element elementor-element-601af37 elementor-position-left elementor-mobile-position-left elementor-view-default elementor-vertical-align-top elementor-widget elementor-widget-icon-box" data-id="601af37" data-element_type="widget" data-widget_type="icon-box.default">
				<div class="elementor-widget-container">
					<div class="elementor-icon-box-wrapper">

						<div class="elementor-icon-box-icon">
				<span  class="elementor-icon elementor-animation-">
				<svg aria-hidden="true" class="e-font-icon-svg e-fas-phone-alt" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="M497.39 361.8l-112-48a24 24 0 0 0-28 6.9l-49.6 60.6A370.66 370.66 0 0 1 130.6 204.11l60.6-49.6a23.94 23.94 0 0 0 6.9-28l-48-112A24.16 24.16 0 0 0 122.6.61l-104 24A24 24 0 0 0 0 48c0 256.5 207.9 464 464 464a24 24 0 0 0 23.4-18.6l24-104a24.29 24.29 0 0 0-14.01-27.6z"></path></svg>				</span>
			</div>
			
						<div class="elementor-icon-box-content">

									<h3 class="elementor-icon-box-title">
						<span  >
							${curriculoModel?.telefone}						</span>
					</h3>
				
				
			</div>
			
		</div>
				</div>
				</div>
				</div>
		<div class="elementor-element elementor-element-8b34145 e-con-full e-flex e-con e-child" data-id="8b34145" data-element_type="container">
				<div class="elementor-element elementor-element-a8319f5 elementor-widget elementor-widget-heading" data-id="a8319f5" data-element_type="widget" data-widget_type="heading.default">
				<div class="elementor-widget-container">
			<h2 class="elementor-heading-title elementor-size-default">Sobre ${curriculoModel?.nome}</h2>		</div>
				</div>
				<div class="elementor-element elementor-element-a2f9490 elementor-widget-divider--view-line elementor-widget elementor-widget-divider" data-id="a2f9490" data-element_type="widget" data-widget_type="divider.default">
				<div class="elementor-widget-container">
					<div class="elementor-divider">
			<span class="elementor-divider-separator">
						</span>
		</div>
				</div>
				</div>
				<div class="elementor-element elementor-element-ab8abf4 elementor-widget elementor-widget-text-editor" data-id="ab8abf4" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
							<p>${curriculoModel?.resumo}</p>						</div>
				</div>
				<div class="elementor-element elementor-element-6dcced3 elementor-icon-list--layout-traditional elementor-list-item-link-full_width elementor-widget elementor-widget-icon-list" data-id="6dcced3" data-element_type="widget" data-widget_type="icon-list.default">
				<div class="elementor-widget-container">
					<ul class="elementor-icon-list-items">
            $skillsCodeModelo1
					</ul>
				</div>
				</div>
				</div>
				</div>
					</div>
				</div>
				</div>
					<script type='text/javascript'>
				const lazyloadRunObserver = () => {
					const lazyloadBackgrounds = document.querySelectorAll( `.e-con.e-parent:not(.e-lazyloaded)` );
					const lazyloadBackgroundObserver = new IntersectionObserver( ( entries ) => {
						entries.forEach( ( entry ) => {
							if ( entry.isIntersecting ) {
								let lazyloadBackground = entry.target;
								if( lazyloadBackground ) {
									lazyloadBackground.classList.add( 'e-lazyloaded' );
								}
								lazyloadBackgroundObserver.unobserve( entry.target );
							}
						});
					}, { rootMargin: '200px 0px 200px 0px' } );
					lazyloadBackgrounds.forEach( ( lazyloadBackground ) => {
						lazyloadBackgroundObserver.observe( lazyloadBackground );
					} );
				};
				const events = [
					'DOMContentLoaded',
					'elementor/lazyload/observe',
				];
				events.forEach( ( event ) => {
					document.addEventListener( event, lazyloadRunObserver );
				} );
			</script>
			<link rel='stylesheet' id='e-animation-fadeIn-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/lib/animations/styles/fadeIn.min.css?ver=3.24.2' media='all' />
<link rel='stylesheet' id='widget-image-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/css/widget-image.min.css?ver=3.24.2' media='all' />
<link rel='stylesheet' id='widget-icon-box-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/css/widget-icon-box.min.css?ver=3.24.2' media='all' />
<link rel='stylesheet' id='widget-heading-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/css/widget-heading.min.css?ver=3.24.2' media='all' />
<link rel='stylesheet' id='widget-divider-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/css/widget-divider.min.css?ver=3.24.2' media='all' />
<link rel='stylesheet' id='widget-text-editor-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/css/widget-text-editor.min.css?ver=3.24.2' media='all' />
<link rel='stylesheet' id='widget-icon-list-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/css/widget-icon-list.min.css?ver=3.24.2' media='all' />
<script src="https://pollosdigital.com.br/wp-content/themes/hello-elementor/assets/js/hello-frontend.min.js?ver=3.1.1" id="hello-theme-frontend-js"></script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor-pro/assets/js/webpack-pro.runtime.min.js?ver=3.24.1" id="elementor-pro-webpack-runtime-js"></script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/js/webpack.runtime.min.js?ver=3.24.2" id="elementor-webpack-runtime-js"></script>
<script src="https://pollosdigital.com.br/wp-includes/js/jquery/jquery.min.js?ver=3.7.1" id="jquery-core-js"></script>
<script src="https://pollosdigital.com.br/wp-includes/js/jquery/jquery-migrate.min.js?ver=3.4.1" id="jquery-migrate-js"></script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/js/frontend-modules.min.js?ver=3.24.2" id="elementor-frontend-modules-js"></script>
<script src="https://pollosdigital.com.br/wp-includes/js/dist/hooks.min.js?ver=2810c76e705dd1a53b18" id="wp-hooks-js"></script>
<script src="https://pollosdigital.com.br/wp-includes/js/dist/i18n.min.js?ver=5e580eb46a90c2b997e6" id="wp-i18n-js"></script>
<script id="wp-i18n-js-after">
wp.i18n.setLocaleData( { 'text direction\u0004ltr': [ 'ltr' ] } );
</script>
<script id="elementor-pro-frontend-js-before">
var ElementorProFrontendConfig = {"ajaxurl":"https:\/\/pollosdigital.com.br\/wp-admin\/admin-ajax.php","nonce":"0f97a59896","urls":{"assets":"https:\/\/pollosdigital.com.br\/wp-content\/plugins\/elementor-pro\/assets\/","rest":"https:\/\/pollosdigital.com.br\/wp-json\/"},"settings":{"lazy_load_background_images":true},"shareButtonsNetworks":{"facebook":{"title":"Facebook","has_counter":true},"twitter":{"title":"Twitter"},"linkedin":{"title":"LinkedIn","has_counter":true},"pinterest":{"title":"Pinterest","has_counter":true},"reddit":{"title":"Reddit","has_counter":true},"vk":{"title":"VK","has_counter":true},"odnoklassniki":{"title":"OK","has_counter":true},"tumblr":{"title":"Tumblr"},"digg":{"title":"Digg"},"skype":{"title":"Skype"},"stumbleupon":{"title":"StumbleUpon","has_counter":true},"mix":{"title":"Mix"},"telegram":{"title":"Telegram"},"pocket":{"title":"Pocket","has_counter":true},"xing":{"title":"XING","has_counter":true},"whatsapp":{"title":"WhatsApp"},"email":{"title":"Email"},"print":{"title":"Print"},"x-twitter":{"title":"X"},"threads":{"title":"Threads"}},"facebook_sdk":{"lang":"pt_PT","app_id":""},"lottie":{"defaultAnimationUrl":"https:\/\/pollosdigital.com.br\/wp-content\/plugins\/elementor-pro\/modules\/lottie\/assets\/animations\/default.json"}};
</script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor-pro/assets/js/frontend.min.js?ver=3.24.1" id="elementor-pro-frontend-js"></script>
<script src="https://pollosdigital.com.br/wp-includes/js/jquery/ui/core.min.js?ver=1.13.3" id="jquery-ui-core-js"></script>
<script id="elementor-frontend-js-before">
var elementorFrontendConfig = {"environmentMode":{"edit":false,"wpPreview":false,"isScriptDebug":false},"i18n":{"shareOnFacebook":"Partilhar no Facebook","shareOnTwitter":"Partilhar no Twitter","pinIt":"Fix\u00e1-lo","download":"Download","downloadImage":"Descarregar Imagem","fullscreen":"\u00c9cr\u00e3 Inteiro","zoom":"Zoom","share":"Partilhar","playVideo":"Reproduzir v\u00eddeo","previous":"Anterior","next":"Seguinte","close":"Fechar","a11yCarouselWrapperAriaLabel":"Carousel | Horizontal scrolling: Arrow Left & Right","a11yCarouselPrevSlideMessage":"Previous slide","a11yCarouselNextSlideMessage":"Next slide","a11yCarouselFirstSlideMessage":"This is the first slide","a11yCarouselLastSlideMessage":"This is the last slide","a11yCarouselPaginationBulletMessage":"Go to slide"},"is_rtl":false,"breakpoints":{"xs":0,"sm":480,"md":768,"lg":1025,"xl":1440,"xxl":1600},"responsive":{"breakpoints":{"mobile":{"label":"Mobile ao alto","value":767,"default_value":767,"direction":"max","is_enabled":true},"mobile_extra":{"label":"Mobile ao baixo","value":880,"default_value":880,"direction":"max","is_enabled":false},"tablet":{"label":"Tablet Portrait","value":1024,"default_value":1024,"direction":"max","is_enabled":true},"tablet_extra":{"label":"Tablet Landscape","value":1200,"default_value":1200,"direction":"max","is_enabled":false},"laptop":{"label":"Port\u00e1til","value":1366,"default_value":1366,"direction":"max","is_enabled":false},"widescreen":{"label":"Widescreen","value":2400,"default_value":2400,"direction":"min","is_enabled":false}}},"version":"3.24.2","is_static":false,"experimentalFeatures":{"e_font_icon_svg":true,"additional_custom_breakpoints":true,"container":true,"container_grid":true,"e_swiper_latest":true,"e_nested_atomic_repeaters":true,"e_optimized_control_loading":true,"e_onboarding":true,"theme_builder_v2":true,"hello-theme-header-footer":true,"home_screen":true,"ai-layout":true,"editor_v2":true,"e_element_cache":true,"link-in-bio":true,"floating-buttons":true,"display-conditions":true,"form-submissions":true},"urls":{"assets":"https:\/\/pollosdigital.com.br\/wp-content\/plugins\/elementor\/assets\/","ajaxurl":"https:\/\/pollosdigital.com.br\/wp-admin\/admin-ajax.php"},"nonces":{"floatingButtonsClickTracking":"15a86bede1"},"swiperClass":"swiper","settings":{"page":[],"editorPreferences":[]},"kit":{"active_breakpoints":["viewport_mobile","viewport_tablet"],"global_image_lightbox":"yes","lightbox_enable_counter":"yes","lightbox_enable_fullscreen":"yes","lightbox_enable_zoom":"yes","lightbox_enable_share":"yes","lightbox_title_src":"title","lightbox_description_src":"description","hello_header_logo_type":"logo","hello_header_menu_layout":"horizontal","hello_footer_logo_type":"logo"},"post":{"id":3542,"title":"Leonardo%20%E2%80%93%20Pollos%20Digital","excerpt":"","featuredImage":false}};
</script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/js/frontend.min.js?ver=3.24.2" id="elementor-frontend-js"></script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor-pro/assets/js/elements-handlers.min.js?ver=3.24.1" id="pro-elements-handlers-js"></script>
	</body>
</html>

<!--Generated by Endurance Page Cache-->''';

    switch (selectedModelo) {
      case 1:
        await _curriculoApi.createPost(curriculoModel?.nome, modeloCurriculo1);
        break;
      case 2:
        await _curriculoApi.createPost(curriculoModel?.nome, modeloCurriculo2);
        break;
      case 3:
        await _curriculoApi.createPost(curriculoModel?.nome, modeloCurriculo3);
        break;
      default:
    }
  }
}
