import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/mixins/form_validations_mixin.dart';
import 'package:pollos_digital/app/modules/auth/recover_password/recover_password_store.dart';
import 'package:pollos_digital/app/shared/modal_bottom_sheet.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
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

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

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
              "Escreva seu email e cpf cadastrados e redefina sua senha",
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
          DividerWidget(height: 2.5.h),
          Observer(builder: (_) {
            return InputWidget(
              label: 'Cpf',
              keyboardType: TextInputType.number,
              inputFormatters: [cpfFormatter],
              onChanged: _store.setCpf,
              validator: notEmpty,
            );
          }),
          DividerWidget(height: 5.h),
          Observer(builder: (_) {
            return ButtonWidget.filled(
              title: 'ENTRAR',
              onPressed: () async {
                if (!formKey.currentState!.validate()) return;

                var r = await _store.recoverPassword();

                if (!mounted) return;

                showBaseModalBottomSheet(
                  context,
                  r,
                  onErrorPressed: () {
                    Modular.to.pop();
                  },
                  onClose: () {
                    Modular.to.pop();
                    Modular.to.pop();
                  },
                  onSuccessPressed: () {
                    Modular.to.pop();
                    Modular.to.pop();
                  },
                );
              },
              loading: _store.loadingStore.isLoading,
            );
          }),
        ],
      ),
    );
  }
}
