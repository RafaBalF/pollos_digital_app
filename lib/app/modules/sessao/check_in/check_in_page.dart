import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/modules/sessao/sessao_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/modal_bottom_sheet.dart';
import 'package:pollos_digital/app/shared/services/camera.service.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/selectable_cards_widget.dart';
import 'package:pollos_digital/app/shared/widgets/shimmer_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CheckInPage extends StatefulWidget {
  const CheckInPage({super.key});
  @override
  CheckInPageState createState() => CheckInPageState();
}

class CheckInPageState extends State<CheckInPage> {
  final SessaoStore _store = Modular.get<SessaoStore>();
  late final Future<void> _future;

  final _cameraService = CameraService();

  @override
  void initState() {
    _future = Future.wait([
      _store.initCheckIn(),
      _cameraService.init(),
    ]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SimpleScaffoldWidget(
            title: 'CHECK-IN',
            bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
            body: Observer(
              builder: (_) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Observer(builder: (_) {
                    return (_store.sessaoParaCheckIn != null)
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
        DividerWidget(height: 2.5.h),
        _frame(),
        DividerWidget(height: 2.5.h),
        _tirarFotoBtn(),
        DividerWidget(height: 2.5.h),
        _confirmarCheckIn(),
      ],
    );
  }

  Widget _frame() {
    return Container(
      height: 40.h,
      width: 90.w,
      decoration: BoxDecoration(
        color: lightGrey,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: grey, width: 1.w),
      ),
      child: Observer(builder: (_) {
        return SizedBox(
            child: (_store.fotoCheckIn != null)
                ? Image.file(File(_store.fotoCheckIn!.path))
                : null);
      }),
    );
  }

  Widget _tirarFotoBtn() {
    return Observer(builder: (_) {
      return (_store.fotoCheckIn == null)
          ? ButtonWidget.filled(
              onPressed: () async {
                bool hasPermission = await _cameraService.hasAllPermissions();

                if (!mounted) return;

                if (!hasPermission) {
                  return showErrorBottomSheet(
                    context,
                    message:
                        "É necessário acesso à camera e ao armazenamento para prosseguir",
                  );
                }

                _store.setfotoCheckIn(await _cameraService.takePhoto());
              },
              backgroundColor: primary,
              title: 'TIRAR FOTO',
              textColor: white,
            )
          : ButtonWidget.outlined(
              onPressed: () => _store.setfotoCheckIn(null),
              borderColor: grey,
              title: 'REMOVER FOTO',
              textColor: darkerGrey,
            );
    });
  }

  Widget _confirmarCheckIn() {
    return Observer(builder: (_) {
      return (_store.fotoCheckIn != null)
          ? Column(
              children: [
                SelectableCardsWidget(
                  height: 20.h,
                  items: _store.areasDisponiveis.toList(),
                ),
                DividerWidget(height: 2.5.h),
                ButtonWidget.filled(
                  onPressed: () async {
                    bool r = await _store.fazerCheckIn();

                    if (!mounted) return;

                    Modular.to.pop();

                    if (!r) {
                      showErrorBottomSheet(
                        context,
                        message: 'OCORREU UM ERRO AO TENTAR FAZER CHECK-IN',
                      );
                    } else {
                      showCustomBottomSheet(
                        context,
                        'CHECK-IN',
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Column(
                            children: [
                              (_store.atendidoPor!.foto == null)
                                  ? CircleAvatar(
                                      maxRadius: 30.sp,
                                      backgroundColor: primary,
                                      child: Icon(
                                        Icons.person,
                                        color: white,
                                        size: 30.sp,
                                      ),
                                    )
                                  : Image.network(_store.atendidoPor!.foto!),
                              DividerWidget(height: 1.h),
                              textWidget(
                                "Você será atendido(a) por ${_store.atendidoPor!.nome}",
                                style: h2(),
                                textAlign: TextAlign.center,
                              ),
                              DividerWidget(height: 1.h),
                              textWidget(
                                "Atendimentos feitos: ${_store.atendidoPor!.atendimentos}",
                                style: text(),
                              ),
                              DividerWidget(height: 2.5.h),
                              ButtonWidget.filled(
                                onPressed: () => Modular.to.pop(),
                                backgroundColor: primary,
                                title: 'FECHAR',
                                textColor: white,
                              ),
                            ],
                          ),
                        ),
                        dismissable: false,
                      );
                    }
                  },
                  backgroundColor: primary,
                  title: 'FAZER CHECK-IN',
                  textColor: white,
                ),
              ],
            )
          : const SizedBox();
    });
  }

  @override
  void dispose() {
    _store.resetCheckIn();

    super.dispose();
  }
}
