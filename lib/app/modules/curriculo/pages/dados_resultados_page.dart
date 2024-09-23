import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pollos_digital/app/modules/curriculo/curriculo_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/enums/button_sizes.enum.dart';
import 'package:pollos_digital/app/shared/modal_bottom_sheet.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DadosResultadosPage extends StatefulWidget {
  const DadosResultadosPage({super.key});

  @override
  State<DadosResultadosPage> createState() => _DadosResultadosPageState();
}

class _DadosResultadosPageState extends State<DadosResultadosPage> {
  final CurriculoStore _store = Modular.get<CurriculoStore>();
  late final Future<void> _future;

  final double cardWidth = 90.w;
  final double cardHeight = 30.h;

  @override
  void initState() {
    _future = Future.wait([]);

    super.initState();
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        inputImage(),
        DividerWidget(height: 2.h),
        InputWidget(
          label: 'Nome',
          onChanged: _store.setNome,
          controller: TextEditingController(text: _store.curriculoModel?.nome),
        ),
        DividerWidget(height: 2.h),
        InputWidget(
          label: 'Nome do Arquivo',
          onChanged: _store.setNomeArquivo,
          controller:
              TextEditingController(text: _store.curriculoModel?.nomeArquivo),
        ),
        DividerWidget(height: 2.h),
        InputWidget(
          label: 'Email',
          onChanged: _store.setEmail,
          controller: TextEditingController(text: _store.curriculoModel?.email),
        ),
        DividerWidget(height: 2.h),
        InputWidget(
          label: 'Telefone',
          onChanged: _store.setTelefone,
          controller:
              TextEditingController(text: _store.curriculoModel?.telefone),
        ),
        DividerWidget(height: 2.h),
        InputWidget(
          label: 'Descrição',
          minLines: 4,
          maxLines: 4,
          onChanged: _store.setDescricao,
          controller:
              TextEditingController(text: _store.curriculoModel?.descricao),
        ),
        DividerWidget(height: 2.h),
        InputWidget(
          label: 'Link de Contato',
          onChanged: _store.setLinkDeContato,
          controller:
              TextEditingController(text: _store.curriculoModel?.linkContato),
        ),
        DividerWidget(height: 2.h),
        InputWidget(
          label: 'Missão',
          minLines: 4,
          maxLines: 4,
          onChanged: _store.setMissao,
          controller:
              TextEditingController(text: _store.curriculoModel?.missao),
        ),
        DividerWidget(height: 2.h),
        InputWidget(
          label: 'Visão',
          minLines: 4,
          maxLines: 4,
          onChanged: _store.setVisao,
          controller: TextEditingController(text: _store.curriculoModel?.visao),
        ),
        DividerWidget(height: 2.h),
        InputWidget(
          label: 'Valores',
          minLines: 4,
          maxLines: 4,
          onChanged: _store.setValores,
          controller:
              TextEditingController(text: _store.curriculoModel?.valores),
        ),
        DividerWidget(height: 2.h),
        Container(
          width: 90.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0)),
                  color: Colors.grey[400],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Habilidades',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            height: 1.5),
                      ),
                      ButtonWidget.outlined(
                        onPressed: () {
                          showCustomBottomSheet(context, 'ADICIONAR HABILIDADE',
                              _addHabilidade());
                        },
                        title: 'Adicionar',
                        buttonSize: ButtonSize.small,
                        width: 150,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                  color: Colors.grey[200],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      // itemCount: widget.curriculo?.habilidades?.length,
                      itemCount: _store.curriculoModel?.habilidades?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            ListTile(
                              title:
                                  (_store.curriculoModel?.habilidades != null)
                                      ? Text(_store
                                          .curriculoModel?.habilidades?[index])
                                      : const Text(''),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  _store.deleteHabilidade(_store
                                      .curriculoModel?.habilidades?[index]);
                                },
                              ),
                            ),
                            const Divider(height: 0),
                          ],
                        );
                      }),
                ),
              )
            ],
          ),
        ),
        DividerWidget(height: 2.h),
        Container(
          width: 90.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0)),
                  color: Colors.grey[400],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Extras',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            height: 1.5),
                      ),
                      ButtonWidget.outlined(
                        onPressed: () {
                          showCustomBottomSheet(
                              context, 'ADICIONAR EXTRA', _addExtra());
                        },
                        title: 'Adicionar',
                        buttonSize: ButtonSize.small,
                        width: 150,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                  color: Colors.grey[200],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      // itemCount: widget.curriculo?.habilidades?.length,
                      itemCount: _store.curriculoModel?.extras?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            ListTile(
                              title: (_store.curriculoModel?.extras != null)
                                  ? Text(
                                      '${_store.curriculoModel?.extras?[index].descricao}: ${_store.curriculoModel?.extras?[index].valor}')
                                  : const Text(''),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  _store.deleteExtra(
                                      _store.curriculoModel?.extras?[index]);
                                },
                              ),
                            ),
                            const Divider(height: 0),
                          ],
                        );
                      }),
                ),
              )
            ],
          ),
        ),
        DividerWidget(height: 4.h),
        ButtonWidget.filled(
          onPressed: () {
            Modular.to.pushNamed('/curriculo/curriculos-modelos');
          },
          title: 'AVANÇAR',
          textColor: white,
          backgroundColor: focus,
        )
      ],
    );
  }

  _addHabilidade() {
    return Column(
      children: [
        InputWidget(
          label: 'Habilidade',
          onChanged: _store.setHabilidade,
        ),
        const DividerWidget(height: 30),
        ButtonWidget.filled(
          width: 60.w,
          onPressed: () {
            _store.addHabilidade(_store.habilidade);
            Modular.to.pop();
          },
          title: 'ADICIONAR',
          backgroundColor: focus,
        )
      ],
    );
  }

  _addExtra() {
    return Column(
      children: [
        InputWidget(
          label: 'Descrição',
          onChanged: _store.setExtraDescricao,
        ),
        const DividerWidget(height: 30),
        InputWidget(
          label: 'Valor',
          onChanged: _store.setExtraValor,
        ),
        const DividerWidget(height: 30),
        ButtonWidget.filled(
          width: 60.w,
          onPressed: () {
            _store.addExtra(_store.extraDescricao, _store.extraValor);
            Modular.to.pop();
          },
          title: 'ADICIONAR',
          backgroundColor: focus,
        )
      ],
    );
  }

  Widget inputImage() {
    return _store.image == null ? _addFileWidget() : _fileCard();
  }

  Widget _fileCard() {
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
                child: _image(),
              ),
            )),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
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
                    }),
              ),
            )
          ],
        ));
  }

  Widget _image() {
    return Image.file(
      File(_store.image!.path),
      fit: BoxFit.cover,
    );
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
            border: Border.all(style: BorderStyle.solid, color: primary),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.camera_alt_outlined,
                color: primary,
                size: 35.sp,
              ),
              DividerWidget(height: 2.h),
              textWidget('Incluir Imagem',
                  color: primary, fontSize: 18.sp, fontWeight: FontWeight.bold),
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
}
