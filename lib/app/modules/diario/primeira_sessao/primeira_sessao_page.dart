import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/mixins/form_validations_mixin.dart';
import 'package:pollos_digital/app/modules/diario/diario_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/modal_bottom_sheet.dart';
import 'package:pollos_digital/app/shared/services/camera.service.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/boolean_choice_widget.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_widget.dart';
import 'package:pollos_digital/app/shared/widgets/shimmer_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PrimeiraSessaoPage extends StatefulWidget {
  const PrimeiraSessaoPage({super.key});
  @override
  PrimeiraSessaoPageState createState() => PrimeiraSessaoPageState();
}

class PrimeiraSessaoPageState extends State<PrimeiraSessaoPage>
    with FormValidationsMixin {
  final DiarioStore _store = Modular.get<DiarioStore>();
  late final Future<void> _future;

  final _cameraService = CameraService();

  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    _future = Future.wait([
      _store.initPrimeiraSessao(),
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
            title: "1° Sessão",
            bodyPadding: EdgeInsets.symmetric(horizontal: 5.w),
            body: Observer(
              builder: (_) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Observer(builder: (_) {
                    return _body();
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

  Widget _body() {
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget("Desenho abaixo o seu resultado:", style: h2()),
          DividerWidget(height: 1.h),
          _selecionarFoto(),
          DividerWidget(height: 2.h),
          Observer(builder: (_) {
            return InputWidget(
              label: "Relate como foi a sua 1° sessão:",
              labelStyle: h2(),
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: 5,
              value: _store.relatoPS,
              onChanged: _store.setRelatoPS,
              validator: notEmpty,
            );
          }),
          DividerWidget(height: 2.h),
          Observer(builder: (_) {
            return BooleanChoiceWidget(
              title: "Está tomando medicamento?",
              item: _store.tomandoMedicamentoPS,
              onTrue: () => _store.setTomandoMedicamentoPS(true),
              onFalse: () => _store.setTomandoMedicamentoPS(false),
            );
          }),
          Observer(builder: (_) {
            return _store.tomandoMedicamentoPS == true
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Observer(builder: (_) {
                        return InputWidget(
                          label: "Qual medicamento?",
                          labelStyle: h2(),
                          value: _store.qualMedicamentoPS,
                          onChanged: _store.setQualMedicamentoPS,
                          validator: (v) => notEmptyWhen(
                            v,
                            _store.tomandoMedicamentoPS == true,
                          ),
                        );
                      }),
                      DividerWidget(height: 2.h),
                      Observer(builder: (_) {
                        return BooleanChoiceWidget(
                          title: "Está tomando medicamento?",
                          item: _store.tomouNosUltimosSeteDiasPS,
                          onTrue: () =>
                              _store.setTomouNosUltimosSeteDiasPS(true),
                          onFalse: () =>
                              _store.setTomouNosUltimosSeteDiasPS(false),
                        );
                      }),
                    ],
                  )
                : Container();
          }),
          DividerWidget(height: 1.h),
          Observer(builder: (_) {
            return InputWidget(
              label: "Quais foram os parâmetros utilizados nessa sessão?",
              labelStyle: h2(),
              value: _store.parametrosPS,
              onChanged: _store.setParametrosPS,
              validator: notEmpty,
            );
          }),
          DividerWidget(height: 2.h),
          Observer(builder: (_) {
            return InputWidget(
              label: "Quais foram as tecnicas utilizadas nessa sessão?",
              labelStyle: h2(),
              value: _store.tecnicasPS,
              onChanged: _store.setTecnicasPS,
              validator: notEmpty,
            );
          }),
          DividerWidget(height: 2.h),
          Observer(builder: (_) {
            return InputWidget(
              label:
                  "Já deixou a próxima sessão agendada dentro dos critérios estabelecidos?",
              labelStyle: h2(),
              value: _store.proxSessaoAgendadaPS,
              onChanged: _store.setProxSessaoAgendadaPS,
              validator: notEmpty,
            );
          }),
          DividerWidget(height: 3.h),
          ButtonWidget.filled(
              onPressed: () async {
                bool r = await _store.postPS();

                if (!mounted) return;

                if (r) {
                  f() {
                    Modular.to.pop();
                    Modular.to.pop();
                    Modular.to.pop();
                  }

                  showSuccessBottomSheet(
                    context,
                    message: "Sucesso",
                    dismissable: false,
                    onClose: f,
                    onPressed: f,
                  );
                } else {
                  showErrorBottomSheet(context, message: "Erro");
                }
              },
              title: "AVANÇAR"),
          DividerWidget(height: 5.h),
        ],
      ),
    );
  }

  Widget _selecionarFoto() {
    return GestureDetector(
      onTap: () {
        if (_store.fotoPS == null) {
          showCustomBottomSheet(
            context,
            "Selecionar",
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                children: [
                  _simpleTile(
                    () async {
                      if (!(await _cameraService.hasCameraPermission)) {
                        await _cameraService.askCameraPermission();
                      }

                      Modular.to.pop();

                      final f = await _cameraService.takePhotoFromCamera();
                      _store.setFotoPS(f);
                    },
                    Icons.camera,
                    "Câmera",
                  ),
                  Divider(height: 3.h),
                  _simpleTile(
                    () async {
                      if (!(await _cameraService.hasStoragePermission)) {
                        await _cameraService.askStoragePermission();
                      }

                      Modular.to.pop();

                      final f = await _cameraService.getPhotoFromGallery();
                      _store.setFotoPS(f);
                    },
                    Icons.file_open,
                    "Arquivos",
                  ),
                ],
              ),
            ),
          );
        } else {
          showCustomBottomSheet(
            context,
            "Limpar",
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                children: [
                  DividerWidget(height: 3.h),
                  _simpleTile(
                    () {
                      _store.setFotoPS(null);
                      Modular.to.pop();
                    },
                    Icons.delete,
                    "Remover foto",
                  ),
                ],
              ),
            ),
          );
        }
      },
      child: Container(
        height: 20.h,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: primary),
        ),
        child: Observer(builder: (_) {
          return (_store.fotoPS != null)
              ? Image.file(File(_store.fotoPS!.path))
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.photo_camera_back,
                      color: primary,
                      size: 32.sp,
                    ),
                    textWidget("Selecione a foto", style: label()),
                  ],
                );
        }),
      ),
    );
  }

  Widget _simpleTile(void Function()? onTap, IconData icon, String text) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: black, size: 24.sp),
          SizedBox(width: 2.5.w),
          textWidget(text, style: h2(color: black)),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _store.resetPrimeiraSessao();

    super.dispose();
  }
}
