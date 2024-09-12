import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/modules/auth/auth_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({super.key, this.title = 'AuthPage'});
  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  final AuthStore _store = Modular.get<AuthStore>();
  late final Future _myFuture;

  @override
  void initState() {
    super.initState();
    _myFuture = Future.wait([_store.attemptAutoLogin()]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _myFuture,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return Observer(builder: (_) {
            return _body();
          });
        } else {
          return _loadingBody();
        }
      },
    );
  }

  Widget _body() {
    if (!_store.attemptedAutoLogin) return _loadingBody();

    (_store.autoLogged)
        ? Modular.to.navigate('/home/')
        : Modular.to.navigate('/auth/login');

    return _loadingBody();
  }

  Widget _loadingBody() {
    return Stack(
      children: [
        // Image.asset(
        //   height: 100.h,
        //   width: 100.w,
        //   'assets/images/splash_screen.png',
        //   fit: BoxFit.fitWidth,
        // ),
        Container(
          height: 100.h,
          width: 100.w,
          color: primary,
          child: Image.asset(
            'assets/icons/logo-pollos-digital-agencia-cria-seu-site-branco.png',
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          left: 47.5.w,
          bottom: 10.h,
          child: const CircularProgressIndicator(color: white),
        ),
      ],
    );
  }
}
