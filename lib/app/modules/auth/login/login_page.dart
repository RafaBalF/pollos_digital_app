import 'package:pollos_digital/app/constants/telefone_contato.dart';
import 'package:pollos_digital/app/mixins/form_validations_mixin.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/modules/auth/login/login_store.dart';
import 'package:pollos_digital/app/shared/modal_bottom_sheet.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_widget.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/password_input_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with FormValidationsMixin {
  final LoginStore _store = Modular.get<LoginStore>();

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  void initState() {
    _store.getAuthModel();
    super.initState();
  }

  @override
  void dispose() {
    _clearFields();
    super.dispose();
  }

  void _clearFields() {
    _store.setCpf(null);
    _store.setSenha(null);
  }

  @override
  Widget build(BuildContext context) {
    if (_store.authModel != null) {
      Modular.to.navigate('/home/');
    }
    return SimpleScaffoldWidget(
        bodyColor: black,
        showReturnArrow: false,
        bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DividerWidget(height: 15.h),
            Image.asset(
              'assets/icons/logo-pollos-digital-agencia-cria-seu-site-branco.png',
              height: 10.h,
            ),
            DividerWidget(height: 10.h),
            _form(),
          ],
        ));
  }

  Widget _form() {
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        children: [
          Observer(builder: (_) {
            return InputWidget(
              label: 'Cpf',
              labelColor: white,
              keyboardType: TextInputType.number,
              inputFormatters: [cpfFormatter],
              onChanged: _store.setCpf,
              validator: notEmpty,
            );
          }),
          DividerWidget(height: 2.h),
          PasswordInputWidget(
            labelColor: white,
            onChanged: _store.setSenha,
            validator: notEmpty,
          ),
          DividerWidget(height: 1.h),
          Container(
            width: 100.w,
            alignment: Alignment.centerRight,
            child: GestureDetector(
              child: Text(
                'Esqueci minha senha',
                style: label(
                  textDecoration: TextDecoration.underline,
                  color: white,
                ),
              ),
              onTap: () {
                Modular.to.pushNamed('/auth/recover-password');
              },
            ),
          ),
          DividerWidget(height: 5.h),
          Observer(builder: (_) {
            return ButtonWidget.filled(
              title: 'ENTRAR',
              onPressed: () async {
                if (!formKey.currentState!.validate()) return;

                var r = await _store.login();

                if (r.success) {
                  Modular.to.navigate('/home/');
                } else {
                  if (mounted) {
                    showErrorBottomSheet(context, message: r.message);
                  }
                }
              },
              backgroundColor: red,
              textColor: white,
              loading: _store.loadingStore.isLoading,
            );
          }),
          DividerWidget(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Ainda não é cliente? ',
                style: text(color: white),
              ),
              GestureDetector(
                onTap: () async {
                  const text =
                      "Olá, vim do App Laserfast e gostaria de me tornar cliente";
                  const whatsappUrl =
                      "https://wa.me/$telefoneContato?text=$text";

                  await launchUrlString(whatsappUrl);
                },
                child: Container(
                  decoration: const BoxDecoration(
                      border: BorderDirectional(
                    bottom: BorderSide(color: white),
                  )),
                  child: Text(
                    'Se tornar cliente',
                    style: label(color: white),
                  ),
                ),
              )
            ],
          ),
          DividerWidget(height: 12.h),
        ],
      ),
    );
  }
}
