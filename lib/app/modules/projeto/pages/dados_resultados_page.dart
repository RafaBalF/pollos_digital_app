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
import 'package:pollos_digital/app/shared/widgets/inputs/input_depoimento_texto.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_experiencia.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_extras.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_faq.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_habilidades.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_image.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_missao_visao_valores.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_widget.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_yt_video.dart';
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

  final celularFormatter = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  final ValueNotifier<XFile?> _arquivoNotifier = ValueNotifier<XFile?>(null);

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
          InputImagemWidget.rectangular(
            arquivoNotifier: _arquivoNotifier,
            image: _store.image,
            linkImage: _store.projetoModel?.linkImage,
          ),
          DividerWidget(height: 2.h),
          InputWidget(
            label: 'Nome',
            onChanged: _store.setNome,
            controller:
                TextEditingController(text: _store.projetoModel?.nome ?? ''),
          ),
          DividerWidget(height: 2.h),
          InputWidget(
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
          InputYTVideoWidget(store: _store),
          DividerWidget(height: 2.h),
          InputMissaoVisaoValoresWidget(store: _store),
          DividerWidget(height: 2.h),
          InputHabilidadesWidget(store: _store),
          DividerWidget(height: 2.h),
          InputExtraWidget(store: _store),
          DividerWidget(height: 2.h),
          InputFaqWidget(store: _store),
          DividerWidget(height: 2.h),
          InputCardWidget(store: _store),
          DividerWidget(height: 2.h),
          InputDepoimentoTextoWidget(store: _store),
          DividerWidget(height: 2.h),
          InputExperienciaWidget(store: _store),
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
