import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/models/curriculo.model.dart';
import 'package:pollos_digital/app/modules/curriculo/curriculo_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/enums/button_sizes.enum.dart';
import 'package:pollos_digital/app/shared/modal_bottom_sheet.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DadosResultadosPage extends StatefulWidget {
  // final CurriculoModel? curriculo;
  const DadosResultadosPage({super.key});

  @override
  State<DadosResultadosPage> createState() => _DadosResultadosPageState();
}

class _DadosResultadosPageState extends State<DadosResultadosPage> {
  final CurriculoStore _store = Modular.get<CurriculoStore>();
  late final Future<void> _future;

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
        InputWidget(
          label: 'Nome',
          // controller: TextEditingController(text: widget.curriculo?.nome),
          controller: TextEditingController(text: _store.curriculoModel?.nome),
        ),
        DividerWidget(height: 2.h),
        InputWidget(
          label: 'Email',
          // controller: TextEditingController(text: widget.curriculo?.email),
          controller: TextEditingController(text: _store.curriculoModel?.email),
        ),
        DividerWidget(height: 2.h),
        InputWidget(
          label: 'Telefone',
          // controller: TextEditingController(text: widget.curriculo?.telefone),
          controller:
              TextEditingController(text: _store.curriculoModel?.telefone),
        ),
        DividerWidget(height: 2.h),
        InputWidget(
          label: 'Resumo',
          minLines: 4,
          maxLines: 4,
          // controller: TextEditingController(text: widget.curriculo?.resumo),
          controller:
              TextEditingController(text: _store.curriculoModel?.resumo),
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
}
