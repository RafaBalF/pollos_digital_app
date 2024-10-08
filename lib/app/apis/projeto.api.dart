import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:pollos_digital/app/apis/base.api.dart';
import 'package:pollos_digital/app/constants/constants.dart';
import 'package:pollos_digital/app/models/base.model.dart';
import 'package:pollos_digital/app/models/projeto.model.dart';
import 'package:pollos_digital/app/models/projetos_criados.model.dart';

class ProjetoApi extends BaseApi {
  get _baseUrl => API_CHAT_GPT;
  get _option => BaseOptions(baseUrl: _baseUrl);

  Future getTokenOpenIaAPI() async {
    var result;
    try {
      var option = BaseOptions(baseUrl: 'https://vitrine.pollosdigital.com.br');
      var response =
          (await Dio(option).get('/API/retornatoken.php?a=ADH234dQ3423594'))
              .data;

      var responseData = json.decode(response);
      result = responseData['chave'];
    } on DioException catch (e) {
      result = handleDioException(e);
    } catch (e) {
      // print(e);
    }
    return result;
  }

  Future trancriptAudio(File audioPath) async {
    BaseModel? b;
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel.networkError();
      }

      var token = await getTokenOpenIaAPI();
      var header = {
        'Authorization': token,
        'Content-Type': 'multipart/form-data'
      };

      var data = FormData.fromMap({
        'file': [
          await MultipartFile.fromFile(audioPath.path,
              filename: Platform.isIOS ? 'recording.m4a' : 'recording.wav')
        ],
        'model': 'whisper-1'
      });

      var result = (await Dio(_option).post(
        '/audio/transcriptions',
        options: Options(headers: header),
        data: data,
      ))
          .data;

      return result['text'];
    } on DioException catch (e) {
      b?.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }
  }

  Future getAiResponse(String audioTranscripted) async {
    var b = ProjetoModel();
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel.networkError();
      }

      var token = await getTokenOpenIaAPI();
      var header = {'Authorization': token, 'Content-Type': 'application/json'};

      var data = json.encode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "user",
            "content":
                """Considerando o seguinte texto $audioTranscripted me retorne um json seguindo o seguinte modelo {
   "nomepessoa":"Nome da pessoa",
   "nomearquivo":" ",
   "descricao":"Mariana é uma engenheira de software com mais de 10 anos de experiência no desenvolvimento de soluções tecnológicas para empresas de diversos setores, como tecnologia da informação, saúde e finanças. Ela é especializada em desenvolvimento backend com Java e Python, além de ser uma entusiasta de arquitetura de microsserviços e computação em nuvem. Mariana também tem experiência em gerenciamento de equipes ágeis e já atuou como Tech Lead em grandes projetos de transformação digital.",
   "telefone":"(00) 00000-0000",
   "email":"mariana@gmail.com",
   "missao":"Minha missão é desenvolver soluções tecnológicas que impactem positivamente a sociedade, promovendo inovação, eficiência e acessibilidade em todos os projetos que lidero ou participo",
   "visao":"Ser uma referência no desenvolvimento de software de alta qualidade, sempre buscando o aprimoramento contínuo e a adoção de novas tecnologias que possam transformar o mercado e a vida das pessoas",
   "valores":"Excelência: Compromisso com a entrega de soluções de alta qualidade. Inclusão: Acredita que a tecnologia deve ser acessível e inclusiva para todos. Inovação: Busca constante por novas ideias e abordagens tecnológicas. Ética: Transparência, honestidade e responsabilidade em todas as relações profissionais.",
   "habilidades":[
      "Css",
      "html",
      "javascript",
      "C#"
   ],
   "extras":[
      {
         "descricao":"projeto",
         "valor":12
      },
      {
         "descricao":"projeto",
         "valor":12
      }
   ]

}, não leve em conta as informações no json de exemploe, informações pessoais como nome, telefone e email esses dados caso nao sejam detectados colocar o valor deles como null, o nome do arquivo deve ser o nome da pessoa em kebab case, pode elaborar por conta própria os dados que não forem informado, mas nao leve em consideração as informações no json de exemplo fornecido.""",
          }
        ]
      });

      var result = (await Dio(_option).post(
        '/chat/completions',
        options: Options(headers: header),
        data: data,
      ))
          .data;

      var jsonData = json.decode(result['choices'][0]['message']['content']);
      try {
        b = ProjetoModel.fromJson(jsonData);
      } catch (e) {
        b.message = getMessage(result);
      }
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      return BaseModel();
    }
    return b;
  }

  Future uploadImage(image) async {
    try {
      String basicAuth =
          'Basic ${base64.encode(utf8.encode('$USER_WP:$PASSWORD_WP'))}';
      var headers = {'Authorization': basicAuth};
      var data = FormData.fromMap({
        'file': [
          await MultipartFile.fromFile(image.path, filename: image.name)
        ],
      });

      var dio = Dio();
      var response = await dio.request(
        'https://pollosdigital.com.br/wp-json/wp/v2/media',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 201) {
        return response.data['link'];
      } else {
        print(response.statusMessage);
      }
    } catch (e) {}
  }

  Future createPage(data) async {
    var b = ProjetoModel();
    String? result;
    ProjetoModel projetoModelData = data;
    try {
      var data = json.encode(projetoModelData.toJson());

      var option = BaseOptions(baseUrl: 'https://vitrine.pollosdigital.com.br');
      var response = (await Dio(option).post(
        '/API/criarpagina.php',
        data: data,
      ))
          .data;

      var responseData = json.decode(response);
      result = responseData['url'];
    } on DioException catch (e) {
      result = "Algo deu errado, tente novamente mais tarde.";
      b.message = handleDioException(e);
    } catch (e) {
      // return BaseModel();
    }
    return 'https://vitrine.pollosdigital.com.br/$result';
  }

  Future createProject(userId, nomeProjeto, urlProjeto) async {
    var dio = Dio();
    var response = await dio.request(
      'https://vitrine.pollosdigital.com.br/API/criaprojeto.php?usuario_id=$userId&nome_projeto=$nomeProjeto&url=$urlProjeto',
      options: Options(
        method: 'GET',
      ),
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  }

  Future carregarModelos() async {
    var b = ProjetoModel();
    var result;
    try {
      var response = (await Dio(_option).post('/Modelos')).data;

      var responseData = json.decode(response);
      result = responseData;
    } on DioException catch (e) {
      result = "Algo deu errado, tente novamente mais tarde.";
      b.message = handleDioException(e);
    } catch (e) {
      // print(e);
    }
    return result;
  }

  Future carregarProjetos(userId) async {
    var b = ProjetosCriadosModel();
    var result;
    try {
      var option = BaseOptions(baseUrl: 'https://vitrine.pollosdigital.com.br');
      var response =
          (await Dio(option).get('/API/listarprojetos.php?usuario_id=$userId'))
              .data;
      result = response;
    } on DioException catch (e) {
      result = "Algo deu errado, tente novamente mais tarde.";
      b.message = handleDioException(e);
    } catch (e) {
      print(e);
    }
    return result;
  }

  Future excluirProjeto(projetoId) async {
    var b = ProjetosCriadosModel();
    var result;
    try {
      var option = BaseOptions(baseUrl: 'https://vitrine.pollosdigital.com.br');
      var response = (await Dio(option)
              .get('/API/deletarprojeto.php?projeto_id=$projetoId'))
          .data;
      result = response;
    } on DioException catch (e) {
      result = "Algo deu errado, tente novamente mais tarde.";
      b.message = handleDioException(e);
    } catch (e) {
      print(e);
    }
    return result;
  }

  Future<String?> validarUrlAmigavel(value) async {
    var b = ProjetosCriadosModel();
    var result;
    try {
      var option = BaseOptions(baseUrl: 'http://apipollosdigital.example.com');
      var response =
          (await Dio(option).post('/Projetos/verificarurlamigavel/$value'))
              .data;
      result = response['mensagem'];
    } on DioException catch (e) {
      result = "Algo deu errado, tente novamente mais tarde.";
      b.message = handleDioException(e);
    } catch (e) {
      print(e);
    }
    return result;
  }
}
