import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:pollos_digital/app/mixins/form_validations_mixin.dart';
import 'package:pollos_digital/app/models/auth.model.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/password_input_widget.dart';
import 'package:pollos_digital/app/models/base.model.dart';
import 'package:pollos_digital/app/modules/auth/register/register_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/modal_bottom_sheet.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
  });
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> with FormValidationsMixin {
  final RegisterStore _store = Modular.get<RegisterStore>();
  Timer? _verificationCodeTimeout;
  final int timeout = 600;

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
    if (_verificationCodeTimeout != null) {
      _verificationCodeTimeout!.cancel();
    }
    super.dispose();
  }

  void _clearFields() {
    _store.setNome(null);
    _store.setEmail(null);
    _store.setPassword(null);
    _store.setConfirmPassword(null);
  }

  @override
  Widget build(BuildContext context) {
    return SimpleScaffoldWidget(
      title: 'NOVA CONTA',
      bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
      body: Column(
        children: [
          DividerWidget(height: 2.h),
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
          DividerWidget(height: 2.h),
          Observer(builder: (_) {
            return InputWidget(
              label: 'Nome',
              keyboardType: TextInputType.name,
              onChanged: _store.setNome,
              validator: notEmpty,
            );
          }),
          DividerWidget(height: 2.h),
          Observer(builder: (_) {
            return InputWidget(
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
              onChanged: _store.setEmail,
              validator: notEmpty,
            );
          }),
          DividerWidget(height: 2.h),
          PasswordInputWidget(
            onChanged: _store.setPassword,
            validator: (v) => combine([
              () => notEmpty(v),
              () => atLeastNChars(6, v),
            ]),
          ),
          DividerWidget(height: 2.h),
          PasswordInputWidget(
            label: 'Confirmar senha',
            onChanged: _store.setConfirmPassword,
            validator: (v) => combine([
              () => notEmpty(v),
              () => atLeastNChars(6, v),
              () => matchValue(v, _store.password, "Senhas não são iguais"),
            ]),
          ),
          DividerWidget(height: 5.h),
          SizedBox(
            width: 65.w,
            child: Observer(builder: (_) {
              return ButtonWidget.filled(
                title: 'Cadastre-se',
                onPressed: () async {
                  if (!formKey.currentState!.validate()) return;

                  _store.setCode(null);

                  var r = await _store.register();

                  if (!mounted) return;

                  if (r.email != null) {
                    Modular.to.navigate('/home/');
                  } else {
                    showErrorBottomSheet(context,
                        message: "Usuário já cadastrado");
                  }

                  // if (b.success) {
                  //   _startTimer();
                  //   showCustomBottomSheet(
                  //     context,
                  //     'CÓDIGO DE VERIFICAÇÃO',
                  //     _confirmPhoneSheet(),
                  //   );
                  // } else {
                  //   showErrorBottomSheet(context, message: b.message);
                  // }
                },
                loading: _store.loadingStore.isLoading,
                backgroundColor: primary,
                textColor: white,
              );
            }),
          ),
        ],
      ),
    );
  }

  void _startTimer() {
    _verificationCodeTimeout =
        Timer.periodic(const Duration(seconds: 1), (timer) {
      _store.counter--;
      _store.setCounter(_store.counter);
      if (_store.counter == 0 && _verificationCodeTimeout != null) {
        _verificationCodeTimeout!.cancel();
      }
    });
  }

  Widget _confirmPhoneSheet() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DividerWidget(height: 5.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: textWidget(
            'Insira o código de verificação enviado para seu celular',
            textAlign: TextAlign.center,
            style: h2(),
          ),
        ),
        DividerWidget(height: 5.h),
        VerificationCode(
          textStyle: const TextStyle(fontSize: 20.0, color: black),
          keyboardType: TextInputType.number,
          underlineColor: primary,
          length: 6,
          cursorColor: primary,
          onCompleted: _store.setCode,
          onEditing: (bool value) {},
          fullBorder: true,
        ),
        DividerWidget(height: 3.h),
        Observer(builder: (_) {
          if (_store.counter == 0) {
            return GestureDetector(
              onTap: () async {
                await _store.resendSMS();
                _startTimer();
              },
              child: textWidget(
                'Reenviar Código',
                textAlign: TextAlign.center,
                style: text(textDecoration: TextDecoration.underline),
              ),
            );
          }
          return textWidget(
            'Reenviar em: ${_store.counter} segundos',
            textAlign: TextAlign.center,
            style: text(textDecoration: TextDecoration.underline),
          );
        }),
        DividerWidget(height: 3.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Observer(builder: (_) {
            return ButtonWidget.filled(
              title: 'CONFIRMAR',
              onPressed: () async {
                var r = await _store.validateCode();

                if (mounted) {
                  if (r.success) {
                    Timer(const Duration(seconds: 2), () {
                      Modular.to.navigate('/home/');
                    });
                  }
                  showBaseModalBottomSheet(
                    context,
                    r,
                    onSuccessPressed: () {
                      Modular.to.navigate('/home/');
                    },
                  );
                }
              },
              disabled: !_store.validCode,
              backgroundColor: primary,
              textColor: primaryDark,
            );
          }),
        )
      ],
    );
  }
}
