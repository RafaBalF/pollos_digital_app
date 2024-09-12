import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/mixins/form_validations_mixin.dart';
import 'package:pollos_digital/app/modules/profile/profile_store.dart';
import 'package:pollos_digital/app/shared/modal_bottom_sheet.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/password_input_widget.dart';
import 'package:pollos_digital/app/shared/widgets/shimmer_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RedefinirSenhaPage extends StatefulWidget {
  const RedefinirSenhaPage({super.key});
  @override
  RedefinirSenhaPageState createState() => RedefinirSenhaPageState();
}

class RedefinirSenhaPageState extends State<RedefinirSenhaPage>
    with FormValidationsMixin {
  final ProfileStore _store = Modular.get<ProfileStore>();
  late final Future<void> _future;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String senha = '';
  String confirmarSenha = '';

  @override
  void initState() {
    _future = Future.wait([_store.initRedefinirSenha()]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SimpleScaffoldWidget(
            title: 'REDEFINIR SENHA',
            bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
            body: Observer(
              builder: (_) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return _body();
                } else {
                  return _loadingBody();
                }
              },
            ));
      },
    );
  }

  Widget _loadingBody() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          6,
          (index) => Column(
            children: [
              ShimmerWidget(width: 90.w, height: 6.h),
              DividerWidget(height: 1.h),
              ShimmerWidget(width: 90.w, height: 2.h),
              DividerWidget(height: 1.h),
              ShimmerWidget(width: 90.w, height: 2.h),
              DividerWidget(height: 3.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 2.w,
        vertical: 1.h,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Observer(builder: (_) {
              final naoTemSenhaAtual = _store.senhaAtual == null;

              return (naoTemSenhaAtual)
                  ? PasswordInputWidget(
                      label: 'Senha Atual',
                      onChanged: _store.setSenhaAtual,
                      validator: notEmpty,
                    )
                  : const SizedBox();
            }),
            PasswordInputWidget(
              label: 'Senha',
              onChanged: (s) => senha = s,
              validator: (v) => combine([
                () => notEmpty(v),
                () => atLeastNChars(6, v),
              ]),
            ),
            DividerWidget(height: 2.h),
            PasswordInputWidget(
              label: 'Confirmar senha',
              onChanged: (s) => confirmarSenha = s,
              validator: (v) => combine([
                () => notEmpty(v),
                () => atLeastNChars(6, v),
                () => matchValue(v, senha, "Senhas não são iguais"),
              ]),
            ),
            DividerWidget(height: 5.h),
            ButtonWidget.filled(
              onPressed: () async {
                if (!_formKey.currentState!.validate()) return;

                final r = await _store.redefinirSenha(
                  _store.senhaAtual!,
                  senha,
                );

                if (!mounted) return;

                showBaseModalBottomSheet(
                  context,
                  r,
                  dismissable: false,
                  onClose: () {
                    Modular.to.pop();
                  },
                  onErrorPressed: () {
                    Modular.to.pop();
                  },
                  onSuccessPressed: () {
                    Modular.to.pop();
                    Modular.to.pop();
                  },
                );
              },
              title: 'SALVAR',
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _store.resetRedefinirSenha();

    super.dispose();
  }
}
