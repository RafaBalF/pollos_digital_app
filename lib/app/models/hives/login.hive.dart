import 'package:hive/hive.dart';

import '../auth.model.dart';

class LoginHive {
  Future<bool> boxExists() async {
    return await Hive.boxExists('login');
  }

  Future setLogin(AuthModel authModel) async {
    return await Hive.box('login').put('login', authModel);
  }

  bool isLogged() {
    return Hive.box('login').containsKey('login');
  }

  String getToken() {
    return Hive.box('login').get('login')!.token ?? "";
  }

  String cpf() {
    return Hive.box('login').get('login')!.cpf ?? "";
  }

  Future logout() {
    return Hive.box('login').delete('login');
  }

  AuthModel getLogin() {
    AuthModel login = Hive.box('login').get('login', defaultValue: AuthModel());
    return login;
  }
}
