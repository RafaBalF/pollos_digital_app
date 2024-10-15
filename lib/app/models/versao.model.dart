import 'dart:convert';
import 'package:http/http.dart' as http;

class Versao {
  final String versaoAndroid;
  final String versaoIos;

  Versao({required this.versaoAndroid, required this.versaoIos});

  factory Versao.fromJson(Map<String, dynamic> json) {
    return Versao(
      versaoAndroid: json['versao_android'] ?? '',
      versaoIos: json['versao_ios'] ?? '',
    );
  }
}

Future<Versao> fetchVersaoAtual() async {
  var headers = {
    'Authorization': 'Bearer SFBAd4sdf4HDF123454561236234S934',
  };
  var request = http.Request(
    'POST',
    Uri.parse('https://site.pollosdigital.com.br/ControleVersao/getVersaoAtual'),
  );

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final responseBody = await response.stream.bytesToString();
    return Versao.fromJson(jsonDecode(responseBody));
  } else {
    throw Exception('Falha ao carregar a versão: ${response.reasonPhrase}');
  }
}