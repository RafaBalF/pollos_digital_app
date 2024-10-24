import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pollos_digital/app/modules/projeto/projeto_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/mixins/form_validations_mixin.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_card.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_extras.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_faq.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_habilidades.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DadosResultadosPage extends StatefulWidget {
  const DadosResultadosPage({super.key});

  @override
  State<DadosResultadosPage> createState() => _DadosResultadosPageState();
}

class _DadosResultadosPageState extends State<DadosResultadosPage>
    with FormValidationsMixin {
  final ProjetoStore _store = Modular.get<ProjetoStore>();
  late final Future<void> _future;
  final FocusNode _focusNode = FocusNode();

  final celularFormatter = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  final double cardWidth = 90.w;
  final double cardHeight = 30.h;

  String? urlAmigavelInauterada = '';

  @override
  void initState() {
    _future = Future.wait([]);

    urlAmigavelInauterada = _store.projetoModel?.urlAmigavel;

    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose(); // Não se esqueça de liberar o FocusNode
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SimpleScaffoldWidget(
            title: 'Resultados',
            bodyPadding: EdgeInsets.all(2.w),
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
    return const CircularProgressIndicator();
  }

  Widget _body() {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUnfocus,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          inputImage(_store.projetoModel?.linkImage),
          DividerWidget(height: 2.h),
          InputWidget(
            label: 'Nome',
            onChanged: _store.setNome,
            controller:
                TextEditingController(text: _store.projetoModel?.nome ?? ''),
          ),
          DividerWidget(height: 2.h),
          InputWidget(
            // focusNode: _focusNode,
            label: 'Nome da Página',
            onChanged: _store.setNomePagina,
            controller: TextEditingController(
                text: _store.projetoModel?.urlAmigavel ?? ''),
            validator: notEmpty,
          ),
          DividerWidget(height: 2.h),
          InputWidget(
            label: 'Email',
            onChanged: _store.setEmail,
            controller:
                TextEditingController(text: _store.projetoModel?.email ?? ''),
          ),
          DividerWidget(height: 2.h),
          InputWidget(
            label: 'WhatsApp',
            onChanged: _store.setTelefone,
            inputFormatters: [celularFormatter],
            controller: TextEditingController(
                text: _store.projetoModel?.telefone ?? ''),
          ),
          DividerWidget(height: 2.h),
          InputWidget(
            label: 'Descrição',
            minLines: 10,
            maxLines: 10,
            onChanged: _store.setDescricao,
            controller: TextEditingController(
                text: _store.projetoModel?.descricao ?? ''),
          ),
          DividerWidget(height: 2.h),
          InputWidget(
            label: 'Missão',
            minLines: 4,
            maxLines: 4,
            onChanged: _store.setMissao,
            controller:
                TextEditingController(text: _store.projetoModel?.missao ?? ''),
          ),
          DividerWidget(height: 2.h),
          InputWidget(
            label: 'Visão',
            minLines: 4,
            maxLines: 4,
            onChanged: _store.setVisao,
            controller:
                TextEditingController(text: _store.projetoModel?.visao ?? ''),
          ),
          DividerWidget(height: 2.h),
          InputWidget(
            label: 'Valores',
            minLines: 4,
            maxLines: 4,
            onChanged: _store.setValores,
            controller:
                TextEditingController(text: _store.projetoModel?.valores ?? ''),
          ),
          DividerWidget(height: 2.h),
          InputHabilidadesWidget(store: _store),
          DividerWidget(height: 2.h),
          InputExtraWidget(store: _store),
          DividerWidget(height: 2.h),
          InputFaqWidget(store: _store),
          DividerWidget(height: 2.h),
          InputCardWidget(store: _store),
          DividerWidget(height: 4.h),
          ButtonWidget.filled(
            onPressed: () async {
              if (_store.projetoModel?.usuarioId == null ||
                  _store.projetoModel?.urlAmigavel != urlAmigavelInauterada) {
                var r = await _store.validarUrlAmigavel();
                if (r == null) {
                  Modular.to.pushNamed('/projeto/projetos-modelos');
                } else {
                  // ignore: use_build_context_synchronously
                  _showToast(context, r);
                }
              } else {
                Modular.to.pushNamed('/projeto/projetos-modelos');
              }
            },
            title: 'AVANÇAR',
            textColor: white,
            backgroundColor: focus,
          ),
          DividerWidget(height: 4.h),
        ],
      ),
    );
  }

  Widget inputImage(imagemLink) {
    return (_store.image == null && imagemLink == null)
        ? _addFileWidget()
        : _fileCard(imagemLink);
  }

  Widget _fileCard(imagemLink) {
    return Container(
        width: 100.w,
        height: 40.h,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Stack(
          children: [
            Positioned.fill(
                child: Padding(
              padding: EdgeInsets.all(5.w),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: _image(imagemLink),
              ),
            )),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: focus,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      await _store.deleteFile();
                      setState(() {});
                    }),
              ),
            )
          ],
        ));
  }

  Widget _image(imagemLink) {
    return imagemLink == null
        ? Image.file(
            File(_store.image!.path),
            fit: BoxFit.cover,
          )
        : Image.network(imagemLink);
  }

  Widget _addFileWidget() {
    return GestureDetector(
      onTap: () async {
        await _getGalleryPhoto(context);
      },
      child: Container(
        width: 90.w,
        height: 30.h,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            border: Border.all(style: BorderStyle.solid, color: focus),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.camera_alt_outlined,
                color: focus,
                size: 35.sp,
              ),
              DividerWidget(height: 2.h),
              textWidget('Incluir Imagem',
                  color: focus, fontSize: 18.sp, fontWeight: FontWeight.bold),
            ],
          ),
        ),
      ),
    );
  }

  _getGalleryPhoto(context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    _store.addFile(image);
  }

  void _showToast(BuildContext context, message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        backgroundColor: primary,
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
