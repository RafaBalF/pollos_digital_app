import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/models/hives/login.hive.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/auth/login');

  final LoginHive _loginHive = LoginHive();

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    return _loginHive.isLogged();
  }
}
