import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/constants/transition_type.dart';
import 'package:pollos_digital/app/modules/auth/auth_page.dart';
import 'package:pollos_digital/app/modules/auth/auth_store.dart';
import 'package:pollos_digital/app/modules/auth/login/login_page.dart';
import 'package:pollos_digital/app/modules/auth/login/login_store.dart';
import 'package:pollos_digital/app/modules/auth/recover_password/recover_password_page.dart';
import 'package:pollos_digital/app/modules/auth/recover_password/recover_password_store.dart';
import 'package:pollos_digital/app/modules/auth/register/register_page.dart';
import 'package:pollos_digital/app/modules/auth/register/register_store.dart';

class AuthModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(AuthStore.new);
    i.addLazySingleton(LoginStore.new);
    i.addLazySingleton(RegisterStore.new);
    i.addLazySingleton(RecoverPasswordStore.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const AuthPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/login',
      child: (context) => const LoginPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/register',
      child: (context) => const RegisterPage(),
      transition: defaultTransitonType,
    );
    r.child(
      '/recover-password',
      child: (context) => const RecoverPasswordPage(),
      transition: defaultTransitonType,
    );
  }
}
