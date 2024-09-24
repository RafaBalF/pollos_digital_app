import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/modules/profile/profile_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/shimmer_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DadosPessoaisPage extends StatefulWidget {
  const DadosPessoaisPage({super.key});
  @override
  DadosPessoaisPageState createState() => DadosPessoaisPageState();
}

class DadosPessoaisPageState extends State<DadosPessoaisPage> {
  final ProfileStore _store = Modular.get<ProfileStore>();
  late final Future<void> _future;

  @override
  void initState() {
    _future = Future.wait([_store.initDadosPessoais()]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SimpleScaffoldWidget(
            title: 'DADOS PESSOAIS',
            bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
            body: Observer(
              builder: (_) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return (_store.dadosPessoaisModel == null)
                      ? _emptyBody()
                      : _body();
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

  Widget _emptyBody() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 2.w,
        vertical: 1.h,
      ),
      child: Container(
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: grey),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 2.5.h,
        ),
        child: textWidget(
          "Não conseguimos buscar seu usuário, tente novamente mais tarde",
          style: h2(),
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
      child: Container(
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: grey),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 2.5.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _info('Nome:', _store.dadosPessoaisModel!.nome!),
            _info('Email:', _store.dadosPessoaisModel!.email!),
            _info('ID:', _store.dadosPessoaisModel!.id!),
            _info('Celular:', _store.dadosPessoaisModel!.celular!),
          ],
        ),
      ),
    );
  }

  Widget _info(String label, String info) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget(label, style: text(color: darkGrey)),
          textWidget(info, style: text()),
        ],
      ),
    );
  }
}
