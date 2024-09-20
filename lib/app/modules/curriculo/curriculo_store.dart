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
  int? selectedModelo;

  @observable
  String? skillsCodeModelo1;

  @observable
  bool buttonDisplayed = true;

  @observable
  String? createdPageUrl;

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
    var modeloCurriculo1 = """<!-- wp:code -->
        <!DOCTYPE html>
<html lang="pt-PT">
<head>
	<meta charset="UTF-8">
		<title>Leonardo &#8211; Pollos Digital</title>
<meta name='robots' content='max-image-preview:large' />
<link rel="alternate" type="application/rss+xml" title="Pollos Digital &raquo; Feed" href="https://pollosdigital.com.br/feed/" />
<link rel="alternate" type="application/rss+xml" title="Pollos Digital &raquo; Feed de comentários" href="https://pollosdigital.com.br/comments/feed/" />
<link rel="alternate" type="application/rss+xml" title="Feed de comentários de Pollos Digital &raquo; Leonardo" href="https://pollosdigital.com.br/2024/09/18/leonardo-2/feed/" />
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
<link rel='stylesheet' id='widget-text-editor-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/css/widget-text-editor.min.css?ver=3.24.2' media='all' />
<link rel='stylesheet' id='widget-lottie-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor-pro/assets/css/widget-lottie.min.css?ver=3.24.1' media='all' />
<link rel='stylesheet' id='widget-icon-box-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/css/widget-icon-box.min.css?ver=3.24.2' media='all' />
<link rel='stylesheet' id='widget-image-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/css/widget-image.min.css?ver=3.24.2' media='all' />
<link rel='stylesheet' id='widget-counter-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/css/widget-counter.min.css?ver=3.24.2' media='all' />
<link rel='stylesheet' id='widget-image-box-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/css/widget-image-box.min.css?ver=3.24.2' media='all' />
<link rel='stylesheet' id='widget-image-carousel-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/css/widget-image-carousel.min.css?ver=3.24.2' media='all' />
<link rel='stylesheet' id='widget-carousel-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor-pro/assets/css/widget-carousel.min.css?ver=3.24.1' media='all' />
<link rel='stylesheet' id='widget-divider-css' href='https://pollosdigital.com.br/wp-content/plugins/elementor/assets/css/widget-divider.min.css?ver=3.24.2' media='all' />
<link rel='stylesheet' id='elementor-post-4266-css' href='https://pollosdigital.com.br/wp-content/uploads/elementor/css/post-4266.css?ver=1726705602' media='all' />
<link rel='stylesheet' id='google-fonts-1-css' href='https://fonts.googleapis.com/css?family=Roboto%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic%7CRoboto+Slab%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic%7CInter%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic&#038;display=swap&#038;ver=6.6.2' media='all' />
<link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin><script src="https://pollosdigital.com.br/wp-includes/js/jquery/jquery.min.js?ver=3.7.1" id="jquery-core-js"></script>
<script src="https://pollosdigital.com.br/wp-includes/js/jquery/jquery-migrate.min.js?ver=3.4.1" id="jquery-migrate-js"></script>
<script id="elementor-pro-app-js-before">
var elementorAppProConfig = {"baseUrl":"https:\/\/pollosdigital.com.br\/wp-content\/plugins\/elementor-pro\/","site-editor":{"urls":{"legacy_view":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?post_type=elementor_library&tabs_group=theme"},"utms":{"utm_source":"theme-builder","utm_medium":"wp-dash"}},"kit-library":[],"onboarding":[],"import-export":[]};
</script>
<link rel="https://api.w.org/" href="https://pollosdigital.com.br/wp-json/" /><link rel="alternate" title="JSON" type="application/json" href="https://pollosdigital.com.br/wp-json/wp/v2/posts/4266" /><link rel="EditURI" type="application/rsd+xml" title="RSD" href="https://pollosdigital.com.br/xmlrpc.php?rsd" />
<meta name="generator" content="WordPress 6.6.2" />
<link rel="canonical" href="https://pollosdigital.com.br/2024/09/18/leonardo-2/" />
<link rel='shortlink' href='https://pollosdigital.com.br/?p=4266' />
<link rel="alternate" title="oEmbed (JSON)" type="application/json+oembed" href="https://pollosdigital.com.br/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fpollosdigital.com.br%2F2024%2F09%2F18%2Fleonardo-2%2F" />
<link rel="alternate" title="oEmbed (XML)" type="text/xml+oembed" href="https://pollosdigital.com.br/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fpollosdigital.com.br%2F2024%2F09%2F18%2Fleonardo-2%2F&#038;format=xml" />
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
<body class="post-template post-template-elementor_canvas single single-post postid-4266 single-format-standard logged-in admin-bar no-customize-support wp-custom-logo elementor-default elementor-template-canvas elementor-kit-8 elementor-page elementor-page-4266">
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
				<ul role='menu' id='wp-admin-bar-root-default' class="ab-top-menu"><li role='group' id='wp-admin-bar-wp-logo' class="menupop"><a class='ab-item' role="menuitem" aria-expanded="false" href='https://pollosdigital.com.br/wp-admin/about.php'><span class="ab-icon" aria-hidden="true"></span><span class="screen-reader-text">Sobre o WordPress</span></a><div class="ab-sub-wrapper"><ul role='menu' aria-label='Sobre o WordPress' id='wp-admin-bar-wp-logo-default' class="ab-submenu"><li role='group' id='wp-admin-bar-about'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/about.php'>Sobre o WordPress</a></li><li role='group' id='wp-admin-bar-contribute'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/contribute.php'>Participe</a></li></ul><ul role='menu' aria-label='Sobre o WordPress' id='wp-admin-bar-wp-logo-external' class="ab-sub-secondary ab-submenu"><li role='group' id='wp-admin-bar-wporg'><a class='ab-item' role="menuitem" href='https://pt.wordpress.org/'>WordPress.org</a></li><li role='group' id='wp-admin-bar-documentation'><a class='ab-item' role="menuitem" href='https://wordpress.org/documentation/'>Documentação</a></li><li role='group' id='wp-admin-bar-learn'><a class='ab-item' role="menuitem" href='https://learn.wordpress.org/'>Learn WordPress</a></li><li role='group' id='wp-admin-bar-support-forums'><a class='ab-item' role="menuitem" href='https://pt.wordpress.org/support/forums/'>Suporte</a></li><li role='group' id='wp-admin-bar-feedback'><a class='ab-item' role="menuitem" href='https://wordpress.org/support/forum/requests-and-feedback'>Feedback</a></li></ul></div></li><li role='group' id='wp-admin-bar-site-name' class="menupop"><a class='ab-item' role="menuitem" aria-expanded="false" href='https://pollosdigital.com.br/wp-admin/'>Pollos Digital</a><div class="ab-sub-wrapper"><ul role='menu' aria-label='Pollos Digital' id='wp-admin-bar-site-name-default' class="ab-submenu"><li role='group' id='wp-admin-bar-dashboard'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/'>Painel</a></li><li role='group' id='wp-admin-bar-plugins'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/plugins.php'>Plugins</a></li></ul><ul role='menu' aria-label='Pollos Digital' id='wp-admin-bar-appearance' class="ab-submenu"><li role='group' id='wp-admin-bar-themes'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/themes.php'>Temas</a></li><li role='group' id='wp-admin-bar-menus'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/nav-menus.php'>Menus</a></li></ul></div></li><li role='group' id='wp-admin-bar-customize' class="hide-if-no-customize"><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/customize.php?url=https%3A%2F%2Fpollosdigital.com.br%2F2024%2F09%2F18%2Fleonardo-2%2F'>Personalizar</a></li><li role='group' id='wp-admin-bar-updates'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/update-core.php'><span class="ab-icon" aria-hidden="true"></span><span class="ab-label" aria-hidden="true">2</span><span class="screen-reader-text updates-available-text">2 actualizações disponíveis</span></a></li><li role='group' id='wp-admin-bar-comments'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/edit-comments.php'><span class="ab-icon" aria-hidden="true"></span><span class="ab-label awaiting-mod pending-count count-1" aria-hidden="true">1</span><span class="screen-reader-text comments-in-moderation-text">1 comentário em moderação</span></a></li><li role='group' id='wp-admin-bar-new-content' class="menupop"><a class='ab-item' role="menuitem" aria-expanded="false" href='https://pollosdigital.com.br/wp-admin/post-new.php'><span class="ab-icon" aria-hidden="true"></span><span class="ab-label">Adicionar</span></a><div class="ab-sub-wrapper"><ul role='menu' aria-label='Adicionar' id='wp-admin-bar-new-content-default' class="ab-submenu"><li role='group' id='wp-admin-bar-new-post'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/post-new.php'>Artigo</a></li><li role='group' id='wp-admin-bar-new-media'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/media-new.php'>Multimédia</a></li><li role='group' id='wp-admin-bar-new-page'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/post-new.php?post_type=page'>Página</a></li><li role='group' id='wp-admin-bar-new-e-floating-buttons'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/edit.php?action=elementor_new_post&#038;post_type=e-floating-buttons&#038;template_type=floating-buttons&#038;_wpnonce=ee815c2372'>Floating Element</a></li><li role='group' id='wp-admin-bar-new-elementor_library'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/post-new.php?post_type=elementor_library'>Modelo</a></li><li role='group' id='wp-admin-bar-new-user'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/user-new.php'>Utilizador</a></li></ul></div></li><li role='group' id='wp-admin-bar-edit'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/post.php?post=4266&#038;action=edit'>Editar artigo</a></li><li role='group' id='wp-admin-bar-epc_purge_menu' class="menupop"><div class="ab-item ab-empty-item" role="menuitem" aria-expanded="false">Caching</div><div class="ab-sub-wrapper"><ul role='menu' id='wp-admin-bar-epc_purge_menu-default' class="ab-submenu"><li role='group' id='wp-admin-bar-epc_purge_menu-purge_all'><a class='ab-item' role="menuitem" href='/2024/09/18/leonardo-2/?epc_purge_all=1'>Purge All</a></li><li role='group' id='wp-admin-bar-epc_purge_menu-purge_single'><a class='ab-item' role="menuitem" href='/2024/09/18/leonardo-2/?epc_purge_single=1'>Purge This Page</a></li><li role='group' id='wp-admin-bar-epc_purge_menu-cache_settings'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/options-general.php#epc_settings'>Cache Settings</a></li></ul></div></li><li role='group' id='wp-admin-bar-elementor_notes'><a class='ab-item' role="menuitem" href='#'>Notes</a></li></ul><ul role='menu' id='wp-admin-bar-top-secondary' class="ab-top-secondary ab-top-menu"><li role='group' id='wp-admin-bar-my-account' class="menupop with-avatar"><a class='ab-item' role="menuitem" aria-expanded="false" href='https://pollosdigital.com.br/wp-admin/profile.php'>Olá, <span class="display-name">rafa</span><img alt='' src='https://secure.gravatar.com/avatar/c3df3500de6a169abe00d2ac564a0c40?s=26&#038;d=mm&#038;r=g' srcset='https://secure.gravatar.com/avatar/c3df3500de6a169abe00d2ac564a0c40?s=52&#038;d=mm&#038;r=g 2x' class='avatar avatar-26 photo' height='26' width='26' decoding='async'/></a><div class="ab-sub-wrapper"><ul role='menu' aria-label='Olá, rafa' id='wp-admin-bar-user-actions' class="ab-submenu"><li role='group' id='wp-admin-bar-user-info'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-admin/profile.php'><img alt='' src='https://secure.gravatar.com/avatar/c3df3500de6a169abe00d2ac564a0c40?s=64&#038;d=mm&#038;r=g' srcset='https://secure.gravatar.com/avatar/c3df3500de6a169abe00d2ac564a0c40?s=128&#038;d=mm&#038;r=g 2x' class='avatar avatar-64 photo' height='64' width='64' decoding='async'/><span class='display-name'>rafa</span><span class='display-name edit-profile'>Editar perfil</span></a></li><li role='group' id='wp-admin-bar-logout'><a class='ab-item' role="menuitem" href='https://pollosdigital.com.br/wp-login.php?action=logout&#038;_wpnonce=48faf871b1'>Terminar sessão</a></li></ul></div></li><li role='group' id='wp-admin-bar-search' class="admin-bar-search"><div class="ab-item ab-empty-item" tabindex="-1" role="menuitem"><form action="https://pollosdigital.com.br/" method="get" id="adminbarsearch"><input class="adminbar-input" name="s" id="adminbar-search" type="text" value="" maxlength="150" /><label for="adminbar-search" class="screen-reader-text">Pesquisar</label><input type="submit" class="adminbar-button" value="Pesquisar" /></form></div></li></ul>			</div>
		</div>

				<div data-elementor-type="wp-post" data-elementor-id="4266" class="elementor elementor-4266" data-elementor-post-type="post">
				<div class="elementor-element elementor-element-5bc4fc6a e-flex e-con-boxed e-con e-parent" data-id="5bc4fc6a" data-element_type="container" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
					<div class="e-con-inner">
		<div class="elementor-element elementor-element-5cee4622 e-con-full e-flex e-con e-child" data-id="5cee4622" data-element_type="container">
				<div class="elementor-element elementor-element-7b8ade60 elementor-widget elementor-widget-heading" data-id="7b8ade60" data-element_type="widget" data-widget_type="heading.default">
				<div class="elementor-widget-container">
			<h6 class="elementor-heading-title elementor-size-default">IT & Cyber Security</h6>		</div>
				</div>
				<div class="elementor-element elementor-element-51f645c6 elementor-widget elementor-widget-heading" data-id="51f645c6" data-element_type="widget" data-widget_type="heading.default">
				<div class="elementor-widget-container">
			<h1 class="elementor-heading-title elementor-size-default">Leonardo Polo Dev</h1>		</div>
				</div>
				<div class="elementor-element elementor-element-51e4f5a2 elementor-widget elementor-widget-text-editor" data-id="51e4f5a2" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
							<p>Sou Leonardo Polo, um dev que adora manter as coisas descontraídas e dinâmicas. Sempre pronto para transformar projetos em aventuras incríveis, gosto de encarar desafios com criatividade e bom humor. Dizem que tenho um jeito único de &#8220;mexer o doce e fazer acontecer&#8221;, mas o que será que isso realmente significa? Com soluções inovadoras e uma energia contagiante, estou sempre testando novas tecnologias e colaborando com a equipe. Quer saber como eu faço para garantir que o trabalho nunca seja entediante? Fique por aqui e descubra!</p>						</div>
				</div>
		<div class="elementor-element elementor-element-6979a363 e-con-full e-flex e-con e-child" data-id="6979a363" data-element_type="container">
				<div class="elementor-element elementor-element-49d57bc9 elementor-align-justify elementor-widget__width-initial elementor-widget elementor-widget-button" data-id="49d57bc9" data-element_type="widget" data-widget_type="button.default">
				<div class="elementor-widget-container">
					<div class="elementor-button-wrapper">
			<a class="elementor-button elementor-button-link elementor-size-sm" href="https://api.whatsapp.com/send/?phone=5516991996799&#038;text=Quero+saber+mais&#038;type=phone_number&#038;app_absent=0a%20contagiante,%20estou">
						<span class="elementor-button-content-wrapper">
									<span class="elementor-button-text">Chama eu</span>
					</span>
					</a>
		</div>
				</div>
				</div>
				</div>
				</div>
		<div class="elementor-element elementor-element-73881f66 e-con-full e-flex e-con e-child" data-id="73881f66" data-element_type="container">
				<div class="elementor-element elementor-element-213ea099 elementor-align-center elementor-widget elementor-widget-lottie" data-id="213ea099" data-element_type="widget" data-settings="{&quot;source&quot;:&quot;external_url&quot;,&quot;source_external_url&quot;:{&quot;url&quot;:&quot;https:\/\/lottie.host\/ee0936ab-5dc6-46b2-a011-da470e616489\/Yh8G5otjdb.json&quot;,&quot;is_external&quot;:&quot;&quot;,&quot;nofollow&quot;:&quot;&quot;,&quot;custom_attributes&quot;:&quot;&quot;},&quot;trigger&quot;:&quot;none&quot;,&quot;loop&quot;:&quot;yes&quot;,&quot;start_point&quot;:{&quot;unit&quot;:&quot;%&quot;,&quot;size&quot;:1,&quot;sizes&quot;:[]},&quot;lazyload&quot;:&quot;yes&quot;,&quot;link_to&quot;:&quot;none&quot;,&quot;play_speed&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;size&quot;:1,&quot;sizes&quot;:[]},&quot;end_point&quot;:{&quot;unit&quot;:&quot;%&quot;,&quot;size&quot;:100,&quot;sizes&quot;:[]},&quot;renderer&quot;:&quot;svg&quot;}" data-widget_type="lottie.default">
				<div class="elementor-widget-container">
			<div class="e-lottie__container"><div class="e-lottie__animation"></div></div>		</div>
				</div>
				</div>
					</div>
				</div>
		<div class="elementor-element elementor-element-6123a2d3 e-flex e-con-boxed e-con e-parent" data-id="6123a2d3" data-element_type="container" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
					<div class="e-con-inner">
		<div class="elementor-element elementor-element-1ab0c677 e-con-full e-grid e-con e-child" data-id="1ab0c677" data-element_type="container">
				<div class="elementor-element elementor-element-784b0875 elementor-view-stacked elementor-shape-square elementor-position-left elementor-mobile-position-left elementor-vertical-align-top elementor-widget elementor-widget-icon-box" data-id="784b0875" data-element_type="widget" data-widget_type="icon-box.default">
				<div class="elementor-widget-container">
					<div class="elementor-icon-box-wrapper">

						<div class="elementor-icon-box-icon">
				<span  class="elementor-icon elementor-animation-">
				<svg aria-hidden="true" class="e-font-icon-svg e-far-star" viewBox="0 0 576 512" xmlns="http://www.w3.org/2000/svg"><path d="M528.1 171.5L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6zM388.6 312.3l23.7 138.4L288 385.4l-124.3 65.3 23.7-138.4-100.6-98 139-20.2 62.2-126 62.2 126 139 20.2-100.6 98z"></path></svg>				</span>
			</div>
			
						<div class="elementor-icon-box-content">

									<div class="elementor-icon-box-title">
						<span  >
							Missão						</span>
					</div>
				
									<p class="elementor-icon-box-description">
						Desenvolver soluções tecnológicas inovadoras que transformem ideias em realidades impactantes, sempre mantendo um ambiente de trabalho descontraído e colaborativo, onde a criatividade e o bom humor são essenciais.					</p>
				
			</div>
			
		</div>
				</div>
				</div>
				<div class="elementor-element elementor-element-17825ac1 elementor-view-stacked elementor-shape-square elementor-position-left elementor-mobile-position-left elementor-vertical-align-top elementor-widget elementor-widget-icon-box" data-id="17825ac1" data-element_type="widget" data-widget_type="icon-box.default">
				<div class="elementor-widget-container">
					<div class="elementor-icon-box-wrapper">

						<div class="elementor-icon-box-icon">
				<span  class="elementor-icon elementor-animation-">
				<svg aria-hidden="true" class="e-font-icon-svg e-far-paper-plane" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="M440 6.5L24 246.4c-34.4 19.9-31.1 70.8 5.7 85.9L144 379.6V464c0 46.4 59.2 65.5 86.6 28.6l43.8-59.1 111.9 46.2c5.9 2.4 12.1 3.6 18.3 3.6 8.2 0 16.3-2.1 23.6-6.2 12.8-7.2 21.6-20 23.9-34.5l59.4-387.2c6.1-40.1-36.9-68.8-71.5-48.9zM192 464v-64.6l36.6 15.1L192 464zm212.6-28.7l-153.8-63.5L391 169.5c10.7-15.5-9.5-33.5-23.7-21.2L155.8 332.6 48 288 464 48l-59.4 387.3z"></path></svg>				</span>
			</div>
			
						<div class="elementor-icon-box-content">

									<div class="elementor-icon-box-title">
						<span  >
							Visão						</span>
					</div>
				
									<p class="elementor-icon-box-description">
						Ser reconhecido como um desenvolvedor líder que inspira e capacita equipes a alcançar novos patamares de excelência, utilizando tecnologia de ponta para criar experiências únicas e memoráveis					</p>
				
			</div>
			
		</div>
				</div>
				</div>
				<div class="elementor-element elementor-element-482bd17e elementor-view-stacked elementor-shape-square elementor-position-left elementor-mobile-position-left elementor-vertical-align-top elementor-widget elementor-widget-icon-box" data-id="482bd17e" data-element_type="widget" data-widget_type="icon-box.default">
				<div class="elementor-widget-container">
					<div class="elementor-icon-box-wrapper">

						<div class="elementor-icon-box-icon">
				<span  class="elementor-icon elementor-animation-">
				<svg aria-hidden="true" class="e-font-icon-svg e-fas-check" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="M173.898 439.404l-166.4-166.4c-9.997-9.997-9.997-26.206 0-36.204l36.203-36.204c9.997-9.998 26.207-9.998 36.204 0L192 312.69 432.095 72.596c9.997-9.997 26.207-9.997 36.204 0l36.203 36.204c9.997 9.997 9.997 26.206 0 36.204l-294.4 294.401c-9.998 9.997-26.207 9.997-36.204-.001z"></path></svg>				</span>
			</div>
			
						<div class="elementor-icon-box-content">

									<div class="elementor-icon-box-title">
						<span  >
							Valores						</span>
					</div>
				
									<p class="elementor-icon-box-description">
						Inovação: Buscar constantemente novas tecnologias e abordagens para resolver problemas de maneira criativa.
<br /><br />
Flexibilidade: Adaptar-se rapidamente às mudanças e desafios, mantendo uma atitude positiva.
Integridade: Agir com ética e transparência em todas as interações e projetos.
					</p>
				
			</div>
			
		</div>
				</div>
				</div>
				</div>
					</div>
				</div>
		<div class="elementor-element elementor-element-6d29d8c5 e-flex e-con-boxed e-con e-parent" data-id="6d29d8c5" data-element_type="container" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
					<div class="e-con-inner">
		<div class="elementor-element elementor-element-3143c4d e-con-full e-flex e-con e-child" data-id="3143c4d" data-element_type="container">
				<div class="elementor-element elementor-element-4079aecf elementor-widget elementor-widget-heading" data-id="4079aecf" data-element_type="widget" data-widget_type="heading.default">
				<div class="elementor-widget-container">
			<h6 class="elementor-heading-title elementor-size-default">Who We Are</h6>		</div>
				</div>
				<div class="elementor-element elementor-element-c3cde9a elementor-widget elementor-widget-heading" data-id="c3cde9a" data-element_type="widget" data-widget_type="heading.default">
				<div class="elementor-widget-container">
			<h2 class="elementor-heading-title elementor-size-default">Your Trusted Partner in Cyber Defense</h2>		</div>
				</div>
				<div class="elementor-element elementor-element-12b9e66 elementor-widget elementor-widget-text-editor" data-id="12b9e66" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.</p>						</div>
				</div>
				<div class="elementor-element elementor-element-4aec5397 elementor-align-justify elementor-widget__width-initial elementor-widget elementor-widget-button" data-id="4aec5397" data-element_type="widget" data-widget_type="button.default">
				<div class="elementor-widget-container">
					<div class="elementor-button-wrapper">
			<a class="elementor-button elementor-button-link elementor-size-sm" href="#">
						<span class="elementor-button-content-wrapper">
									<span class="elementor-button-text">Get Started</span>
					</span>
					</a>
		</div>
				</div>
				</div>
				</div>
		<div class="elementor-element elementor-element-7ee7e893 e-con-full e-flex e-con e-child" data-id="7ee7e893" data-element_type="container">
				<div class="elementor-element elementor-element-6b68fbeb elementor-widget__width-initial elementor-widget-mobile__width-initial elementor-widget elementor-widget-image" data-id="6b68fbeb" data-element_type="widget" data-widget_type="image.default">
				<div class="elementor-widget-container">
													<img fetchpriority="high" decoding="async" width="550" height="1000" src="https://pollosdigital.com.br/wp-content/uploads/2024/09/server-room-portrait-or-happy-man-for-online-cybe-2023-11-27-05-26-50-utc-1.png" class="attachment-full size-full wp-image-4269" alt="" srcset="https://pollosdigital.com.br/wp-content/uploads/2024/09/server-room-portrait-or-happy-man-for-online-cybe-2023-11-27-05-26-50-utc-1.png 550w, https://pollosdigital.com.br/wp-content/uploads/2024/09/server-room-portrait-or-happy-man-for-online-cybe-2023-11-27-05-26-50-utc-1-165x300.png 165w" sizes="(max-width: 550px) 100vw, 550px" />													</div>
				</div>
		<div class="elementor-element elementor-element-7d3f7409 e-con-full e-flex e-con e-child" data-id="7d3f7409" data-element_type="container" data-settings="{&quot;background_background&quot;:&quot;gradient&quot;}">
				<div class="elementor-element elementor-element-43db03e8 elementor-widget elementor-widget-heading" data-id="43db03e8" data-element_type="widget" data-widget_type="heading.default">
				<div class="elementor-widget-container">
			<h3 class="elementor-heading-title elementor-size-default">Control Your Security Everywhere</h3>		</div>
				</div>
				<div class="elementor-element elementor-element-5e6d75e5 elementor-widget elementor-widget-image" data-id="5e6d75e5" data-element_type="widget" data-widget_type="image.default">
				<div class="elementor-widget-container">
													<img decoding="async" width="345" height="446" src="https://pollosdigital.com.br/wp-content/uploads/2024/09/Hp-5.png" class="attachment-full size-full wp-image-4270" alt="" srcset="https://pollosdigital.com.br/wp-content/uploads/2024/09/Hp-5.png 345w, https://pollosdigital.com.br/wp-content/uploads/2024/09/Hp-5-232x300.png 232w" sizes="(max-width: 345px) 100vw, 345px" />													</div>
				</div>
				</div>
				</div>
					</div>
				</div>
		<div class="elementor-element elementor-element-4f40ab66 e-flex e-con-boxed e-con e-parent" data-id="4f40ab66" data-element_type="container" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
					<div class="e-con-inner">
		<div class="elementor-element elementor-element-f84a282 e-flex e-con-boxed e-con e-child" data-id="f84a282" data-element_type="container">
					<div class="e-con-inner">
				<div class="elementor-element elementor-element-73fca7d elementor-widget elementor-widget-heading" data-id="73fca7d" data-element_type="widget" data-widget_type="heading.default">
				<div class="elementor-widget-container">
			<h6 class="elementor-heading-title elementor-size-default">Our Value</h6>		</div>
				</div>
				<div class="elementor-element elementor-element-582c582 elementor-widget elementor-widget-heading" data-id="582c582" data-element_type="widget" data-widget_type="heading.default">
				<div class="elementor-widget-container">
			<h2 class="elementor-heading-title elementor-size-default">Commitment to Security, Driven by Innovation</h2>		</div>
				</div>
					</div>
				</div>
		<div class="elementor-element elementor-element-7b64796b e-con-full e-grid e-con e-child" data-id="7b64796b" data-element_type="container" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
		<div class="elementor-element elementor-element-e3418c6 e-con-full e-flex e-con e-child" data-id="e3418c6" data-element_type="container" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
				<div class="elementor-element elementor-element-6a4c6361 elementor-view-stacked elementor-widget__width-initial elementor-absolute elementor-shape-circle elementor-widget elementor-widget-icon" data-id="6a4c6361" data-element_type="widget" data-settings="{&quot;_position&quot;:&quot;absolute&quot;}" data-widget_type="icon.default">
				<div class="elementor-widget-container">
					<div class="elementor-icon-wrapper">
			<div class="elementor-icon">
			<svg aria-hidden="true" class="e-font-icon-svg e-far-address-book" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path d="M436 160c6.6 0 12-5.4 12-12v-40c0-6.6-5.4-12-12-12h-20V48c0-26.5-21.5-48-48-48H48C21.5 0 0 21.5 0 48v416c0 26.5 21.5 48 48 48h320c26.5 0 48-21.5 48-48v-48h20c6.6 0 12-5.4 12-12v-40c0-6.6-5.4-12-12-12h-20v-64h20c6.6 0 12-5.4 12-12v-40c0-6.6-5.4-12-12-12h-20v-64h20zm-68 304H48V48h320v416zM208 256c35.3 0 64-28.7 64-64s-28.7-64-64-64-64 28.7-64 64 28.7 64 64 64zm-89.6 128h179.2c12.4 0 22.4-8.6 22.4-19.2v-19.2c0-31.8-30.1-57.6-67.2-57.6-10.8 0-18.7 8-44.8 8-26.9 0-33.4-8-44.8-8-37.1 0-67.2 25.8-67.2 57.6v19.2c0 10.6 10 19.2 22.4 19.2z"></path></svg>			</div>
		</div>
				</div>
				</div>
				<div class="elementor-element elementor-element-2ecc2a73 elementor-widget elementor-widget-icon-box" data-id="2ecc2a73" data-element_type="widget" data-widget_type="icon-box.default">
				<div class="elementor-widget-container">
					<div class="elementor-icon-box-wrapper">

			
						<div class="elementor-icon-box-content">

									<div class="elementor-icon-box-title">
						<span  >
							Our Vision						</span>
					</div>
				
									<p class="elementor-icon-box-description">
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.					</p>
				
			</div>
			
		</div>
				</div>
				</div>
				<div class="elementor-element elementor-element-439103d6 elementor-widget elementor-widget-button" data-id="439103d6" data-element_type="widget" data-widget_type="button.default">
				<div class="elementor-widget-container">
					<div class="elementor-button-wrapper">
			<a class="elementor-button elementor-button-link elementor-size-sm" href="#">
						<span class="elementor-button-content-wrapper">
									<span class="elementor-button-text">Learn more</span>
					</span>
					</a>
		</div>
				</div>
				</div>
				</div>
		<div class="elementor-element elementor-element-4fdaf070 e-con-full e-flex e-con e-child" data-id="4fdaf070" data-element_type="container" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
				<div class="elementor-element elementor-element-51f0001e elementor-widget elementor-widget-icon-box" data-id="51f0001e" data-element_type="widget" data-widget_type="icon-box.default">
				<div class="elementor-widget-container">
					<div class="elementor-icon-box-wrapper">

			
						<div class="elementor-icon-box-content">

									<div class="elementor-icon-box-title">
						<span  >
							Our Mission						</span>
					</div>
				
									<p class="elementor-icon-box-description">
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.					</p>
				
			</div>
			
		</div>
				</div>
				</div>
				<div class="elementor-element elementor-element-1dfe5b70 elementor-widget elementor-widget-button" data-id="1dfe5b70" data-element_type="widget" data-widget_type="button.default">
				<div class="elementor-widget-container">
					<div class="elementor-button-wrapper">
			<a class="elementor-button elementor-button-link elementor-size-sm" href="#">
						<span class="elementor-button-content-wrapper">
									<span class="elementor-button-text">Learn more</span>
					</span>
					</a>
		</div>
				</div>
				</div>
				<div class="elementor-element elementor-element-5138e251 elementor-view-stacked elementor-widget__width-initial elementor-absolute elementor-shape-circle elementor-widget elementor-widget-icon" data-id="5138e251" data-element_type="widget" data-settings="{&quot;_position&quot;:&quot;absolute&quot;}" data-widget_type="icon.default">
				<div class="elementor-widget-container">
					<div class="elementor-icon-wrapper">
			<div class="elementor-icon">
			<svg aria-hidden="true" class="e-font-icon-svg e-far-caret-square-right" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path d="M176 354.9V157.1c0-10.7 13-16.1 20.5-8.5l98.3 98.9c4.7 4.7 4.7 12.2 0 16.9l-98.3 98.9c-7.5 7.7-20.5 2.3-20.5-8.4zM448 80v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48zm-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6z"></path></svg>			</div>
		</div>
				</div>
				</div>
				</div>
		<div class="elementor-element elementor-element-25ac827e e-con-full e-flex e-con e-child" data-id="25ac827e" data-element_type="container" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
				<div class="elementor-element elementor-element-24cc3860 elementor-widget elementor-widget-icon-box" data-id="24cc3860" data-element_type="widget" data-widget_type="icon-box.default">
				<div class="elementor-widget-container">
					<div class="elementor-icon-box-wrapper">

			
						<div class="elementor-icon-box-content">

									<div class="elementor-icon-box-title">
						<span  >
							Our Motto						</span>
					</div>
				
									<p class="elementor-icon-box-description">
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.					</p>
				
			</div>
			
		</div>
				</div>
				</div>
				<div class="elementor-element elementor-element-740b4f1a elementor-widget elementor-widget-button" data-id="740b4f1a" data-element_type="widget" data-widget_type="button.default">
				<div class="elementor-widget-container">
					<div class="elementor-button-wrapper">
			<a class="elementor-button elementor-button-link elementor-size-sm" href="#">
						<span class="elementor-button-content-wrapper">
									<span class="elementor-button-text">Learn more</span>
					</span>
					</a>
		</div>
				</div>
				</div>
				<div class="elementor-element elementor-element-4972310d elementor-view-stacked elementor-widget__width-initial elementor-absolute elementor-shape-circle elementor-widget elementor-widget-icon" data-id="4972310d" data-element_type="widget" data-settings="{&quot;_position&quot;:&quot;absolute&quot;}" data-widget_type="icon.default">
				<div class="elementor-widget-container">
					<div class="elementor-icon-wrapper">
			<div class="elementor-icon">
			<svg aria-hidden="true" class="e-font-icon-svg e-far-check-square" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path d="M400 32H48C21.49 32 0 53.49 0 80v352c0 26.51 21.49 48 48 48h352c26.51 0 48-21.49 48-48V80c0-26.51-21.49-48-48-48zm0 400H48V80h352v352zm-35.864-241.724L191.547 361.48c-4.705 4.667-12.303 4.637-16.97-.068l-90.781-91.516c-4.667-4.705-4.637-12.303.069-16.971l22.719-22.536c4.705-4.667 12.303-4.637 16.97.069l59.792 60.277 141.352-140.216c4.705-4.667 12.303-4.637 16.97.068l22.536 22.718c4.667 4.706 4.637 12.304-.068 16.971z"></path></svg>			</div>
		</div>
				</div>
				</div>
				</div>
				</div>
					</div>
				</div>
		<div class="elementor-element elementor-element-6bcc4f02 e-flex e-con-boxed e-con e-parent" data-id="6bcc4f02" data-element_type="container" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
					<div class="e-con-inner">
		<div class="elementor-element elementor-element-395f815a e-con-full e-flex e-con e-child" data-id="395f815a" data-element_type="container">
				<div class="elementor-element elementor-element-24ba9459 elementor-widget elementor-widget-heading" data-id="24ba9459" data-element_type="widget" data-widget_type="heading.default">
				<div class="elementor-widget-container">
			<h2 class="elementor-heading-title elementor-size-default">Building Trust Through Unmatched Security Expertise</h2>		</div>
				</div>
				<div class="elementor-element elementor-element-33d8b89d elementor-widget elementor-widget-text-editor" data-id="33d8b89d" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.</p>						</div>
				</div>
				<div class="elementor-element elementor-element-2b8b4cf3 elementor-align-center elementor-widget elementor-widget-button" data-id="2b8b4cf3" data-element_type="widget" data-widget_type="button.default">
				<div class="elementor-widget-container">
					<div class="elementor-button-wrapper">
			<a class="elementor-button elementor-button-link elementor-size-sm" href="#">
						<span class="elementor-button-content-wrapper">
									<span class="elementor-button-text">Discover More</span>
					</span>
					</a>
		</div>
				</div>
				</div>
				</div>
					</div>
				</div>
		<div class="elementor-element elementor-element-1bebc7ba e-flex e-con-boxed e-con e-parent" data-id="1bebc7ba" data-element_type="container" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
					<div class="e-con-inner">
		<div class="elementor-element elementor-element-b96a7ea e-con-full e-flex e-con e-child" data-id="b96a7ea" data-element_type="container">
				<div class="elementor-element elementor-element-510d5706 elementor-widget elementor-widget-image" data-id="510d5706" data-element_type="widget" data-widget_type="image.default">
				<div class="elementor-widget-container">
													<img decoding="async" width="1280" height="872" src="https://pollosdigital.com.br/wp-content/uploads/2024/09/professional-cyber-security-team-working-to-prevent-security-threats-find-vulnerability-and-solve-1.jpg" class="attachment-full size-full wp-image-4272" alt="" srcset="https://pollosdigital.com.br/wp-content/uploads/2024/09/professional-cyber-security-team-working-to-prevent-security-threats-find-vulnerability-and-solve-1.jpg 1280w, https://pollosdigital.com.br/wp-content/uploads/2024/09/professional-cyber-security-team-working-to-prevent-security-threats-find-vulnerability-and-solve-1-300x204.jpg 300w, https://pollosdigital.com.br/wp-content/uploads/2024/09/professional-cyber-security-team-working-to-prevent-security-threats-find-vulnerability-and-solve-1-1024x698.jpg 1024w, https://pollosdigital.com.br/wp-content/uploads/2024/09/professional-cyber-security-team-working-to-prevent-security-threats-find-vulnerability-and-solve-1-768x523.jpg 768w" sizes="(max-width: 1280px) 100vw, 1280px" />													</div>
				</div>
		<div class="elementor-element elementor-element-3fbb1dc1 e-con-full e-flex e-con e-child" data-id="3fbb1dc1" data-element_type="container" data-settings="{&quot;position&quot;:&quot;absolute&quot;}">
				<div class="elementor-element elementor-element-37f49b56 elementor-widget__width-initial elementor-widget elementor-widget-heading" data-id="37f49b56" data-element_type="widget" data-widget_type="heading.default">
				<div class="elementor-widget-container">
			<h4 class="elementor-heading-title elementor-size-default">Guarding Your Data, Securing Your Future.</h4>		</div>
				</div>
				<div class="elementor-element elementor-element-5e5604c9 elementor-widget__width-initial elementor-absolute elementor-view-default elementor-widget elementor-widget-icon" data-id="5e5604c9" data-element_type="widget" data-settings="{&quot;_position&quot;:&quot;absolute&quot;}" data-widget_type="icon.default">
				<div class="elementor-widget-container">
					<div class="elementor-icon-wrapper">
			<div class="elementor-icon">
			<i aria-hidden="true" class="mdi mdi-circle"></i>			</div>
		</div>
				</div>
				</div>
				</div>
				</div>
		<div class="elementor-element elementor-element-257ed2d9 e-con-full e-flex e-con e-child" data-id="257ed2d9" data-element_type="container">
				<div class="elementor-element elementor-element-6de99619 elementor-widget elementor-widget-heading" data-id="6de99619" data-element_type="widget" data-widget_type="heading.default">
				<div class="elementor-widget-container">
			<h6 class="elementor-heading-title elementor-size-default">Our Services</h6>		</div>
				</div>
				<div class="elementor-element elementor-element-1d833c55 elementor-widget elementor-widget-heading" data-id="1d833c55" data-element_type="widget" data-widget_type="heading.default">
				<div class="elementor-widget-container">
			<h2 class="elementor-heading-title elementor-size-default">Expert Services for Unmatched Digital Security</h2>		</div>
				</div>
				<div class="elementor-element elementor-element-6bdc623a elementor-widget elementor-widget-text-editor" data-id="6bdc623a" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.</p>						</div>
				</div>
		<div class="elementor-element elementor-element-affec3b e-con-full e-grid e-con e-child" data-id="affec3b" data-element_type="container" data-settings="{&quot;background_background&quot;:&quot;gradient&quot;}">
				<div class="elementor-element elementor-element-2facc91b elementor-widget elementor-widget-counter" data-id="2facc91b" data-element_type="widget" data-widget_type="counter.default">
				<div class="elementor-widget-container">
					<div class="elementor-counter">
			<div class="elementor-counter-title">Proven Success Rate</div>			<div class="elementor-counter-number-wrapper">
				<span class="elementor-counter-number-prefix"></span>
				<span class="elementor-counter-number" data-duration="2000" data-to-value="85" data-from-value="0" data-delimiter=",">0</span>
				<span class="elementor-counter-number-suffix">%</span>
			</div>
		</div>
				</div>
				</div>
				<div class="elementor-element elementor-element-20e9b7b1 elementor-widget elementor-widget-counter" data-id="20e9b7b1" data-element_type="widget" data-widget_type="counter.default">
				<div class="elementor-widget-container">
					<div class="elementor-counter">
			<div class="elementor-counter-title">Project Done</div>			<div class="elementor-counter-number-wrapper">
				<span class="elementor-counter-number-prefix"></span>
				<span class="elementor-counter-number" data-duration="2000" data-to-value="79" data-from-value="0" data-delimiter=",">0</span>
				<span class="elementor-counter-number-suffix">K</span>
			</div>
		</div>
				</div>
				</div>
				</div>
				</div>
					</div>
				</div>
		<div class="elementor-element elementor-element-149347ae e-flex e-con-boxed e-con e-parent" data-id="149347ae" data-element_type="container" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
					<div class="e-con-inner">
		<div class="elementor-element elementor-element-7da3f258 e-flex e-con-boxed e-con e-child" data-id="7da3f258" data-element_type="container">
					<div class="e-con-inner">
				<div class="elementor-element elementor-element-5fb8fdb3 elementor-widget elementor-widget-heading" data-id="5fb8fdb3" data-element_type="widget" data-widget_type="heading.default">
				<div class="elementor-widget-container">
			<h6 class="elementor-heading-title elementor-size-default">What We Offer</h6>		</div>
				</div>
				<div class="elementor-element elementor-element-fffe3d3 elementor-widget elementor-widget-heading" data-id="fffe3d3" data-element_type="widget" data-widget_type="heading.default">
				<div class="elementor-widget-container">
			<h2 class="elementor-heading-title elementor-size-default">Customized Protection for Every Security Need</h2>		</div>
				</div>
					</div>
				</div>
		<div class="elementor-element elementor-element-55342a5b e-con-full e-grid e-con e-child" data-id="55342a5b" data-element_type="container">
		<div class="elementor-element elementor-element-76cf2cf7 e-con-full e-flex e-con e-child" data-id="76cf2cf7" data-element_type="container" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
				<div class="elementor-element elementor-element-c6f63b0 elementor-position-left elementor-vertical-align-middle elementor-widget elementor-widget-image-box" data-id="c6f63b0" data-element_type="widget" data-widget_type="image-box.default">
				<div class="elementor-widget-container">
			<div class="elementor-image-box-wrapper"><figure class="elementor-image-box-img"><img loading="lazy" decoding="async" width="70" height="70" src="https://pollosdigital.com.br/wp-content/uploads/2024/09/Network_Security.png" class="attachment-full size-full wp-image-4273" alt="" /></figure><div class="elementor-image-box-content"><div class="elementor-image-box-title">Network Protection</div></div></div>		</div>
				</div>
				<div class="elementor-element elementor-element-7dcebf0c elementor-widget elementor-widget-text-editor" data-id="7dcebf0c" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
							<p>Urna sagittis congue tincidunt sem phasellus quisque gravida molestie euismod aliquam blandit lacinia suspendisse quis</p>						</div>
				</div>
				</div>
		<div class="elementor-element elementor-element-70b42421 e-con-full e-flex e-con e-child" data-id="70b42421" data-element_type="container" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
				<div class="elementor-element elementor-element-746668ae elementor-position-left elementor-vertical-align-middle elementor-widget elementor-widget-image-box" data-id="746668ae" data-element_type="widget" data-widget_type="image-box.default">
				<div class="elementor-widget-container">
			<div class="elementor-image-box-wrapper"><figure class="elementor-image-box-img"><img loading="lazy" decoding="async" width="70" height="70" src="https://pollosdigital.com.br/wp-content/uploads/2024/09/Data_Encryption.png" class="attachment-full size-full wp-image-4274" alt="" /></figure><div class="elementor-image-box-content"><div class="elementor-image-box-title">Data Encryption</div></div></div>		</div>
				</div>
				<div class="elementor-element elementor-element-1f352df9 elementor-widget elementor-widget-text-editor" data-id="1f352df9" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
							<p>Urna sagittis congue tincidunt sem phasellus quisque gravida molestie euismod aliquam blandit lacinia suspendisse quis</p>						</div>
				</div>
				</div>
		<div class="elementor-element elementor-element-565c7884 e-con-full e-flex e-con e-child" data-id="565c7884" data-element_type="container" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
				<div class="elementor-element elementor-element-7d572146 elementor-position-left elementor-vertical-align-middle elementor-widget elementor-widget-image-box" data-id="7d572146" data-element_type="widget" data-widget_type="image-box.default">
				<div class="elementor-widget-container">
			<div class="elementor-image-box-wrapper"><figure class="elementor-image-box-img"><img loading="lazy" decoding="async" width="70" height="70" src="https://pollosdigital.com.br/wp-content/uploads/2024/09/Cybersecurity_Audit.png" class="attachment-full size-full wp-image-4275" alt="" /></figure><div class="elementor-image-box-content"><div class="elementor-image-box-title">Threat Monitoring</div></div></div>		</div>
				</div>
				<div class="elementor-element elementor-element-5ce5a0ea elementor-widget elementor-widget-text-editor" data-id="5ce5a0ea" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
							<p>Urna sagittis congue tincidunt sem phasellus quisque gravida molestie euismod aliquam blandit lacinia suspendisse quis</p>						</div>
				</div>
				</div>
		<div class="elementor-element elementor-element-64bedaa2 e-con-full e-flex e-con e-child" data-id="64bedaa2" data-element_type="container" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
				<div class="elementor-element elementor-element-4a31a65 elementor-position-left elementor-vertical-align-middle elementor-widget elementor-widget-image-box" data-id="4a31a65" data-element_type="widget" data-widget_type="image-box.default">
				<div class="elementor-widget-container">
			<div class="elementor-image-box-wrapper"><figure class="elementor-image-box-img"><img loading="lazy" decoding="async" width="70" height="70" src="https://pollosdigital.com.br/wp-content/uploads/2024/09/Data_Breach_Alert.png" class="attachment-full size-full wp-image-4276" alt="" /></figure><div class="elementor-image-box-content"><div class="elementor-image-box-title">Incident Response</div></div></div>		</div>
				</div>
				<div class="elementor-element elementor-element-4d90e064 elementor-widget elementor-widget-text-editor" data-id="4d90e064" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
							<p>Urna sagittis congue tincidunt sem phasellus quisque gravida molestie euismod aliquam blandit lacinia suspendisse quis</p>						</div>
				</div>
				</div>
		<div class="elementor-element elementor-element-1d17cdd8 e-con-full e-flex e-con e-child" data-id="1d17cdd8" data-element_type="container" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
				<div class="elementor-element elementor-element-30a5b6a6 elementor-position-left elementor-vertical-align-middle elementor-widget elementor-widget-image-box" data-id="30a5b6a6" data-element_type="widget" data-widget_type="image-box.default">
				<div class="elementor-widget-container">
			<div class="elementor-image-box-wrapper"><figure class="elementor-image-box-img"><img loading="lazy" decoding="async" width="70" height="70" src="https://pollosdigital.com.br/wp-content/uploads/2024/09/Secure_Cloud.png" class="attachment-full size-full wp-image-4277" alt="" /></figure><div class="elementor-image-box-content"><div class="elementor-image-box-title">Cloud Security</div></div></div>		</div>
				</div>
				<div class="elementor-element elementor-element-3afb5f59 elementor-widget elementor-widget-text-editor" data-id="3afb5f59" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
							<p>Urna sagittis congue tincidunt sem phasellus quisque gravida molestie euismod aliquam blandit lacinia suspendisse quis</p>						</div>
				</div>
				</div>
		<div class="elementor-element elementor-element-471d825d e-con-full e-flex e-con e-child" data-id="471d825d" data-element_type="container" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
				<div class="elementor-element elementor-element-68bf71aa elementor-position-left elementor-vertical-align-middle elementor-widget elementor-widget-image-box" data-id="68bf71aa" data-element_type="widget" data-widget_type="image-box.default">
				<div class="elementor-widget-container">
			<div class="elementor-image-box-wrapper"><figure class="elementor-image-box-img"><img loading="lazy" decoding="async" width="70" height="70" src="https://pollosdigital.com.br/wp-content/uploads/2024/09/Firewall_Protection.png" class="attachment-full size-full wp-image-4278" alt="" /></figure><div class="elementor-image-box-content"><div class="elementor-image-box-title">Firewall Management</div></div></div>		</div>
				</div>
				<div class="elementor-element elementor-element-5ccdb20e elementor-widget elementor-widget-text-editor" data-id="5ccdb20e" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
							<p>Urna sagittis congue tincidunt sem phasellus quisque gravida molestie euismod aliquam blandit lacinia suspendisse quis</p>						</div>
				</div>
				</div>
				</div>
					</div>
				</div>
		<div class="elementor-element elementor-element-7bf28fbe e-flex e-con-boxed e-con e-parent" data-id="7bf28fbe" data-element_type="container" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
					<div class="e-con-inner">
		<div class="elementor-element elementor-element-6985176e e-con-full e-flex e-con e-child" data-id="6985176e" data-element_type="container">
				<div class="elementor-element elementor-element-3d746b26 elementor-widget elementor-widget-heading" data-id="3d746b26" data-element_type="widget" data-widget_type="heading.default">
				<div class="elementor-widget-container">
			<h2 class="elementor-heading-title elementor-size-default">Protecting What Matters Most in Cyberspace</h2>		</div>
				</div>
				<div class="elementor-element elementor-element-1f454bf8 elementor-widget elementor-widget-text-editor" data-id="1f454bf8" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.</p>						</div>
				</div>
				<div class="elementor-element elementor-element-5e6ee7ea elementor-align-center elementor-widget elementor-widget-button" data-id="5e6ee7ea" data-element_type="widget" data-widget_type="button.default">
				<div class="elementor-widget-container">
					<div class="elementor-button-wrapper">
			<a class="elementor-button elementor-button-link elementor-size-sm" href="#">
						<span class="elementor-button-content-wrapper">
									<span class="elementor-button-text">Get Started</span>
					</span>
					</a>
		</div>
				</div>
				</div>
				</div>
					</div>
				</div>
		<div class="elementor-element elementor-element-2ba2ceb1 e-flex e-con-boxed e-con e-parent" data-id="2ba2ceb1" data-element_type="container" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
					<div class="e-con-inner">
		<div class="elementor-element elementor-element-38774a4f e-con-full e-flex e-con e-child" data-id="38774a4f" data-element_type="container" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
				<div class="elementor-element elementor-element-70164bfa elementor-widget elementor-widget-image-carousel" data-id="70164bfa" data-element_type="widget" data-settings="{&quot;slides_to_show&quot;:&quot;5&quot;,&quot;slides_to_show_tablet&quot;:&quot;3&quot;,&quot;slides_to_show_mobile&quot;:&quot;2&quot;,&quot;navigation&quot;:&quot;none&quot;,&quot;lazyload&quot;:&quot;yes&quot;,&quot;autoplay_speed&quot;:2500,&quot;image_spacing_custom_mobile&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;size&quot;:21,&quot;sizes&quot;:[]},&quot;autoplay&quot;:&quot;yes&quot;,&quot;pause_on_hover&quot;:&quot;yes&quot;,&quot;pause_on_interaction&quot;:&quot;yes&quot;,&quot;infinite&quot;:&quot;yes&quot;,&quot;speed&quot;:500,&quot;image_spacing_custom&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;size&quot;:20,&quot;sizes&quot;:[]},&quot;image_spacing_custom_tablet&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;size&quot;:&quot;&quot;,&quot;sizes&quot;:[]}}" data-widget_type="image-carousel.default">
				<div class="elementor-widget-container">
					<div class="elementor-image-carousel-wrapper swiper" dir="ltr">
			<div class="elementor-image-carousel swiper-wrapper" aria-live="off">
								<div class="swiper-slide" role="group" aria-roledescription="slide" aria-label="1 of 6"><figure class="swiper-slide-inner"><img class="swiper-slide-image swiper-lazy" data-src="https://pollosdigital.com.br/wp-content/uploads/2024/09/logoipsum-logo-2-1.png" alt="logoipsum-logo-2-1.png" /><div class="swiper-lazy-preloader"></div></figure></div><div class="swiper-slide" role="group" aria-roledescription="slide" aria-label="2 of 6"><figure class="swiper-slide-inner"><img class="swiper-slide-image swiper-lazy" data-src="https://pollosdigital.com.br/wp-content/uploads/2024/09/logoipsum-logo-12-1.png" alt="logoipsum-logo-12-1.png" /><div class="swiper-lazy-preloader"></div></figure></div><div class="swiper-slide" role="group" aria-roledescription="slide" aria-label="3 of 6"><figure class="swiper-slide-inner"><img class="swiper-slide-image swiper-lazy" data-src="https://pollosdigital.com.br/wp-content/uploads/2024/09/logoipsum-logo-45-1.png" alt="logoipsum-logo-45-1.png" /><div class="swiper-lazy-preloader"></div></figure></div><div class="swiper-slide" role="group" aria-roledescription="slide" aria-label="4 of 6"><figure class="swiper-slide-inner"><img class="swiper-slide-image swiper-lazy" data-src="https://pollosdigital.com.br/wp-content/uploads/2024/09/logoipsum-logo-48-1.png" alt="logoipsum-logo-48-1.png" /><div class="swiper-lazy-preloader"></div></figure></div><div class="swiper-slide" role="group" aria-roledescription="slide" aria-label="5 of 6"><figure class="swiper-slide-inner"><img class="swiper-slide-image swiper-lazy" data-src="https://pollosdigital.com.br/wp-content/uploads/2024/09/logoipsum-logo-51-1.png" alt="logoipsum-logo-51-1.png" /><div class="swiper-lazy-preloader"></div></figure></div><div class="swiper-slide" role="group" aria-roledescription="slide" aria-label="6 of 6"><figure class="swiper-slide-inner"><img class="swiper-slide-image swiper-lazy" data-src="https://pollosdigital.com.br/wp-content/uploads/2024/09/logoipsum-logo-54-1.png" alt="logoipsum-logo-54-1.png" /><div class="swiper-lazy-preloader"></div></figure></div>			</div>
							
									</div>
				</div>
				</div>
				</div>
					</div>
				</div>
		<div class="elementor-element elementor-element-768b83a0 e-flex e-con-boxed e-con e-parent" data-id="768b83a0" data-element_type="container" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
					<div class="e-con-inner">
		<div class="elementor-element elementor-element-537eb8ad e-con-full e-flex e-con e-child" data-id="537eb8ad" data-element_type="container">
				<div class="elementor-element elementor-element-5c890747 elementor-widget elementor-widget-heading" data-id="5c890747" data-element_type="widget" data-widget_type="heading.default">
				<div class="elementor-widget-container">
			<h6 class="elementor-heading-title elementor-size-default">Why Choose Us</h6>		</div>
				</div>
				<div class="elementor-element elementor-element-2fd080a9 elementor-widget elementor-widget-heading" data-id="2fd080a9" data-element_type="widget" data-widget_type="heading.default">
				<div class="elementor-widget-container">
			<h2 class="elementor-heading-title elementor-size-default">Trusted Solutions for Superior Cyber Defense</h2>		</div>
				</div>
				</div>
		<div class="elementor-element elementor-element-758165d e-con-full e-grid e-con e-child" data-id="758165d" data-element_type="container">
				<div class="elementor-element elementor-element-1da9e870 elementor-view-stacked elementor-shape-square elementor-widget elementor-widget-icon" data-id="1da9e870" data-element_type="widget" data-widget_type="icon.default">
				<div class="elementor-widget-container">
					<div class="elementor-icon-wrapper">
			<div class="elementor-icon">
			<i aria-hidden="true" class="mdi mdi-certificate-outline"></i>			</div>
		</div>
				</div>
				</div>
				<div class="elementor-element elementor-element-3e1b96ca elementor-view-stacked elementor-shape-square elementor-widget elementor-widget-icon" data-id="3e1b96ca" data-element_type="widget" data-widget_type="icon.default">
				<div class="elementor-widget-container">
					<div class="elementor-icon-wrapper">
			<div class="elementor-icon">
			<i aria-hidden="true" class="mdi mdi-robot-industrial"></i>			</div>
		</div>
				</div>
				</div>
				<div class="elementor-element elementor-element-2e03f9a8 elementor-view-stacked elementor-shape-square elementor-widget elementor-widget-icon" data-id="2e03f9a8" data-element_type="widget" data-widget_type="icon.default">
				<div class="elementor-widget-container">
					<div class="elementor-icon-wrapper">
			<div class="elementor-icon">
			<i aria-hidden="true" class="mdi mdi-cog-outline"></i>			</div>
		</div>
				</div>
				</div>
				<div class="elementor-element elementor-element-119bfdad elementor-view-stacked elementor-shape-square elementor-widget elementor-widget-icon" data-id="119bfdad" data-element_type="widget" data-widget_type="icon.default">
				<div class="elementor-widget-container">
					<div class="elementor-icon-wrapper">
			<div class="elementor-icon">
			<i aria-hidden="true" class="mdi mdi-chart-line"></i>			</div>
		</div>
				</div>
				</div>
				</div>
		<div class="elementor-element elementor-element-46156c66 e-con-full e-grid e-con e-child" data-id="46156c66" data-element_type="container">
				<div class="elementor-element elementor-element-7f18ca7 elementor-widget elementor-widget-icon-box" data-id="7f18ca7" data-element_type="widget" data-widget_type="icon-box.default">
				<div class="elementor-widget-container">
					<div class="elementor-icon-box-wrapper">

			
						<div class="elementor-icon-box-content">

									<div class="elementor-icon-box-title">
						<span  >
							Expert Team						</span>
					</div>
				
									<p class="elementor-icon-box-description">
						Our team comprises certified professionals with years of experience in cybersecurity.					</p>
				
			</div>
			
		</div>
				</div>
				</div>
				<div class="elementor-element elementor-element-6d4a3ebe elementor-widget elementor-widget-icon-box" data-id="6d4a3ebe" data-element_type="widget" data-widget_type="icon-box.default">
				<div class="elementor-widget-container">
					<div class="elementor-icon-box-wrapper">

			
						<div class="elementor-icon-box-content">

									<div class="elementor-icon-box-title">
						<span  >
							Advanced Technology						</span>
					</div>
				
									<p class="elementor-icon-box-description">
						We leverage cutting-edge technology and tools to provide robust security solutions.					</p>
				
			</div>
			
		</div>
				</div>
				</div>
				<div class="elementor-element elementor-element-728e3e2e elementor-widget elementor-widget-icon-box" data-id="728e3e2e" data-element_type="widget" data-widget_type="icon-box.default">
				<div class="elementor-widget-container">
					<div class="elementor-icon-box-wrapper">

			
						<div class="elementor-icon-box-content">

									<div class="elementor-icon-box-title">
						<span  >
							Customized Solutions						</span>
					</div>
				
									<p class="elementor-icon-box-description">
						We offer tailored security plans designed specifically for your business needs.					</p>
				
			</div>
			
		</div>
				</div>
				</div>
				<div class="elementor-element elementor-element-5ad3728b elementor-widget elementor-widget-icon-box" data-id="5ad3728b" data-element_type="widget" data-widget_type="icon-box.default">
				<div class="elementor-widget-container">
					<div class="elementor-icon-box-wrapper">

			
						<div class="elementor-icon-box-content">

									<div class="elementor-icon-box-title">
						<span  >
							Proven Track Record						</span>
					</div>
				
									<p class="elementor-icon-box-description">
						With a strong history of successfully safeguarding clients against cyber threats.					</p>
				
			</div>
			
		</div>
				</div>
				</div>
				</div>
					</div>
				</div>
		<div class="elementor-element elementor-element-6b472560 e-flex e-con-boxed e-con e-parent" data-id="6b472560" data-element_type="container" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
					<div class="e-con-inner">
		<div class="elementor-element elementor-element-448de84 e-con-full e-flex e-con e-child" data-id="448de84" data-element_type="container">
				<div class="elementor-element elementor-element-5d27a8bb elementor-widget elementor-widget-heading" data-id="5d27a8bb" data-element_type="widget" data-widget_type="heading.default">
				<div class="elementor-widget-container">
			<h6 class="elementor-heading-title elementor-size-default">Choose Package</h6>		</div>
				</div>
				<div class="elementor-element elementor-element-5d1786f4 elementor-widget elementor-widget-heading" data-id="5d1786f4" data-element_type="widget" data-widget_type="heading.default">
				<div class="elementor-widget-container">
			<h2 class="elementor-heading-title elementor-size-default">Choose the Right Plan for Your Business</h2>		</div>
				</div>
				</div>
		<div class="elementor-element elementor-element-5bfab42a e-con-full e-flex e-con e-child" data-id="5bfab42a" data-element_type="container">
				<div class="elementor-element elementor-element-5a851bd elementor-widget elementor-widget-text-editor" data-id="5a851bd" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
							<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, </p><p>Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.</p>						</div>
				</div>
				</div>
					</div>
				</div>
		<div class="elementor-element elementor-element-2b84370 e-flex e-con-boxed e-con e-parent" data-id="2b84370" data-element_type="container" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
					<div class="e-con-inner">
		<div class="elementor-element elementor-element-7c0c9670 e-con-full e-flex e-con e-child" data-id="7c0c9670" data-element_type="container">
				<div class="elementor-element elementor-element-15086564 elementor-testimonial--align-left elementor-testimonial--skin-default elementor-testimonial--layout-image_inline elementor-widget elementor-widget-testimonial-carousel" data-id="15086564" data-element_type="widget" data-settings="{&quot;slides_per_view&quot;:&quot;2&quot;,&quot;slides_to_scroll&quot;:&quot;1&quot;,&quot;speed&quot;:1000,&quot;autoplay_speed&quot;:2500,&quot;lazyload&quot;:&quot;yes&quot;,&quot;space_between&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;size&quot;:21,&quot;sizes&quot;:[]},&quot;autoplay&quot;:&quot;yes&quot;,&quot;loop&quot;:&quot;yes&quot;,&quot;pause_on_hover&quot;:&quot;yes&quot;,&quot;pause_on_interaction&quot;:&quot;yes&quot;,&quot;space_between_tablet&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;size&quot;:10,&quot;sizes&quot;:[]},&quot;space_between_mobile&quot;:{&quot;unit&quot;:&quot;px&quot;,&quot;size&quot;:10,&quot;sizes&quot;:[]}}" data-widget_type="testimonial-carousel.default">
				<div class="elementor-widget-container">
					<div class="elementor-swiper">
			<div class="elementor-main-swiper swiper">
				<div class="swiper-wrapper">
											<div class="swiper-slide">
									<div class="elementor-testimonial">
							<div class="elementor-testimonial__content">
					<div class="elementor-testimonial__text">
						"Potenti finibus nam ligula inceptos dis imperdiet nisi aliquet morbi urna commodo aliquam consectetuer curae adipiscing ante feugiat donec dictum ex nunc condimentum a viverra"					</div>
									</div>
						<div class="elementor-testimonial__footer">
									<div class="elementor-testimonial__image">
						<img class="swiper-lazy" data-src="https://pollosdigital.com.br/wp-content/uploads/2024/09/13-1.jpg" alt="Alexander Moore">
													<div class="swiper-lazy-preloader"></div>
											</div>
								<cite class="elementor-testimonial__cite"><span class="elementor-testimonial__name">Alexander Moore</span><span class="elementor-testimonial__title">CEO Machinex</span></cite>			</div>
		</div>
								</div>
											<div class="swiper-slide">
									<div class="elementor-testimonial">
							<div class="elementor-testimonial__content">
					<div class="elementor-testimonial__text">
						"Potenti finibus nam ligula inceptos dis imperdiet nisi aliquet morbi urna commodo aliquam consectetuer curae adipiscing ante feugiat donec dictum ex nunc condimentum a viverra"					</div>
									</div>
						<div class="elementor-testimonial__footer">
									<div class="elementor-testimonial__image">
						<img class="swiper-lazy" data-src="https://pollosdigital.com.br/wp-content/uploads/2024/09/10-2.jpg" alt="Natalie Cooper">
													<div class="swiper-lazy-preloader"></div>
											</div>
								<cite class="elementor-testimonial__cite"><span class="elementor-testimonial__name">Natalie Cooper</span><span class="elementor-testimonial__title">CEO Chiroease</span></cite>			</div>
		</div>
								</div>
											<div class="swiper-slide">
									<div class="elementor-testimonial">
							<div class="elementor-testimonial__content">
					<div class="elementor-testimonial__text">
						"Potenti finibus nam ligula inceptos dis imperdiet nisi aliquet morbi urna commodo aliquam consectetuer curae adipiscing ante feugiat donec dictum ex nunc condimentum a viverra"					</div>
									</div>
						<div class="elementor-testimonial__footer">
									<div class="elementor-testimonial__image">
						<img class="swiper-lazy" data-src="https://pollosdigital.com.br/wp-content/uploads/2024/09/31.jpg" alt="Noona Miller">
													<div class="swiper-lazy-preloader"></div>
											</div>
								<cite class="elementor-testimonial__cite"><span class="elementor-testimonial__name">Noona Miller</span><span class="elementor-testimonial__title">CEO Medilife</span></cite>			</div>
		</div>
								</div>
									</div>
																					</div>
		</div>
				</div>
				</div>
				</div>
		<div class="elementor-element elementor-element-525444cc e-con-full e-flex e-con e-child" data-id="525444cc" data-element_type="container">
				<div class="elementor-element elementor-element-537f8c01 elementor-widget elementor-widget-heading" data-id="537f8c01" data-element_type="widget" data-widget_type="heading.default">
				<div class="elementor-widget-container">
			<h6 class="elementor-heading-title elementor-size-default">Testimonial</h6>		</div>
				</div>
				<div class="elementor-element elementor-element-38cbe8f7 elementor-widget elementor-widget-heading" data-id="38cbe8f7" data-element_type="widget" data-widget_type="heading.default">
				<div class="elementor-widget-container">
			<h2 class="elementor-heading-title elementor-size-default">Client Feedback & Reviews.</h2>		</div>
				</div>
				<div class="elementor-element elementor-element-14087207 elementor-widget elementor-widget-text-editor" data-id="14087207" data-element_type="widget" data-widget_type="text-editor.default">
				<div class="elementor-widget-container">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.</p>						</div>
				</div>
				<div class="elementor-element elementor-element-618fef38 elementor-widget-divider--view-line elementor-widget elementor-widget-divider" data-id="618fef38" data-element_type="widget" data-widget_type="divider.default">
				<div class="elementor-widget-container">
					<div class="elementor-divider">
			<span class="elementor-divider-separator">
						</span>
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
var elementorWebCliConfig = {"isDebug":false,"urls":{"rest":"https:\/\/pollosdigital.com.br\/wp-json\/","assets":"https:\/\/pollosdigital.com.br\/wp-content\/plugins\/elementor\/assets\/"},"nonce":"3588bb5544","version":"3.24.2"};
var elementorWebCliConfig = {"isDebug":false,"urls":{"rest":"https:\/\/pollosdigital.com.br\/wp-json\/","assets":"https:\/\/pollosdigital.com.br\/wp-content\/plugins\/elementor\/assets\/"},"nonce":"3588bb5544","version":"3.24.2"};
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
var elementorNotesConfig = {"route":{"title":"Leonardo","url":"\/?p=4266","note_url_pattern":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-pro-notes-proxy&note-id={{NOTE_ID}}","post_id":4266,"is_elementor_library":false},"direction":"ltr","is_debug":false,"current_user_can":{"create":true,"create_users":true,"edit_users":true},"urls":{"admin_url_create_user":"https:\/\/pollosdigital.com.br\/wp-admin\/user-new.php","admin_url_edit_user":"https:\/\/pollosdigital.com.br\/wp-admin\/user-edit.php","avatar_defaults":{"24":"https:\/\/secure.gravatar.com\/avatar\/?s=24&d=mm&r=g","48":"https:\/\/secure.gravatar.com\/avatar\/?s=48&d=mm&r=g","96":"https:\/\/secure.gravatar.com\/avatar\/?s=96&d=mm&r=g"},"help_notes_features":"https:\/\/go.elementor.com\/app-notes"}};
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
var wpApiSettings = {"root":"https:\/\/pollosdigital.com.br\/wp-json\/","nonce":"3588bb5544","versionString":"wp\/v2\/"};
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
var elementorCommonConfig = {"version":"3.24.2","isRTL":false,"isDebug":false,"isElementorDebug":false,"activeModules":["ajax","finder","connect","event-tracker"],"experimentalFeatures":{"e_font_icon_svg":true,"additional_custom_breakpoints":true,"container":true,"container_grid":true,"e_swiper_latest":true,"e_nested_atomic_repeaters":true,"e_optimized_control_loading":true,"e_onboarding":true,"theme_builder_v2":true,"hello-theme-header-footer":true,"home_screen":true,"ai-layout":true,"editor_v2":true,"e_element_cache":true,"link-in-bio":true,"floating-buttons":true,"display-conditions":true,"form-submissions":true},"urls":{"assets":"https:\/\/pollosdigital.com.br\/wp-content\/plugins\/elementor\/assets\/","rest":"https:\/\/pollosdigital.com.br\/wp-json\/"},"filesUpload":{"unfilteredFiles":true},"library_connect":{"is_connected":false,"subscription_plans":{"free":{"label":null,"promotion_url":null,"color":null},"essential":{"label":"Pro","promotion_url":"https:\/\/my.elementor.com\/upgrade-subscription\/?utm_source=template-library&utm_medium=wp-dash&utm_campaign=gopro","color":"#92003B"},"essential-oct2023":{"label":"Advanced","promotion_url":"https:\/\/my.elementor.com\/upgrade-subscription\/?utm_source=template-library&utm_medium=wp-dash&utm_campaign=gopro","color":"#92003B"},"advanced":{"label":"Advanced","promotion_url":"https:\/\/my.elementor.com\/upgrade-subscription\/?utm_source=template-library&utm_medium=wp-dash&utm_campaign=gopro","color":"#92003B"},"expert":{"label":"Expert","promotion_url":"https:\/\/my.elementor.com\/upgrade-subscription\/?utm_source=template-library&utm_medium=wp-dash&utm_campaign=gopro","color":"#92003B"},"agency":{"label":"Agency","promotion_url":"https:\/\/my.elementor.com\/upgrade-subscription\/?utm_source=template-library&utm_medium=wp-dash&utm_campaign=gopro","color":"#92003B"}},"base_access_level":0,"base_access_tier":"free","current_access_level":1,"current_access_tier":"advanced"},"ajax":{"url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin-ajax.php","nonce":"f7c5782c0f"},"finder":{"data":{"edit":{"title":"Editar","dynamic":true,"name":"edit"},"general":{"title":"Geral","dynamic":false,"items":{"saved-templates":{"title":"Modelos guardados","icon":"library-save","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?post_type=elementor_library&tabs_group=library","keywords":["template","section","page","library"]},"system-info":{"title":"Informa\u00e7\u00f5es do sistema","icon":"info-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-system-info","keywords":["system","info","environment","elementor"]},"role-manager":{"title":"Gestor de pap\u00e9is","icon":"person","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-role-manager","keywords":["role","manager","user","elementor"]},"knowledge-base":{"title":"Base de conhecimento","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=go_knowledge_base_site","keywords":["help","knowledge","docs","elementor"]},"theme-builder":{"title":"Construtor de tema","icon":"library-save","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-app&ver=3.24.2#\/site-editor","keywords":["template","header","footer","single","archive","search","404","library"]},"kit-library":{"title":"Kit Library","icon":"kit-parts","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-app&ver=3.24.2#\/kit-library","keywords":["kit library","kit","library","site parts","parts","assets","templates"]},"popups":{"title":"Popups","icon":"library-save","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?post_type=elementor_library&tabs_group=popup&elementor_library_type=popup","keywords":["template","popup","library"]}},"name":"general"},"create":{"title":"Criar","dynamic":false,"items":{"page":{"title":"Add New Page Template","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&template_type=page&_wpnonce=ee815c2372","keywords":["Add New Page Template","post","page","template","new","create"]},"section":{"title":"Adicionar novo Section","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=ee815c2372&template_type=section","keywords":["Adicionar novo Section","post","page","template","new","create"]},"container":{"title":"Adicionar novo Container","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&template_type=container&_wpnonce=ee815c2372","keywords":["Adicionar novo Container","post","page","template","new","create"]},"wp-post":{"title":"Adicionar novo Artigo","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=post&template_type=wp-post&_wpnonce=ee815c2372","keywords":["Adicionar novo Artigo","post","page","template","new","create"]},"wp-page":{"title":"Adicionar novo P\u00e1gina","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=page&template_type=wp-page&_wpnonce=ee815c2372","keywords":["Adicionar novo P\u00e1gina","post","page","template","new","create"]},"popup":{"title":"Adicionar novo Popup","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=ee815c2372&template_type=popup","keywords":["Adicionar novo Popup","post","page","template","new","create"]},"header":{"title":"Adicionar novo Header","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=ee815c2372&template_type=header","keywords":["Adicionar novo Header","post","page","template","new","create"]},"footer":{"title":"Adicionar novo Footer","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=ee815c2372&template_type=footer","keywords":["Adicionar novo Footer","post","page","template","new","create"]},"single":{"title":"Adicionar novo Single","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=ee815c2372&template_type=single","keywords":["Adicionar novo Single","post","page","template","new","create"]},"single-post":{"title":"Adicionar novo Single Post","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=ee815c2372&template_type=single-post","keywords":["Adicionar novo Single Post","post","page","template","new","create"]},"single-page":{"title":"Adicionar novo Single Page","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=ee815c2372&template_type=single-page&_elementor_template_sub_type=page","keywords":["Adicionar novo Single Page","post","page","template","new","create"]},"archive":{"title":"Adicionar novo Archive","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=ee815c2372&template_type=archive","keywords":["Adicionar novo Archive","post","page","template","new","create"]},"search-results":{"title":"Adicionar novo Resultados da pesquisa","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=ee815c2372&template_type=search-results&_elementor_template_sub_type=search","keywords":["Adicionar novo Resultados da pesquisa","post","page","template","new","create"]},"error-404":{"title":"Adicionar novo Error 404","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=ee815c2372&template_type=error-404&_elementor_template_sub_type=not_found404","keywords":["Adicionar novo Error 404","post","page","template","new","create"]},"code_snippet":{"title":"Adicionar novo Custom Code","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/post-new.php?post_type=elementor_snippet","keywords":["Adicionar novo Custom Code","post","page","template","new","create"]},"floating-buttons":{"title":"Adicionar novo Floating Element","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=ee815c2372&template_type=floating-buttons","keywords":["Adicionar novo Floating Element","post","page","template","new","create"]},"loop-item":{"title":"Adicionar novo Loop Item","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=ee815c2372&template_type=loop-item","keywords":["Adicionar novo Loop Item","post","page","template","new","create"]},"theme-template":{"title":"Add New Theme Template","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-app&ver=3.24.2#\/site-editor\/add-new","keywords":["template","theme","new","create"]},"loop-template":{"title":"Add New Loop Template","icon":"plus-circle-o","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?post_type=elementor_library&tabs_group=theme&elementor_library_type=loop-item#add_new","keywords":["template","theme","new","create","loop","dynamic","listing","archive","repeater"]}},"name":"create"},"site":{"title":"Site","dynamic":false,"items":{"homepage":{"title":"P\u00e1gina inicial","url":"https:\/\/pollosdigital.com.br","icon":"home-heart","keywords":["home","page"]},"wordpress-dashboard":{"title":"Painel","icon":"dashboard","url":"https:\/\/pollosdigital.com.br\/wp-admin\/","keywords":["dashboard","wordpress"]},"wordpress-menus":{"title":"Menus","icon":"wordpress","url":"https:\/\/pollosdigital.com.br\/wp-admin\/nav-menus.php","keywords":["menu","wordpress"]},"wordpress-themes":{"title":"Temas","icon":"wordpress","url":"https:\/\/pollosdigital.com.br\/wp-admin\/themes.php","keywords":["themes","wordpress"]},"wordpress-customizer":{"title":"Personalizador","icon":"wordpress","url":"https:\/\/pollosdigital.com.br\/wp-admin\/customize.php","keywords":["customizer","wordpress"]},"wordpress-plugins":{"title":"Plugins","icon":"wordpress","url":"https:\/\/pollosdigital.com.br\/wp-admin\/plugins.php","keywords":["plugins","wordpress"]},"wordpress-users":{"title":"Utilizadores","icon":"wordpress","url":"https:\/\/pollosdigital.com.br\/wp-admin\/users.php","keywords":["users","profile","wordpress"]},"apps":{"title":"Add-ons","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-apps","icon":"apps","keywords":["apps","addon","plugin","extension","integration"]}},"name":"site"},"settings":{"title":"Defini\u00e7\u00f5es","dynamic":false,"items":{"general-settings":{"title":"Defini\u00e7\u00f5es gerais","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-settings#tab-general","keywords":["general","settings","elementor"]},"integrations":{"title":"Integra\u00e7\u00f5es","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-settings#tab-integrations","keywords":["integrations","settings","elementor"]},"advanced":{"title":"Avan\u00e7ado","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-settings#tab-advanced","keywords":["advanced","settings","elementor"]},"performance":{"title":"Performance","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-settings#tab-performance","keywords":["performance","settings","elementor"]},"experiments":{"title":"Experiments","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-settings#tab-experiments","keywords":["settings","elementor","experiments"]},"features":{"title":"Features","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-settings#tab-experiments","keywords":["settings","elementor","features"]},"element-manager":{"title":"Element Manager","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-element-manager","keywords":["settings","elements","widgets","manager"]},"custom-fonts":{"title":"Custom Fonts","icon":"typography","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?post_type=elementor_font","keywords":["custom","fonts","elementor"]},"custom-icons":{"title":"Custom Icons","icon":"favorite","url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?post_type=elementor_icons","keywords":["custom","icons","elementor"]}},"name":"settings"},"tools":{"title":"Ferramentas","dynamic":false,"items":{"tools":{"title":"Ferramentas","icon":"tools","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-tools","keywords":["tools","regenerate css","safe mode","debug bar","sync library","elementor"]},"replace-url":{"title":"Substituir URL","icon":"tools","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-tools#tab-replace_url","keywords":["tools","replace url","domain","elementor"]},"maintenance-mode":{"title":"Modo de manuten\u00e7\u00e3o","icon":"tools","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-tools#tab-maintenance_mode","keywords":["tools","maintenance","coming soon","elementor"]},"import-export":{"title":"Import Export","icon":"import-export","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-tools#tab-import-export-kit","keywords":["tools","import export","import","export","kit"]},"version-control":{"title":"Controlo de vers\u00f5es","icon":"time-line","url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-tools#tab-versions","keywords":["tools","version","control","rollback","beta","elementor"]}},"name":"tools"}}},"connect":[],"event-tracker":{"isUserDataShared":true}};
</script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/js/common.min.js?ver=3.24.2" id="elementor-common-js"></script>
<script id="elementor-app-loader-js-before">
var elementorAppConfig = {"menu_url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-app&ver=3.24.2#\/site-editor","assets_url":"https:\/\/pollosdigital.com.br\/wp-content\/plugins\/elementor\/assets\/","pages_url":"https:\/\/pollosdigital.com.br\/wp-admin\/edit.php?post_type=page","return_url":"https:\/\/pollosdigital.com.br\/","hasPro":true,"admin_url":"https:\/\/pollosdigital.com.br\/wp-admin\/","login_url":"https:\/\/pollosdigital.com.br\/wp-login.php","base_url":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-app&ver=3.24.2","promotion":{"upgrade_url":"https:\/\/go.elementor.com\/go-pro-theme-builder\/"},"site-editor":[],"import-export":[],"kit-library":[],"onboarding":[]};
</script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/js/app-loader.min.js?ver=3.24.2" id="elementor-app-loader-js"></script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor-pro/assets/lib/lottie/lottie.min.js?ver=5.6.6" id="lottie-js"></script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/lib/jquery-numerator/jquery-numerator.min.js?ver=0.2.1" id="jquery-numerator-js"></script>
<script src="https://pollosdigital.com.br/wp-includes/js/imagesloaded.min.js?ver=5.0.0" id="imagesloaded-js"></script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor-pro/assets/js/webpack-pro.runtime.min.js?ver=3.24.1" id="elementor-pro-webpack-runtime-js"></script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/js/webpack.runtime.min.js?ver=3.24.2" id="elementor-webpack-runtime-js"></script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/js/frontend-modules.min.js?ver=3.24.2" id="elementor-frontend-modules-js"></script>
<script id="elementor-pro-frontend-js-before">
var ElementorProFrontendConfig = {"ajaxurl":"https:\/\/pollosdigital.com.br\/wp-admin\/admin-ajax.php","nonce":"389ad49bc1","urls":{"assets":"https:\/\/pollosdigital.com.br\/wp-content\/plugins\/elementor-pro\/assets\/","rest":"https:\/\/pollosdigital.com.br\/wp-json\/"},"settings":{"lazy_load_background_images":true},"shareButtonsNetworks":{"facebook":{"title":"Facebook","has_counter":true},"twitter":{"title":"Twitter"},"linkedin":{"title":"LinkedIn","has_counter":true},"pinterest":{"title":"Pinterest","has_counter":true},"reddit":{"title":"Reddit","has_counter":true},"vk":{"title":"VK","has_counter":true},"odnoklassniki":{"title":"OK","has_counter":true},"tumblr":{"title":"Tumblr"},"digg":{"title":"Digg"},"skype":{"title":"Skype"},"stumbleupon":{"title":"StumbleUpon","has_counter":true},"mix":{"title":"Mix"},"telegram":{"title":"Telegram"},"pocket":{"title":"Pocket","has_counter":true},"xing":{"title":"XING","has_counter":true},"whatsapp":{"title":"WhatsApp"},"email":{"title":"Email"},"print":{"title":"Print"},"x-twitter":{"title":"X"},"threads":{"title":"Threads"}},"facebook_sdk":{"lang":"pt_PT","app_id":""},"lottie":{"defaultAnimationUrl":"https:\/\/pollosdigital.com.br\/wp-content\/plugins\/elementor-pro\/modules\/lottie\/assets\/animations\/default.json"}};
</script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor-pro/assets/js/frontend.min.js?ver=3.24.1" id="elementor-pro-frontend-js"></script>
<script id="elementor-frontend-js-before">
var elementorFrontendConfig = {"environmentMode":{"edit":false,"wpPreview":false,"isScriptDebug":false},"i18n":{"shareOnFacebook":"Partilhar no Facebook","shareOnTwitter":"Partilhar no Twitter","pinIt":"Fix\u00e1-lo","download":"Download","downloadImage":"Descarregar Imagem","fullscreen":"\u00c9cr\u00e3 Inteiro","zoom":"Zoom","share":"Partilhar","playVideo":"Reproduzir v\u00eddeo","previous":"Anterior","next":"Seguinte","close":"Fechar","a11yCarouselWrapperAriaLabel":"Carousel | Horizontal scrolling: Arrow Left & Right","a11yCarouselPrevSlideMessage":"Previous slide","a11yCarouselNextSlideMessage":"Next slide","a11yCarouselFirstSlideMessage":"This is the first slide","a11yCarouselLastSlideMessage":"This is the last slide","a11yCarouselPaginationBulletMessage":"Go to slide"},"is_rtl":false,"breakpoints":{"xs":0,"sm":480,"md":768,"lg":1025,"xl":1440,"xxl":1600},"responsive":{"breakpoints":{"mobile":{"label":"Mobile ao alto","value":767,"default_value":767,"direction":"max","is_enabled":true},"mobile_extra":{"label":"Mobile ao baixo","value":880,"default_value":880,"direction":"max","is_enabled":false},"tablet":{"label":"Tablet Portrait","value":1024,"default_value":1024,"direction":"max","is_enabled":true},"tablet_extra":{"label":"Tablet Landscape","value":1200,"default_value":1200,"direction":"max","is_enabled":false},"laptop":{"label":"Port\u00e1til","value":1366,"default_value":1366,"direction":"max","is_enabled":false},"widescreen":{"label":"Widescreen","value":2400,"default_value":2400,"direction":"min","is_enabled":false}}},"version":"3.24.2","is_static":false,"experimentalFeatures":{"e_font_icon_svg":true,"additional_custom_breakpoints":true,"container":true,"container_grid":true,"e_swiper_latest":true,"e_nested_atomic_repeaters":true,"e_optimized_control_loading":true,"e_onboarding":true,"theme_builder_v2":true,"hello-theme-header-footer":true,"home_screen":true,"ai-layout":true,"editor_v2":true,"e_element_cache":true,"link-in-bio":true,"floating-buttons":true,"display-conditions":true,"form-submissions":true},"urls":{"assets":"https:\/\/pollosdigital.com.br\/wp-content\/plugins\/elementor\/assets\/","ajaxurl":"https:\/\/pollosdigital.com.br\/wp-admin\/admin-ajax.php"},"nonces":{"floatingButtonsClickTracking":"b597edd159"},"swiperClass":"swiper","settings":{"page":[],"editorPreferences":[]},"kit":{"active_breakpoints":["viewport_mobile","viewport_tablet"],"global_image_lightbox":"yes","lightbox_enable_counter":"yes","lightbox_enable_fullscreen":"yes","lightbox_enable_zoom":"yes","lightbox_enable_share":"yes","lightbox_title_src":"title","lightbox_description_src":"description","hello_header_logo_type":"logo","hello_header_menu_layout":"horizontal","hello_footer_logo_type":"logo"},"post":{"id":4266,"title":"Leonardo%20%E2%80%93%20Pollos%20Digital","excerpt":"","featuredImage":false},"user":{"roles":["administrator"]}};
</script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/js/frontend.min.js?ver=3.24.2" id="elementor-frontend-js"></script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor-pro/assets/js/elements-handlers.min.js?ver=3.24.1" id="pro-elements-handlers-js"></script>
<script id="elementor-admin-bar-js-before">
var elementorAdminBarConfig = {"elementor_edit_page":{"id":"elementor_edit_page","title":"Editar com o Elementor","href":"https:\/\/pollosdigital.com.br\/wp-admin\/post.php?post=4266&action=elementor","children":{"4267":{"id":"elementor_site_settings","title":"Defini\u00e7\u00f5es do site","sub_title":"Site","href":"https:\/\/pollosdigital.com.br\/wp-admin\/post.php?post=4266&action=elementor&active-document=8","class":"elementor-site-settings","parent_class":"elementor-second-section"},"4268":{"id":"elementor_app_site_editor","title":"Construtor de tema","sub_title":"Site","href":"https:\/\/pollosdigital.com.br\/wp-admin\/admin.php?page=elementor-app&ver=3.24.2#\/site-editor","class":"elementor-app-link","parent_class":"elementor-second-section"}}}};
</script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/js/elementor-admin-bar.min.js?ver=3.24.2" id="elementor-admin-bar-js"></script>
<script src="https://pollosdigital.com.br/wp-includes/js/hoverintent-js.min.js?ver=2.2.1" id="hoverintent-js-js"></script>
<script src="https://pollosdigital.com.br/wp-includes/js/admin-bar.min.js?ver=6.6.2" id="admin-bar-js"></script>
	</body>
</html>

        <!-- /wp:code -->""";

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
window._wpemojiSettings = {"baseUrl":"https:\\/\\/s.w.org\\/images\\/core\\/emoji\\/15.0.3\\/72x72\\/","ext":".png","svgUrl":"https:\\/\\/s.w.org\\/images\\/core\\/emoji\\/15.0.3\\/svg\\/","svgExt":".svg","source":{"concatemoji":"https:\\/\\/pollosdigital.com.br\\/wp-includes\\/js\\/wp-emoji-release.min.js?ver=6.6.2"}};
/*! This file is auto-generated */
!function(i,n){var o,s,e;function c(e){try{var t={supportTests:e,timestamp:(new Date).valueOf()};sessionStorage.setItem(o,JSON.stringify(t))}catch(e){}}function p(e,t,n){e.clearRect(0,0,e.canvas.width,e.canvas.height),e.fillText(t,0,0);var t=new Uint32Array(e.getImageData(0,0,e.canvas.width,e.canvas.height).data),r=(e.clearRect(0,0,e.canvas.width,e.canvas.height),e.fillText(n,0,0),new Uint32Array(e.getImageData(0,0,e.canvas.width,e.canvas.height).data));return t.every(function(e,t){return e===r[t]})}function u(e,t,n){switch(t){case"flag":return n(e,"\\ud83c\\udff3\\ufe0f\\u200d\\u26a7\\ufe0f","\\ud83c\\udff3\\ufe0f\\u200b\\u26a7\\ufe0f")?!1:!n(e,"\\ud83c\\uddfa\\ud83c\\uddf3","\\ud83c\\uddfa\\u200b\\ud83c\\uddf3")&&!n(e,"\\ud83c\\udff4\\udb40\\udc67\\udb40\\udc62\\udb40\\udc65\\udb40\\udc6e\\udb40\\udc67\\udb40\\udc7f","\\ud83c\\udff4\\u200b\\udb40\\udc67\\u200b\\udb40\\udc62\\u200b\\udb40\\udc65\\u200b\\udb40\\udc6e\\u200b\\udb40\\udc67\\u200b\\udb40\\udc7f");case"emoji":return!n(e,"\\ud83d\\udc26\\u200d\\u2b1b","\\ud83d\\udc26\\u200b\\u2b1b")}return!1}function f(e,t,n){var r="undefined"!=typeof WorkerGlobalScope&&self instanceof WorkerGlobalScope?new OffscreenCanvas(300,150):i.createElement("canvas"),a=r.getContext("2d",{willReadFrequently:!0}),o=(a.textBaseline="top",a.font="600 32px Arial",{});return e.forEach(function(e){o[e]=t(a,e,n)}),o}function t(e){var t=i.createElement("script");t.src=e,t.defer=!0,i.head.appendChild(t)}"undefined"!=typeof Promise&&(o="wpEmojiSettingsSupports",s=["flag","emoji"],n.supports={everything:!0,everythingExceptFlag:!0},e=new Promise(function(e){i.addEventListener("DOMContentLoaded",e,{once:!0})}),new Promise(function(t){var n=function(){try{var e=JSON.parse(sessionStorage.getItem(o));if("object"==typeof e&&"number"==typeof e.timestamp&&(new Date).valueOf()<e.timestamp+604800&&"object"==typeof e.supportTests)return e.supportTests}catch(e){}return null}();if(!n){if("undefined"!=typeof Worker&&"undefined"!=typeof OffscreenCanvas&&"undefined"!=typeof URL&&URL.createObjectURL&&"undefined"!=typeof Blob)try{var e="postMessage("+f.toString()+"("+[JSON.stringify(s),u.toString(),p.toString()].join(",")+"));",r=new Blob([e],{type:"text/javascript"}),a=new Worker(URL.createObjectURL(r),{name:"wpTestEmojiSupports"});return void(a.onmessage=function(e){c(n=e.data),a.terminate(),t(n)})}catch(e){}c(n=f(s,u,p))}t(n)}).then(function(e){for(var t in e)n.supports[t]=e[t],n.supports.everything=n.supports.everything&&n.supports[t],"flag"!==t&&(n.supports.everythingExceptFlag=n.supports.everythingExceptFlag&&n.supports[t]);n.supports.everythingExceptFlag=n.supports.everythingExceptFlag&&!n.supports.flag,n.DOMReady=!1,n.readyCallback=function(){n.DOMReady=!0}}).then(function(){return e}).then(function(){var e;n.supports.everything||(n.readyCallback(),(e=n.source||{}).concatemoji?t(e.concatemoji):e.wpemoji&&e.twemoji&&(t(e.twemoji),t(e.wpemoji)))}))}((window,document),window._wpemojiSettings);
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
var elementorAppProConfig = {"baseUrl":"https:\\/\\/pollosdigital.com.br\\/wp-content\\/plugins\\/elementor-pro\\/","site-editor":{"urls":{"legacy_view":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/edit.php?post_type=elementor_library&tabs_group=theme"},"utms":{"utm_source":"theme-builder","utm_medium":"wp-dash"}},"kit-library":[],"onboarding":[],"import-export":[]};
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
			var request, b = document.body, c = 'className', cs = 'customize-support', rcs = new RegExp('(^|\\\\s+)(no-)?'+cs+'(\\\\s+|\$)');

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
var elementorWebCliConfig = {"isDebug":false,"urls":{"rest":"https:\\/\\/pollosdigital.com.br\\/wp-json\\/","assets":"https:\\/\\/pollosdigital.com.br\\/wp-content\\/plugins\\/elementor\\/assets\\/"},"nonce":"e8303afb0d","version":"3.24.2"};
var elementorWebCliConfig = {"isDebug":false,"urls":{"rest":"https:\\/\\/pollosdigital.com.br\\/wp-json\\/","assets":"https:\\/\\/pollosdigital.com.br\\/wp-content\\/plugins\\/elementor\\/assets\\/"},"nonce":"e8303afb0d","version":"3.24.2"};
</script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/js/web-cli.min.js?ver=3.24.2" id="elementor-web-cli-js"></script>
<script src="https://pollosdigital.com.br/wp-includes/js/dist/vendor/react.min.js?ver=18.3.1" id="react-js"></script>
<script src="https://pollosdigital.com.br/wp-includes/js/dist/vendor/react-dom.min.js?ver=18.3.1" id="react-dom-js"></script>
<script src="https://pollosdigital.com.br/wp-includes/js/dist/hooks.min.js?ver=2810c76e705dd1a53b18" id="wp-hooks-js"></script>
<script src="https://pollosdigital.com.br/wp-includes/js/dist/i18n.min.js?ver=5e580eb46a90c2b997e6" id="wp-i18n-js"></script>
<script id="wp-i18n-js-after">
wp.i18n.setLocaleData( { 'text direction\\u0004ltr': [ 'ltr' ] } );
</script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor-pro/assets/js/notes/notes.min.js?ver=3.24.1" id="elementor-pro-notes-js"></script>
<script id="elementor-pro-notes-app-initiator-js-before">
var elementorNotesConfig = {"route":{"title":"Leonardo v02","url":"\\/?p=3564","note_url_pattern":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin.php?page=elementor-pro-notes-proxy&note-id={{NOTE_ID}}","post_id":3564,"is_elementor_library":false},"direction":"ltr","is_debug":false,"current_user_can":{"create":true,"create_users":true,"edit_users":true},"urls":{"admin_url_create_user":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/user-new.php","admin_url_edit_user":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/user-edit.php","avatar_defaults":{"24":"https:\\/\\/secure.gravatar.com\\/avatar\\/?s=24&d=mm&r=g","48":"https:\\/\\/secure.gravatar.com\\/avatar\\/?s=48&d=mm&r=g","96":"https:\\/\\/secure.gravatar.com\\/avatar\\/?s=96&d=mm&r=g"},"help_notes_features":"https:\\/\\/go.elementor.com\\/app-notes"}};
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
var wpApiSettings = {"root":"https:\\/\\/pollosdigital.com.br\\/wp-json\\/","nonce":"e8303afb0d","versionString":"wp\\/v2\\/"};
</script>
<script src="https://pollosdigital.com.br/wp-includes/js/api-request.min.js?ver=6.6.2" id="wp-api-request-js"></script>
<script id="elementor-dev-tools-js-before">
var elementorDevToolsConfig = {"isDebug":false,"urls":{"assets":"https:\\/\\/pollosdigital.com.br\\/wp-content\\/plugins\\/elementor\\/assets\\/"},"deprecation":{"soft_notices":[],"soft_version_count":4,"hard_version_count":8,"current_version":"3.24.2"}};
var elementorDevToolsConfig = {"isDebug":false,"urls":{"assets":"https:\\/\\/pollosdigital.com.br\\/wp-content\\/plugins\\/elementor\\/assets\\/"},"deprecation":{"soft_notices":[],"soft_version_count":4,"hard_version_count":8,"current_version":"3.24.2"}};
var elementorDevToolsConfig = {"isDebug":false,"urls":{"assets":"https:\\/\\/pollosdigital.com.br\\/wp-content\\/plugins\\/elementor\\/assets\\/"},"deprecation":{"soft_notices":[],"soft_version_count":4,"hard_version_count":8,"current_version":"3.24.2"}};
</script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/js/dev-tools.min.js?ver=3.24.2" id="elementor-dev-tools-js"></script>
<script id="elementor-common-js-translations">
( function( domain, translations ) {
	var localeData = translations.locale_data[ domain ] || translations.locale_data.messages;
	localeData[""].domain = domain;
	wp.i18n.setLocaleData( localeData, domain );
} )( "elementor", {"translation-revision-date":"2024-09-11 14:11:30+0000","generator":"GlotPress\\/4.0.1","domain":"messages","locale_data":{"messages":{"":{"domain":"messages","plural-forms":"nplurals=2; plural=n != 1;","lang":"pt"},"Before you enable unfiltered files upload, note that such files include a security risk. Elementor does run a process to remove possible malicious code, but there is still risk involved when using such files.":["Antes de ativares o carregamento de ficheiros SVG, observa que os ficheiros SVG incluem um risco de seguran\\u00e7a. O Elementor executa um processo para remover poss\\u00edveis c\\u00f3digos maliciosos, mas ainda h\\u00e1 riscos envolvidos ao usar esses ficheiros."],"Enable":["Activar"],"Cancel":["Cancelar"]}},"comment":{"reference":"assets\\/js\\/common.js"}} );
</script>
<script id="elementor-common-js-before">
var elementorCommonConfig = {"version":"3.24.2","isRTL":false,"isDebug":false,"isElementorDebug":false,"activeModules":["ajax","finder","connect","event-tracker"],"experimentalFeatures":{"e_font_icon_svg":true,"additional_custom_breakpoints":true,"container":true,"container_grid":true,"e_swiper_latest":true,"e_nested_atomic_repeaters":true,"e_optimized_control_loading":true,"e_onboarding":true,"theme_builder_v2":true,"hello-theme-header-footer":true,"home_screen":true,"ai-layout":true,"editor_v2":true,"e_element_cache":true,"link-in-bio":true,"floating-buttons":true,"display-conditions":true,"form-submissions":true},"urls":{"assets":"https:\\/\\/pollosdigital.com.br\\/wp-content\\/plugins\\/elementor\\/assets\\/","rest":"https:\\/\\/pollosdigital.com.br\\/wp-json\\/"},"filesUpload":{"unfilteredFiles":true},"library_connect":{"is_connected":false,"subscription_plans":{"free":{"label":null,"promotion_url":null,"color":null},"essential":{"label":"Pro","promotion_url":"https:\\/\\/my.elementor.com\\/upgrade-subscription\\/?utm_source=template-library&utm_medium=wp-dash&utm_campaign=gopro","color":"#92003B"},"essential-oct2023":{"label":"Advanced","promotion_url":"https:\\/\\/my.elementor.com\\/upgrade-subscription\\/?utm_source=template-library&utm_medium=wp-dash&utm_campaign=gopro","color":"#92003B"},"advanced":{"label":"Advanced","promotion_url":"https:\\/\\/my.elementor.com\\/upgrade-subscription\\/?utm_source=template-library&utm_medium=wp-dash&utm_campaign=gopro","color":"#92003B"},"expert":{"label":"Expert","promotion_url":"https:\\/\\/my.elementor.com\\/upgrade-subscription\\/?utm_source=template-library&utm_medium=wp-dash&utm_campaign=gopro","color":"#92003B"},"agency":{"label":"Agency","promotion_url":"https:\\/\\/my.elementor.com\\/upgrade-subscription\\/?utm_source=template-library&utm_medium=wp-dash&utm_campaign=gopro","color":"#92003B"}},"base_access_level":0,"base_access_tier":"free","current_access_level":1,"current_access_tier":"advanced"},"ajax":{"url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin-ajax.php","nonce":"402febcdcf"},"finder":{"data":{"edit":{"title":"Editar","dynamic":true,"name":"edit"},"general":{"title":"Geral","dynamic":false,"items":{"saved-templates":{"title":"Modelos guardados","icon":"library-save","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/edit.php?post_type=elementor_library&tabs_group=library","keywords":["template","section","page","library"]},"system-info":{"title":"Informa\\u00e7\\u00f5es do sistema","icon":"info-circle-o","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin.php?page=elementor-system-info","keywords":["system","info","environment","elementor"]},"role-manager":{"title":"Gestor de pap\\u00e9is","icon":"person","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin.php?page=elementor-role-manager","keywords":["role","manager","user","elementor"]},"knowledge-base":{"title":"Base de conhecimento","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin.php?page=go_knowledge_base_site","keywords":["help","knowledge","docs","elementor"]},"theme-builder":{"title":"Construtor de tema","icon":"library-save","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin.php?page=elementor-app&ver=3.24.2#\\/site-editor","keywords":["template","header","footer","single","archive","search","404","library"]},"kit-library":{"title":"Kit Library","icon":"kit-parts","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin.php?page=elementor-app&ver=3.24.2#\\/kit-library","keywords":["kit library","kit","library","site parts","parts","assets","templates"]},"popups":{"title":"Popups","icon":"library-save","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/edit.php?post_type=elementor_library&tabs_group=popup&elementor_library_type=popup","keywords":["template","popup","library"]}},"name":"general"},"create":{"title":"Criar","dynamic":false,"items":{"page":{"title":"Add New Page Template","icon":"plus-circle-o","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/edit.php?action=elementor_new_post&post_type=elementor_library&template_type=page&_wpnonce=13c7aba68d","keywords":["Add New Page Template","post","page","template","new","create"]},"section":{"title":"Adicionar novo Section","icon":"plus-circle-o","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=13c7aba68d&template_type=section","keywords":["Adicionar novo Section","post","page","template","new","create"]},"container":{"title":"Adicionar novo Container","icon":"plus-circle-o","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/edit.php?action=elementor_new_post&post_type=elementor_library&template_type=container&_wpnonce=13c7aba68d","keywords":["Adicionar novo Container","post","page","template","new","create"]},"wp-post":{"title":"Adicionar novo Artigo","icon":"plus-circle-o","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/edit.php?action=elementor_new_post&post_type=post&template_type=wp-post&_wpnonce=13c7aba68d","keywords":["Adicionar novo Artigo","post","page","template","new","create"]},"wp-page":{"title":"Adicionar novo P\\u00e1gina","icon":"plus-circle-o","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/edit.php?action=elementor_new_post&post_type=page&template_type=wp-page&_wpnonce=13c7aba68d","keywords":["Adicionar novo P\\u00e1gina","post","page","template","new","create"]},"popup":{"title":"Adicionar novo Popup","icon":"plus-circle-o","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=13c7aba68d&template_type=popup","keywords":["Adicionar novo Popup","post","page","template","new","create"]},"header":{"title":"Adicionar novo Header","icon":"plus-circle-o","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=13c7aba68d&template_type=header","keywords":["Adicionar novo Header","post","page","template","new","create"]},"footer":{"title":"Adicionar novo Footer","icon":"plus-circle-o","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=13c7aba68d&template_type=footer","keywords":["Adicionar novo Footer","post","page","template","new","create"]},"single":{"title":"Adicionar novo Single","icon":"plus-circle-o","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=13c7aba68d&template_type=single","keywords":["Adicionar novo Single","post","page","template","new","create"]},"single-post":{"title":"Adicionar novo Single Post","icon":"plus-circle-o","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=13c7aba68d&template_type=single-post","keywords":["Adicionar novo Single Post","post","page","template","new","create"]},"single-page":{"title":"Adicionar novo Single Page","icon":"plus-circle-o","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=13c7aba68d&template_type=single-page&_elementor_template_sub_type=page","keywords":["Adicionar novo Single Page","post","page","template","new","create"]},"archive":{"title":"Adicionar novo Archive","icon":"plus-circle-o","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=13c7aba68d&template_type=archive","keywords":["Adicionar novo Archive","post","page","template","new","create"]},"search-results":{"title":"Adicionar novo Resultados da pesquisa","icon":"plus-circle-o","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=13c7aba68d&template_type=search-results&_elementor_template_sub_type=search","keywords":["Adicionar novo Resultados da pesquisa","post","page","template","new","create"]},"error-404":{"title":"Adicionar novo Error 404","icon":"plus-circle-o","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=13c7aba68d&template_type=error-404&_elementor_template_sub_type=not_found404","keywords":["Adicionar novo Error 404","post","page","template","new","create"]},"code_snippet":{"title":"Adicionar novo Custom Code","icon":"plus-circle-o","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/post-new.php?post_type=elementor_snippet","keywords":["Adicionar novo Custom Code","post","page","template","new","create"]},"floating-buttons":{"title":"Adicionar novo Floating Element","icon":"plus-circle-o","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=13c7aba68d&template_type=floating-buttons","keywords":["Adicionar novo Floating Element","post","page","template","new","create"]},"loop-item":{"title":"Adicionar novo Loop Item","icon":"plus-circle-o","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/edit.php?action=elementor_new_post&post_type=elementor_library&_wpnonce=13c7aba68d&template_type=loop-item","keywords":["Adicionar novo Loop Item","post","page","template","new","create"]},"theme-template":{"title":"Add New Theme Template","icon":"plus-circle-o","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin.php?page=elementor-app&ver=3.24.2#\\/site-editor\\/add-new","keywords":["template","theme","new","create"]},"loop-template":{"title":"Add New Loop Template","icon":"plus-circle-o","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/edit.php?post_type=elementor_library&tabs_group=theme&elementor_library_type=loop-item#add_new","keywords":["template","theme","new","create","loop","dynamic","listing","archive","repeater"]}},"name":"create"},"site":{"title":"Site","dynamic":false,"items":{"homepage":{"title":"P\\u00e1gina inicial","url":"https:\\/\\/pollosdigital.com.br","icon":"home-heart","keywords":["home","page"]},"wordpress-dashboard":{"title":"Painel","icon":"dashboard","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/","keywords":["dashboard","wordpress"]},"wordpress-menus":{"title":"Menus","icon":"wordpress","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/nav-menus.php","keywords":["menu","wordpress"]},"wordpress-themes":{"title":"Temas","icon":"wordpress","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/themes.php","keywords":["themes","wordpress"]},"wordpress-customizer":{"title":"Personalizador","icon":"wordpress","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/customize.php","keywords":["customizer","wordpress"]},"wordpress-plugins":{"title":"Plugins","icon":"wordpress","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/plugins.php","keywords":["plugins","wordpress"]},"wordpress-users":{"title":"Utilizadores","icon":"wordpress","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/users.php","keywords":["users","profile","wordpress"]},"apps":{"title":"Add-ons","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin.php?page=elementor-apps","icon":"apps","keywords":["apps","addon","plugin","extension","integration"]}},"name":"site"},"settings":{"title":"Defini\\u00e7\\u00f5es","dynamic":false,"items":{"general-settings":{"title":"Defini\\u00e7\\u00f5es gerais","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin.php?page=elementor-settings#tab-general","keywords":["general","settings","elementor"]},"integrations":{"title":"Integra\\u00e7\\u00f5es","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin.php?page=elementor-settings#tab-integrations","keywords":["integrations","settings","elementor"]},"advanced":{"title":"Avan\\u00e7ado","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin.php?page=elementor-settings#tab-advanced","keywords":["advanced","settings","elementor"]},"performance":{"title":"Performance","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin.php?page=elementor-settings#tab-performance","keywords":["performance","settings","elementor"]},"experiments":{"title":"Experiments","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin.php?page=elementor-settings#tab-experiments","keywords":["settings","elementor","experiments"]},"features":{"title":"Features","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin.php?page=elementor-settings#tab-experiments","keywords":["settings","elementor","features"]},"element-manager":{"title":"Element Manager","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin.php?page=elementor-element-manager","keywords":["settings","elements","widgets","manager"]},"custom-fonts":{"title":"Custom Fonts","icon":"typography","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/edit.php?post_type=elementor_font","keywords":["custom","fonts","elementor"]},"custom-icons":{"title":"Custom Icons","icon":"favorite","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/edit.php?post_type=elementor_icons","keywords":["custom","icons","elementor"]}},"name":"settings"},"tools":{"title":"Ferramentas","dynamic":false,"items":{"tools":{"title":"Ferramentas","icon":"tools","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin.php?page=elementor-tools","keywords":["tools","regenerate css","safe mode","debug bar","sync library","elementor"]},"replace-url":{"title":"Substituir URL","icon":"tools","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin.php?page=elementor-tools#tab-replace_url","keywords":["tools","replace url","domain","elementor"]},"maintenance-mode":{"title":"Modo de manuten\\u00e7\\u00e3o","icon":"tools","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin.php?page=elementor-tools#tab-maintenance_mode","keywords":["tools","maintenance","coming soon","elementor"]},"import-export":{"title":"Import Export","icon":"import-export","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin.php?page=elementor-tools#tab-import-export-kit","keywords":["tools","import export","import","export","kit"]},"version-control":{"title":"Controlo de vers\\u00f5es","icon":"time-line","url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin.php?page=elementor-tools#tab-versions","keywords":["tools","version","control","rollback","beta","elementor"]}},"name":"tools"}}},"connect":[],"event-tracker":{"isUserDataShared":true}};
</script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/js/common.min.js?ver=3.24.2" id="elementor-common-js"></script>
<script id="elementor-app-loader-js-before">
var elementorAppConfig = {"menu_url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin.php?page=elementor-app&ver=3.24.2#\\/site-editor","assets_url":"https:\\/\\/pollosdigital.com.br\\/wp-content\\/plugins\\/elementor\\/assets\\/","pages_url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/edit.php?post_type=page","return_url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/","hasPro":true,"admin_url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/","login_url":"https:\\/\\/pollosdigital.com.br\\/wp-login.php","base_url":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin.php?page=elementor-app&ver=3.24.2","promotion":{"upgrade_url":"https:\\/\\/go.elementor.com\\/go-pro-theme-builder\\/"},"site-editor":[],"import-export":[],"kit-library":[],"onboarding":[]};
</script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/js/app-loader.min.js?ver=3.24.2" id="elementor-app-loader-js"></script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor-pro/assets/js/webpack-pro.runtime.min.js?ver=3.24.1" id="elementor-pro-webpack-runtime-js"></script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/js/webpack.runtime.min.js?ver=3.24.2" id="elementor-webpack-runtime-js"></script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/js/frontend-modules.min.js?ver=3.24.2" id="elementor-frontend-modules-js"></script>
<script id="elementor-pro-frontend-js-before">
var ElementorProFrontendConfig = {"ajaxurl":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin-ajax.php","nonce":"e0f29272c2","urls":{"assets":"https:\\/\\/pollosdigital.com.br\\/wp-content\\/plugins\\/elementor-pro\\/assets\\/","rest":"https:\\/\\/pollosdigital.com.br\\/wp-json\\/"},"settings":{"lazy_load_background_images":true},"shareButtonsNetworks":{"facebook":{"title":"Facebook","has_counter":true},"twitter":{"title":"Twitter"},"linkedin":{"title":"LinkedIn","has_counter":true},"pinterest":{"title":"Pinterest","has_counter":true},"reddit":{"title":"Reddit","has_counter":true},"vk":{"title":"VK","has_counter":true},"odnoklassniki":{"title":"OK","has_counter":true},"tumblr":{"title":"Tumblr"},"digg":{"title":"Digg"},"skype":{"title":"Skype"},"stumbleupon":{"title":"StumbleUpon","has_counter":true},"mix":{"title":"Mix"},"telegram":{"title":"Telegram"},"pocket":{"title":"Pocket","has_counter":true},"xing":{"title":"XING","has_counter":true},"whatsapp":{"title":"WhatsApp"},"email":{"title":"Email"},"print":{"title":"Print"},"x-twitter":{"title":"X"},"threads":{"title":"Threads"}},"facebook_sdk":{"lang":"pt_PT","app_id":""},"lottie":{"defaultAnimationUrl":"https:\\/\\/pollosdigital.com.br\\/wp-content\\/plugins\\/elementor-pro\\/modules\\/lottie\\/assets\\/animations\\/default.json"}};
</script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor-pro/assets/js/frontend.min.js?ver=3.24.1" id="elementor-pro-frontend-js"></script>
<script id="elementor-frontend-js-before">
var elementorFrontendConfig = {"environmentMode":{"edit":false,"wpPreview":false,"isScriptDebug":false},"i18n":{"shareOnFacebook":"Partilhar no Facebook","shareOnTwitter":"Partilhar no Twitter","pinIt":"Fix\\u00e1-lo","download":"Download","downloadImage":"Descarregar Imagem","fullscreen":"\\u00c9cr\\u00e3 Inteiro","zoom":"Zoom","share":"Partilhar","playVideo":"Reproduzir v\\u00eddeo","previous":"Anterior","next":"Seguinte","close":"Fechar","a11yCarouselWrapperAriaLabel":"Carousel | Horizontal scrolling: Arrow Left & Right","a11yCarouselPrevSlideMessage":"Previous slide","a11yCarouselNextSlideMessage":"Next slide","a11yCarouselFirstSlideMessage":"This is the first slide","a11yCarouselLastSlideMessage":"This is the last slide","a11yCarouselPaginationBulletMessage":"Go to slide"},"is_rtl":false,"breakpoints":{"xs":0,"sm":480,"md":768,"lg":1025,"xl":1440,"xxl":1600},"responsive":{"breakpoints":{"mobile":{"label":"Mobile ao alto","value":767,"default_value":767,"direction":"max","is_enabled":true},"mobile_extra":{"label":"Mobile ao baixo","value":880,"default_value":880,"direction":"max","is_enabled":false},"tablet":{"label":"Tablet Portrait","value":1024,"default_value":1024,"direction":"max","is_enabled":true},"tablet_extra":{"label":"Tablet Landscape","value":1200,"default_value":1200,"direction":"max","is_enabled":false},"laptop":{"label":"Port\\u00e1til","value":1366,"default_value":1366,"direction":"max","is_enabled":false},"widescreen":{"label":"Widescreen","value":2400,"default_value":2400,"direction":"min","is_enabled":false}}},"version":"3.24.2","is_static":false,"experimentalFeatures":{"e_font_icon_svg":true,"additional_custom_breakpoints":true,"container":true,"container_grid":true,"e_swiper_latest":true,"e_nested_atomic_repeaters":true,"e_optimized_control_loading":true,"e_onboarding":true,"theme_builder_v2":true,"hello-theme-header-footer":true,"home_screen":true,"ai-layout":true,"editor_v2":true,"e_element_cache":true,"link-in-bio":true,"floating-buttons":true,"display-conditions":true,"form-submissions":true},"urls":{"assets":"https:\\/\\/pollosdigital.com.br\\/wp-content\\/plugins\\/elementor\\/assets\\/","ajaxurl":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin-ajax.php"},"nonces":{"floatingButtonsClickTracking":"b13e0d8a4b"},"swiperClass":"swiper","settings":{"page":[],"editorPreferences":[]},"kit":{"active_breakpoints":["viewport_mobile","viewport_tablet"],"global_image_lightbox":"yes","lightbox_enable_counter":"yes","lightbox_enable_fullscreen":"yes","lightbox_enable_zoom":"yes","lightbox_enable_share":"yes","lightbox_title_src":"title","lightbox_description_src":"description","hello_header_logo_type":"logo","hello_header_menu_layout":"horizontal","hello_footer_logo_type":"logo"},"post":{"id":3564,"title":"Leonardo%20v02%20%E2%80%93%20Pollos%20Digital","excerpt":"","featuredImage":false},"user":{"roles":["administrator"]}};
</script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/js/frontend.min.js?ver=3.24.2" id="elementor-frontend-js"></script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor-pro/assets/js/elements-handlers.min.js?ver=3.24.1" id="pro-elements-handlers-js"></script>
<script id="elementor-admin-bar-js-before">
var elementorAdminBarConfig = {"elementor_edit_page":{"id":"elementor_edit_page","title":"Editar com o Elementor","href":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/post.php?post=3564&action=elementor","children":{"3565":{"id":"elementor_site_settings","title":"Defini\\u00e7\\u00f5es do site","sub_title":"Site","href":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/post.php?post=3564&action=elementor&active-document=8","class":"elementor-site-settings","parent_class":"elementor-second-section"},"3566":{"id":"elementor_app_site_editor","title":"Construtor de tema","sub_title":"Site","href":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin.php?page=elementor-app&ver=3.24.2#\\/site-editor","class":"elementor-app-link","parent_class":"elementor-second-section"}}}};
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
window._wpemojiSettings = {"baseUrl":"https:\\/\\/s.w.org\\/images\\/core\\/emoji\\/15.0.3\\/72x72\\/","ext":".png","svgUrl":"https:\\/\\/s.w.org\\/images\\/core\\/emoji\\/15.0.3\\/svg\\/","svgExt":".svg","source":{"concatemoji":"https:\\/\\/pollosdigital.com.br\\/wp-includes\\/js\\/wp-emoji-release.min.js?ver=6.6.2"}};
/*! This file is auto-generated */
!function(i,n){var o,s,e;function c(e){try{var t={supportTests:e,timestamp:(new Date).valueOf()};sessionStorage.setItem(o,JSON.stringify(t))}catch(e){}}function p(e,t,n){e.clearRect(0,0,e.canvas.width,e.canvas.height),e.fillText(t,0,0);var t=new Uint32Array(e.getImageData(0,0,e.canvas.width,e.canvas.height).data),r=(e.clearRect(0,0,e.canvas.width,e.canvas.height),e.fillText(n,0,0),new Uint32Array(e.getImageData(0,0,e.canvas.width,e.canvas.height).data));return t.every(function(e,t){return e===r[t]})}function u(e,t,n){switch(t){case"flag":return n(e,"\\ud83c\\udff3\\ufe0f\\u200d\\u26a7\\ufe0f","\\ud83c\\udff3\\ufe0f\\u200b\\u26a7\\ufe0f")?!1:!n(e,"\\ud83c\\uddfa\\ud83c\\uddf3","\\ud83c\\uddfa\\u200b\\ud83c\\uddf3")&&!n(e,"\\ud83c\\udff4\\udb40\\udc67\\udb40\\udc62\\udb40\\udc65\\udb40\\udc6e\\udb40\\udc67\\udb40\\udc7f","\\ud83c\\udff4\\u200b\\udb40\\udc67\\u200b\\udb40\\udc62\\u200b\\udb40\\udc65\\u200b\\udb40\\udc6e\\u200b\\udb40\\udc67\\u200b\\udb40\\udc7f");case"emoji":return!n(e,"\\ud83d\\udc26\\u200d\\u2b1b","\\ud83d\\udc26\\u200b\\u2b1b")}return!1}function f(e,t,n){var r="undefined"!=typeof WorkerGlobalScope&&self instanceof WorkerGlobalScope?new OffscreenCanvas(300,150):i.createElement("canvas"),a=r.getContext("2d",{willReadFrequently:!0}),o=(a.textBaseline="top",a.font="600 32px Arial",{});return e.forEach(function(e){o[e]=t(a,e,n)}),o}function t(e){var t=i.createElement("script");t.src=e,t.defer=!0,i.head.appendChild(t)}"undefined"!=typeof Promise&&(o="wpEmojiSettingsSupports",s=["flag","emoji"],n.supports={everything:!0,everythingExceptFlag:!0},e=new Promise(function(e){i.addEventListener("DOMContentLoaded",e,{once:!0})}),new Promise(function(t){var n=function(){try{var e=JSON.parse(sessionStorage.getItem(o));if("object"==typeof e&&"number"==typeof e.timestamp&&(new Date).valueOf()<e.timestamp+604800&&"object"==typeof e.supportTests)return e.supportTests}catch(e){}return null}();if(!n){if("undefined"!=typeof Worker&&"undefined"!=typeof OffscreenCanvas&&"undefined"!=typeof URL&&URL.createObjectURL&&"undefined"!=typeof Blob)try{var e="postMessage("+f.toString()+"("+[JSON.stringify(s),u.toString(),p.toString()].join(",")+"));",r=new Blob([e],{type:"text/javascript"}),a=new Worker(URL.createObjectURL(r),{name:"wpTestEmojiSupports"});return void(a.onmessage=function(e){c(n=e.data),a.terminate(),t(n)})}catch(e){}c(n=f(s,u,p))}t(n)}).then(function(e){for(var t in e)n.supports[t]=e[t],n.supports.everything=n.supports.everything&&n.supports[t],"flag"!==t&&(n.supports.everythingExceptFlag=n.supports.everythingExceptFlag&&n.supports[t]);n.supports.everythingExceptFlag=n.supports.everythingExceptFlag&&!n.supports.flag,n.DOMReady=!1,n.readyCallback=function(){n.DOMReady=!0}}).then(function(){return e}).then(function(){var e;n.supports.everything||(n.readyCallback(),(e=n.source||{}).concatemoji?t(e.concatemoji):e.wpemoji&&e.twemoji&&(t(e.twemoji),t(e.wpemoji)))}))}((window,document),window._wpemojiSettings);
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
wp.i18n.setLocaleData( { 'text direction\\u0004ltr': [ 'ltr' ] } );
</script>
<script id="elementor-pro-frontend-js-before">
var ElementorProFrontendConfig = {"ajaxurl":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin-ajax.php","nonce":"0f97a59896","urls":{"assets":"https:\\/\\/pollosdigital.com.br\\/wp-content\\/plugins\\/elementor-pro\\/assets\\/","rest":"https:\\/\\/pollosdigital.com.br\\/wp-json\\/"},"settings":{"lazy_load_background_images":true},"shareButtonsNetworks":{"facebook":{"title":"Facebook","has_counter":true},"twitter":{"title":"Twitter"},"linkedin":{"title":"LinkedIn","has_counter":true},"pinterest":{"title":"Pinterest","has_counter":true},"reddit":{"title":"Reddit","has_counter":true},"vk":{"title":"VK","has_counter":true},"odnoklassniki":{"title":"OK","has_counter":true},"tumblr":{"title":"Tumblr"},"digg":{"title":"Digg"},"skype":{"title":"Skype"},"stumbleupon":{"title":"StumbleUpon","has_counter":true},"mix":{"title":"Mix"},"telegram":{"title":"Telegram"},"pocket":{"title":"Pocket","has_counter":true},"xing":{"title":"XING","has_counter":true},"whatsapp":{"title":"WhatsApp"},"email":{"title":"Email"},"print":{"title":"Print"},"x-twitter":{"title":"X"},"threads":{"title":"Threads"}},"facebook_sdk":{"lang":"pt_PT","app_id":""},"lottie":{"defaultAnimationUrl":"https:\\/\\/pollosdigital.com.br\\/wp-content\\/plugins\\/elementor-pro\\/modules\\/lottie\\/assets\\/animations\\/default.json"}};
</script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor-pro/assets/js/frontend.min.js?ver=3.24.1" id="elementor-pro-frontend-js"></script>
<script src="https://pollosdigital.com.br/wp-includes/js/jquery/ui/core.min.js?ver=1.13.3" id="jquery-ui-core-js"></script>
<script id="elementor-frontend-js-before">
var elementorFrontendConfig = {"environmentMode":{"edit":false,"wpPreview":false,"isScriptDebug":false},"i18n":{"shareOnFacebook":"Partilhar no Facebook","shareOnTwitter":"Partilhar no Twitter","pinIt":"Fix\\u00e1-lo","download":"Download","downloadImage":"Descarregar Imagem","fullscreen":"\\u00c9cr\\u00e3 Inteiro","zoom":"Zoom","share":"Partilhar","playVideo":"Reproduzir v\\u00eddeo","previous":"Anterior","next":"Seguinte","close":"Fechar","a11yCarouselWrapperAriaLabel":"Carousel | Horizontal scrolling: Arrow Left & Right","a11yCarouselPrevSlideMessage":"Previous slide","a11yCarouselNextSlideMessage":"Next slide","a11yCarouselFirstSlideMessage":"This is the first slide","a11yCarouselLastSlideMessage":"This is the last slide","a11yCarouselPaginationBulletMessage":"Go to slide"},"is_rtl":false,"breakpoints":{"xs":0,"sm":480,"md":768,"lg":1025,"xl":1440,"xxl":1600},"responsive":{"breakpoints":{"mobile":{"label":"Mobile ao alto","value":767,"default_value":767,"direction":"max","is_enabled":true},"mobile_extra":{"label":"Mobile ao baixo","value":880,"default_value":880,"direction":"max","is_enabled":false},"tablet":{"label":"Tablet Portrait","value":1024,"default_value":1024,"direction":"max","is_enabled":true},"tablet_extra":{"label":"Tablet Landscape","value":1200,"default_value":1200,"direction":"max","is_enabled":false},"laptop":{"label":"Port\\u00e1til","value":1366,"default_value":1366,"direction":"max","is_enabled":false},"widescreen":{"label":"Widescreen","value":2400,"default_value":2400,"direction":"min","is_enabled":false}}},"version":"3.24.2","is_static":false,"experimentalFeatures":{"e_font_icon_svg":true,"additional_custom_breakpoints":true,"container":true,"container_grid":true,"e_swiper_latest":true,"e_nested_atomic_repeaters":true,"e_optimized_control_loading":true,"e_onboarding":true,"theme_builder_v2":true,"hello-theme-header-footer":true,"home_screen":true,"ai-layout":true,"editor_v2":true,"e_element_cache":true,"link-in-bio":true,"floating-buttons":true,"display-conditions":true,"form-submissions":true},"urls":{"assets":"https:\\/\\/pollosdigital.com.br\\/wp-content\\/plugins\\/elementor\\/assets\\/","ajaxurl":"https:\\/\\/pollosdigital.com.br\\/wp-admin\\/admin-ajax.php"},"nonces":{"floatingButtonsClickTracking":"15a86bede1"},"swiperClass":"swiper","settings":{"page":[],"editorPreferences":[]},"kit":{"active_breakpoints":["viewport_mobile","viewport_tablet"],"global_image_lightbox":"yes","lightbox_enable_counter":"yes","lightbox_enable_fullscreen":"yes","lightbox_enable_zoom":"yes","lightbox_enable_share":"yes","lightbox_title_src":"title","lightbox_description_src":"description","hello_header_logo_type":"logo","hello_header_menu_layout":"horizontal","hello_footer_logo_type":"logo"},"post":{"id":3542,"title":"Leonardo%20%E2%80%93%20Pollos%20Digital","excerpt":"","featuredImage":false}};
</script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor/assets/js/frontend.min.js?ver=3.24.2" id="elementor-frontend-js"></script>
<script src="https://pollosdigital.com.br/wp-content/plugins/elementor-pro/assets/js/elements-handlers.min.js?ver=3.24.1" id="pro-elements-handlers-js"></script>
	</body>
</html>

<!--Generated by Endurance Page Cache-->''';

    // switch (selectedModelo) {
    //   case 1:
    //     await _curriculoApi.createPost(curriculoModel?.nome, modeloCurriculo1);
    //     break;
    //   case 2:
    //     await _curriculoApi.createPost(curriculoModel?.nome, modeloCurriculo2);
    //     break;
    //   case 3:
    //     await _curriculoApi.createPost(curriculoModel?.nome, modeloCurriculo3);
    //     break;
    //   default:
    // }

    var r = await _curriculoApi.createPage(curriculoModel, selectedModelo);
    createdPageUrl = r;
    buttonDisplayed = !buttonDisplayed;
  }
}
