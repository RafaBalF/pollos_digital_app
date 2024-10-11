import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/mixins/form_validations_mixin.dart';
import 'package:pollos_digital/app/modules/auth/recover_password/recover_password_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RecoverPasswordPage extends StatefulWidget {
  final String title;
  const RecoverPasswordPage({super.key, this.title = 'REDEFINIR SENHA'});
  @override
  RecoverPasswordPageState createState() => RecoverPasswordPageState();
}

class RecoverPasswordPageState extends State<RecoverPasswordPage>
    with FormValidationsMixin {
  final RecoverPasswordStore _store = Modular.get<RecoverPasswordStore>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _clearFields();

    super.dispose();
  }

  void _clearFields() {
    _store.setEmail(null);
  }

  @override
  Widget build(BuildContext context) {
    return SimpleScaffoldWidget(
      title: widget.title,
      bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
      body: Column(
        children: [
          DividerWidget(height: 2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: textWidget(
              "Escreva seu email cadastrados e redefina sua senha",
              style: h2(),
              textAlign: TextAlign.center,
            ),
          ),
          DividerWidget(height: 2.5.h),
          _form(),
          DividerWidget(height: 5.h),
        ],
      ),
    );
  }

  Widget _form() {
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        children: [
          Observer(builder: (_) {
            return InputWidget(
              label: 'E-mail',
              onChanged: _store.setEmail,
              keyboardType: TextInputType.emailAddress,
              validator: (v) => combine([
                () => notEmpty(v),
                () => validEmail(v),
              ]),
            );
          }),
          DividerWidget(height: 5.h),
          Observer(builder: (_) {
            return ButtonWidget.filled(
              title: 'REDEFINIR',
              onPressed: () async {
                if (!formKey.currentState!.validate()) return;

                var r = await _store.recoverPassword();

                if (!mounted) return;

                if (r.sucesso) {
                  _showToast(context,
                      r.mensagem ?? 'Tente novamente mais tarde.', true);
                  Modular.to.pop();
                } else {
                  _showToast(context,
                      r.mensagem ?? 'Tente novamente mais tarde.', false);
                }
              },
              loading: _store.loadingStore.isLoading,
            );
          }),
        ],
      ),
    );
  }

  void _showToast(BuildContext context, message, sucess) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        backgroundColor: sucess ? Colors.green : primary,
        content: textWidget(message, color: Colors.white),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: scaffold.hideCurrentSnackBar,
          textColor: Colors.white,
        ),
      ),
    );
  }
}
