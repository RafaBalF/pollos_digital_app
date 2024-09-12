import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pollos_digital/app/modules/sessao/sessao_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/modal_bottom_sheet.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/shimmer_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AvaliarPage extends StatefulWidget {
  const AvaliarPage({super.key});
  @override
  AvaliarPageState createState() => AvaliarPageState();
}

class AvaliarPageState extends State<AvaliarPage> {
  final SessaoStore _store = Modular.get<SessaoStore>();
  late final Future<void> _future;

  @override
  void initState() {
    _future = Future.wait([_store.initAvaliar()]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SimpleScaffoldWidget(
            title: 'AVALIAR',
            bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
            body: Observer(
              builder: (_) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Observer(builder: (_) {
                    return (_store.sessaoSendoAvaliada != null)
                        ? _body()
                        : _bodySemSessao();
                  });
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

  Widget _bodySemSessao() {
    return Column(
      children: [
        DividerWidget(height: 5.h),
        Image.asset('assets/icons/ic_launcher.png', height: 15.h, width: 30.w),
        DividerWidget(height: 5.h),
        textWidget(
          'Ocorreu um erro, tente novamente mais tarde.',
          style: large(),
          textAlign: TextAlign.center,
        ),
        DividerWidget(height: 5.h),
        ButtonWidget.filled(
          onPressed: () => Modular.to.pop(),
          backgroundColor: primary,
          title: 'VOLTAR',
          textColor: white,
        ),
      ],
    );
  }

  Widget _body() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              DividerWidget(height: 2.h),
              _avaliacaoSessao(),
              DividerWidget(height: 5.h),
              _avaliacaoEstabelecimento(),
            ],
          ),
        ),
        DividerWidget(height: 5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtonWidget.outlined(
              onPressed: () => Modular.to.pop(),
              borderColor: grey,
              title: 'REAGENDAR',
              textColor: darkerGrey,
              width: 40.w,
            ),
            ButtonWidget.filled(
              onPressed: () async {
                bool r = await _store.avaliar();

                if (!mounted) return;

                if (!r) {
                  return showErrorBottomSheet(
                    context,
                    message: "Erro ao tentar avaliar",
                  );
                }

                return showSuccessBottomSheet(context,
                    message: "Avaliado com sucesso", onClose: () {
                  Modular.to.pop();
                  Modular.to.pop();
                }, onPressed: () {
                  Modular.to.pop();
                  Modular.to.pop();
                });
              },
              backgroundColor: primary,
              title: 'CONFIRMAR',
              textColor: white,
              width: 40.w,
            ),
          ],
        ),
      ],
    );
  }

  Widget _avaliacaoSessao() {
    if (_store.aplicador == null) return const SizedBox();

    return Column(
      children: [
        (_store.aplicador!.foto == null)
            ? CircleAvatar(
                maxRadius: 30.sp,
                backgroundColor: primary,
                child: Icon(
                  Icons.person,
                  color: white,
                  size: 30.sp,
                ),
              )
            : Image.network(_store.aplicador!.foto!),
        DividerWidget(height: 1.h),
        textWidget(
          _store.aplicador!.nome,
          style: h2(),
          textAlign: TextAlign.center,
        ),
        DividerWidget(height: 1.h),
        textWidget(
          "Atendimentos feitos: ${_store.aplicador!.atendimentos}",
          style: text(),
        ),
        DividerWidget(height: 1.h),
        RatingBar.builder(
          initialRating: 4,
          minRating: 1,
          direction: Axis.horizontal,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 1.w),
          itemBuilder: (context, _) => const Icon(Icons.star, color: primary),
          onRatingUpdate: _store.setNotaSessao,
        ),
      ],
    );
  }

  Widget _avaliacaoEstabelecimento() {
    if (_store.estabelecimento == null) return const SizedBox();

    return Column(
      children: [
        textWidget(
          "Avalie o estabelecimento:",
          style: h2(),
          textAlign: TextAlign.center,
        ),
        DividerWidget(height: 2.h),
        (_store.estabelecimento!.foto == null)
            ? Image.asset(
                'assets/icons/ic_launcher.png',
                height: 12.5.h,
                width: 25.w,
              )
            : Image.network(_store.estabelecimento!.foto!),
        DividerWidget(height: 1.h),
        textWidget(
          _store.estabelecimento!.nome,
          style: h2(),
          textAlign: TextAlign.center,
        ),
        DividerWidget(height: 1.h),
        RatingBar.builder(
          initialRating: 4,
          minRating: 1,
          direction: Axis.horizontal,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 1.w),
          itemBuilder: (context, _) => const Icon(Icons.star, color: primary),
          onRatingUpdate: _store.setNotaSessao,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _store.resetAvaliar();

    super.dispose();
  }
}
