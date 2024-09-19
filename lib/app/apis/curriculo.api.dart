import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:pollos_digital/app/apis/base.api.dart';
import 'package:pollos_digital/app/constants/constants.dart';
import 'package:pollos_digital/app/models/base.model.dart';
import 'package:pollos_digital/app/models/curriculo.model.dart';

class CurriculoApi extends BaseApi {
  get _baseUrl => API_CHAT_GPT;
  get _option => BaseOptions(baseUrl: _baseUrl);

  Future trancriptAudio(File audioPath) async {
    BaseModel? b;
    var result;
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel.networkError();
      }

      var header = {
        'Authorization': TOKEN,
        'Content-Type': 'multipart/form-data'
      };

      var data = FormData.fromMap({
        'file': [
          await MultipartFile.fromFile(audioPath.path,
              filename: 'recording.wav')
        ],
        'model': 'whisper-1'
      });

      result = (await Dio(_option).post(
        '/audio/transcriptions',
        options: Options(headers: header),
        data: data,
      ))
          .data;
    } on DioException catch (e) {
      b?.message = handleDioException(e);
    } catch (e) {
      b = BaseModel();
    }
    return result['text'];
  }

  Future getAiResponse(String audioTranscripted) async {
    var b = CurriculoModel();
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return BaseModel.networkError();
      }

      var header = {'Authorization': TOKEN, 'Content-Type': 'application/json'};

      var data = json.encode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "user",
            "content":
                "Considerando o seguinte texto $audioTranscripted me monte um json contendo, nome, email, telefone no formato brasileiro (00) 00000-0000, resumo profissional é apenas uma string coloque o nome da chave apenas como resumo, habilidades, habilidades sera uma lista, um array, o que não for definido coloque null."
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
        b = CurriculoModel.fromJson(jsonData);
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

  Future createPost(title, content) async {
    var b = CurriculoModel();
    try {
      var auth = 'Basic ${base64Encode(utf8.encode('$USER_WP:$PASSWORD_WP'))}';

      var headers = {'Content-Type': 'application/json', 'Authorization': auth};

      var data = json.encode({
        "title": title,
        "status": "publish",
        "categories": [38],
        "content": content
      });

      var dio = Dio();
      var response = await dio.request(
        'https://pollosdigital.com.br/wp-json/wp/v2/posts',
        options: Options(
          headers: headers,
          method: 'POST',
        ),
        data: data,
      );
    } on DioException catch (e) {
      b.message = handleDioException(e);
    } catch (e) {
      return BaseModel();
    }
  }
}
