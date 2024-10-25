import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pollos_digital/app/modules/projeto/projeto_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/enums/button_sizes.enum.dart';
import 'package:pollos_digital/app/shared/modal_bottom_sheet.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_image.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InputDepoimentoTextoWidget extends StatefulWidget {
  final ProjetoStore store;

  const InputDepoimentoTextoWidget({super.key, required this.store});

  @override
  State<InputDepoimentoTextoWidget> createState() =>
      _InputDepoimentoTextoWidgetState();
}

class _InputDepoimentoTextoWidgetState
    extends State<InputDepoimentoTextoWidget> {
  final ValueNotifier<XFile?> _arquivoNotifier = ValueNotifier<XFile?>(null);

  @override
  void dispose() {
    _arquivoNotifier.dispose(); // Lembre-se de descartar o ValueNotifier
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        width: 90.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0)),
                // color: Colors.grey[400],
                color: focus,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Depoimentos',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                          color: Colors.white),
                    ),
                    ButtonWidget.outlined(
                      textColor: Colors.white,
                      onPressed: () {
                        showCustomBottomSheet(context, 'ADICIONAR DEPOIMENTO',
                            _addDepoimento(null));
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
                color: Colors.grey[100],
                // color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.store.projetoModel?.depoimentos?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showCustomBottomSheet(
                                  context,
                                  'ADICIONAR DEPOIMENTO',
                                  _addDepoimento(index));
                            },
                            child: ListTile(
                              title: Container(
                                color: Colors.transparent,
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                    widget.store.projetoModel
                                        ?.depoimentos?[index].nome,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  widget.store.deletDepoimento(widget
                                      .store.projetoModel?.depoimentos?[index]);
                                },
                              ),
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
      );
    });
  }

  _addDepoimento(index) {
    if (index != null) {
      widget.store.depoimentoNome =
          widget.store.projetoModel?.depoimentos?[index].nome;
      widget.store.depoimentoTexto =
          widget.store.projetoModel?.depoimentos?[index].depoimento;
      widget.store.depoimentoImage =
          widget.store.projetoModel?.depoimentos?[index].image;
    } else {
      widget.store.depoimentoNome = null;
      widget.store.depoimentoTexto = null;
    }
    return Column(
      children: [
        InputImagemWidget.circle(
          arquivoNotifier: _arquivoNotifier,
          image: widget.store.depoimentoImage,
          linkImage: (index != null)
              ? widget.store.projetoModel?.depoimentos![index].linkImage
              : null,
        ),
        InputWidget(
          label: 'Nome',
          onChanged: widget.store.setDepoimentoNome,
          value: widget.store.depoimentoNome,
        ),
        const DividerWidget(height: 30),
        InputWidget(
          label: 'Depoimento',
          onChanged: widget.store.setDepoimentoTexto,
          value: widget.store.depoimentoTexto,
          maxLines: 7,
          minLines: 7,
        ),
        const DividerWidget(height: 30),
        ValueListenableBuilder<XFile?>(
          valueListenable: _arquivoNotifier,
          builder: (context, arquivo, child) {
            return ButtonWidget.filled(
              width: 60.w,
              onPressed: () {
                widget.store.addDepoimento(widget.store.depoimentoNome,
                    widget.store.depoimentoTexto, arquivo, index);
                Modular.to.pop();
              },
              title: 'SALVAR',
              backgroundColor: focus,
            );
          },
        ),
      ],
    );
  }
}
