class StatesAndCitiesModel {
  List<StateAndCities>? stateAndCities;

  StatesAndCitiesModel({this.stateAndCities});

  StatesAndCitiesModel.fromJson(Map<String, dynamic> json) {
    if (json['state_and_cities'] != null) {
      stateAndCities = <StateAndCities>[];
      json['state_and_cities'].forEach((v) {
        stateAndCities!.add(StateAndCities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (stateAndCities != null) {
      data['state_and_cities'] =
          stateAndCities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StateAndCities {
  String? sigla;
  String? nome;
  List<String>? cidades;

  StateAndCities({this.sigla, this.nome, this.cidades});

  StateAndCities.fromJson(Map<String, dynamic> json) {
    sigla = json['sigla'];
    nome = json['nome'];
    cidades = json['cidades'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sigla'] = sigla;
    data['nome'] = nome;
    data['cidades'] = cidades;
    return data;
  }
}
