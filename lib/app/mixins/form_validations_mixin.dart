mixin FormValidationsMixin {
  String? combine(List<String? Function()> validators) {
    for (var v in validators) {
      final String? validation = v();

      if (validation != null) return validation;
    }

    return null;
  }

  String? notEmpty(String? value, [String? message]) {
    if (value!.isEmpty) return message ?? "Este campo é obrigatório";

    return null;
  }

  String? notEmptyWhen(String? value, bool condition, [String? message]) {
    if (condition && value!.isEmpty) {
      return message ?? "Este campo é obrigatório";
    }

    return null;
  }

  String? nChars(int charNumber, String? value, [String? message]) {
    if (value!.length != charNumber) {
      return message ?? "Este campo deve ter $charNumber caracteres";
    }

    return null;
  }

  String? atLeastNChars(int charNumber, String? value, [String? message]) {
    if (value!.length < charNumber) {
      return message ?? "Este campo deve ter pelo menos $charNumber caracteres";
    }

    return null;
  }

  String? atMostNChars(int charNumber, String? value, [String? message]) {
    if (value!.length > charNumber) {
      return message ?? "Este campo deve ter no máximo $charNumber caracteres";
    }

    return null;
  }

  String? validEmail(String? value, [String? message]) {
    bool matches = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value ?? "");

    if (!matches) return message ?? "Este campo deve ser um email válido";

    return null;
  }

  String? matchValue(String? value, String? match, [String? message]) {
    if (value != match) return message ?? "Campo inválido";

    return null;
  }
}
