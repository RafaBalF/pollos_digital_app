import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/modules/profile/profile_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/modal_bottom_sheet.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/shimmer_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});
  @override
  ConfiguracoesPageState createState() => ConfiguracoesPageState();
}

class ConfiguracoesPageState extends State<ConfiguracoesPage> {
  final ProfileStore _store = Modular.get<ProfileStore>();
  late final Future<void> _future;

  @override
  void initState() {
    _future = Future.wait([_store.initConfiguracoes()]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SimpleScaffoldWidget(
            title: 'CONFIGURAÇÕES',
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
    return SizedBox(
      height: 90.h,
      width: 100.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _tile('Sair', () => showLogoutModal()),
            ],
          ),
          _tile('Excluir conta', () => showDeleteAccountModal()),
        ],
      ),
    );
  }

  Widget _tile(String label, Function()? onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textWidget(label, style: headTitle()),
            GestureDetector(
              onTap: onTap,
              child: Icon(
                Icons.chevron_right,
                color: primary,
                size: 24.sp,
              ),
            ),
          ],
        ),
        DividerWidget(height: 1.h),
        const Divider()
      ],
    );
  }

  void showLogoutModal() {
    showCustomBottomSheet(
      context,
      'LOGOUT',
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            Icon(
              Icons.logout,
              size: 44.sp,
              color: grey,
            ),
            DividerWidget(height: 2.h),
            textWidget(
              'TEM CERTEZA QUE DESEJA DESLOGAR',
              style: headTitle(),
              textAlign: TextAlign.center,
            ),
            DividerWidget(height: 3.h),
            ButtonWidget.filled(
              onPressed: () async {
                await _store.logout();
                Modular.to.navigate('/auth/login');
              },
              backgroundColor: primary,
              title: 'SAIR',
              textColor: white,
            ),
            DividerWidget(height: 2.h),
            ButtonWidget.outlined(
              onPressed: () {
                Modular.to.pop();
              },
              borderColor: grey,
              title: 'CANCELAR',
              textColor: darkGrey,
            ),
            DividerWidget(height: 2.h),
          ],
        ),
      ),
    );
  }

  void showDeleteAccountModal() {
    showCustomBottomSheet(
      context,
      'LOGOUT',
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            Icon(
              Icons.delete_forever,
              size: 44.sp,
              color: grey,
            ),
            DividerWidget(height: 2.h),
            textWidget(
              'TEM CERTEZA QUE DESEJA DELETAR SUA CONTA?',
              style: headTitle(),
              textAlign: TextAlign.center,
            ),
            DividerWidget(height: 2.h),
            textWidget(
              'ESSA AÇÃO NÃO PODE SER DESFEITA',
              style: text(),
              textAlign: TextAlign.center,
            ),
            DividerWidget(height: 3.h),
            ButtonWidget.filled(
              onPressed: () async {
                final r = await _store.deleteAccount();

                if (!mounted) return;

                showBaseModalBottomSheet(
                  context,
                  r,
                  onErrorPressed: () {
                    Modular.to.pop();
                  },
                  onClose: () {
                    Modular.to.pop();
                    if (r.success) Modular.to.navigate('/auth/login');
                  },
                  onSuccessPressed: () {
                    Modular.to.pop();
                    Modular.to.navigate('/auth/login');
                  },
                );
              },
              backgroundColor: primary,
              title: 'DELETAR',
              textColor: white,
            ),
            DividerWidget(height: 2.h),
            ButtonWidget.outlined(
              onPressed: () {
                Modular.to.pop();
              },
              borderColor: grey,
              title: 'CANCELAR',
              textColor: darkGrey,
            ),
            DividerWidget(height: 2.h),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _store.resetConfiguracoes();

    super.dispose();
  }
}
