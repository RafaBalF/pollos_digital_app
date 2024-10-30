import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:pollos_digital/app/apis/base.api.dart';
import 'package:pollos_digital/app/constants/constants.dart';
import 'package:pollos_digital/app/models/base.model.dart';
import 'package:pollos_digital/app/models/projeto.model.dart';

class ProjetoApi extends BaseApi {
  get _baseUrl => API_URL;
  get _option => BaseOptions(baseUrl: _baseUrl, headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        "Authorization": TOKEN
      });

  Future getTokenOpenIaAPI() async {
    var result;
    try {
      var response = (await Dio(_option).post('/Token')).data;

      // var responseData = json.decode(response);
      result = response['chave'];
    } on DioException catch (e) {
      result = handleDioException(e);
    } catch (e) {
      // print(e);
    }
    return result;
  }

  Future trancriptAudio(File audioPath, String token) async {
    BaseModel? b;
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel.networkError();
      }

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

      var option = BaseOptions(baseUrl: API_CHAT_GPT, headers: header);

      var result = (await Dio(option).post(
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

  Future getAiResponse(String audioTranscripted, String token) async {
    var b = ProjetoModel();
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel.networkError();
      }

      var header = {'Authorization': token, 'Content-Type': 'application/json'};

      var data = json.encode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "user",
            "content":
                """Considerando o seguinte texto $audioTranscripted me retorne um json seguindo o seguinte modelo {
   "nomepessoa":"Nome Completo Pessoal",
   "urlamigavel":"nome-pessoal",
   "descricao":"Eu sou uma engenheira de software com mais de 10 anos de experiência no desenvolvimento de soluções tecnológicas para empresas de diversos setores, como tecnologia da informação, saúde e finanças. Ela é especializada em desenvolvimento backend com Java e Python, além de ser uma entusiasta de arquitetura de microsserviços e computação em nuvem. Mariana também tem experiência em gerenciamento de equipes ágeis e já atuou como Tech Lead em grandes projetos de transformação digital.",
   "telefone":"(00) 00000-0000",
   "email":"exemplo@gmail.com",
   "missao":"Minha missão é desenvolver soluções tecnológicas que impactem positivamente a sociedade, promovendo inovação, eficiência e acessibilidade em todos os projetos que lidero ou participo",
   "visao":"Ser uma referência no desenvolvimento de software de alta qualidade, sempre buscando o aprimoramento contínuo e a adoção de novas tecnologias que possam transformar o mercado e a vida das pessoas",
   "valores":"Excelência: Compromisso com a entrega de soluções de alta qualidade. Inclusão: Acredita que a tecnologia deve ser acessível e inclusiva para todos. Inovação: Busca constante por novas ideias e abordagens tecnológicas. Ética: Transparência, honestidade e responsabilidade em todas as relações profissionais.",
   "habilidades":[
      "exemplo de habilidade",
      "exemplo de habilidade",
      "exemplo de habilidade"
   ],
   "extras":[
      {
         "descricao":"projetos",
         "valor":12
      },
      {
         "descricao":"projetos",
         "valor":12
      }
   ],
   "experiencias": [
     {
      "empresa": "Nome da empresa",
      "cargo": "Cargo exercido",
      "descricao": "Descricao das atividades desempenhadas",
      "data_inicio": "2022-01-01",
      "data_fim": "2023-01-01",
      "localizacao": null,
      "em_andamento": false
    },
    {
      "empresa": "Nome da empresa",
      "cargo": "Cargo exercido",
      "descricao": "Descricao das atividades desempenhadas",
      "data_inicio": "2006-01-01",
      "data_fim": "2008-01-01",
      "localizacao": null,
      "em_andamento": false
    }
  ]
}, o que nao for informado elabore mas baseie-se no texto, exceto por informações pessoais.""",
          }
        ]
      });

      var option = BaseOptions(baseUrl: API_CHAT_GPT, headers: header);

      var result = (await Dio(option).post(
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
      var header = {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
        "Authorization": TOKEN
      };
      _option.headers = header;

      var data = FormData.fromMap({
        'imagem': [
          await MultipartFile.fromFile(image.path, filename: image.name)
        ],
      });

      var response = (await Dio(_option).post(
        '/Imagem/upload',
        data: data,
      ));

      if (response.statusCode == 200) {
        return response.data['imagem_url'];
      } else {
        print(response.statusMessage);
      }
    } catch (e) {}
  }

  Future criarProjeto(data) async {
    var b = ProjetoModel();
    String? result;
    ProjetoModel projetoModelData = data;
    try {
      var data = json.encode(projetoModelData.toJson());

      var response = (await Dio(_option).post(
        '/Projetos/create',
        data: data,
      ))
          .data;

      result = response['mensagem'];
    } on DioException catch (e) {
      // result = "Algo deu errado, tente novamente mais tarde.";
      b.message = handleDioException(e);
    } catch (e) {
      // return BaseModel();
    }
    return result;
  }

  Future editarProjeto(data) async {
    var b = ProjetoModel();
    String? result;
    ProjetoModel projetoModelData = data;
    try {
      var dataJson = json.encode(projetoModelData.toJson());

      var response = (await Dio(_option).put(
        '/Projetos/update/${data.id}',
        data: dataJson,
      ))
          .data;

      result = response['mensagem'];
    } on DioException catch (e) {
      // result = "Algo deu errado, tente novamente mais tarde.";
      b.message = handleDioException(e);
    } catch (e) {
      print(e);
      // return BaseModel();
    }
    return result;
  }

  Future carregarModelos() async {
    var b = ProjetoModel();
    var result;
    try {
      var response = (await Dio(_option).post('/Modelos/curriculo')).data;

      result = response;
    } on DioException catch (e) {
      result = "Algo deu errado, tente novamente mais tarde.";
      b.message = handleDioException(e);
    } catch (e) {
      result = e;
    }
    return result;
  }

  Future carregarProjetos(userId) async {
    var b = ProjetoModel();
    var result;
    try {
      var response =
          (await Dio(_option).post('/Projetos/listProjetos/$userId')).data;
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
    var b = ProjetoModel();
    var result;
    try {
      var response =
          (await Dio(_option).post('/Projetos/deleteProjeto/$projetoId')).data;
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
    var b = ProjetoModel();
    var result;
    if (value != null && value != '') {
      value = '/$value';
    } else {
      value = '';
    }
    try {
      var option = BaseOptions(baseUrl: 'https://site.pollosdigital.com.br');
      var response =
          (await Dio(option).post('/Projetos/verificarurlamigavel$value')).data;
      result = response['mensagem'];
    } on DioException catch (e) {
      result = e.response?.data['messages']['error'];
      b.message = handleDioException(e);
    } catch (e) {
      print(e);
    }
    return result;
  }
}
