import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:pollos_digital/app/modules/projeto/projeto_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/interfaces/selectable_card.interface.dart';
import 'package:pollos_digital/app/shared/modal_bottom_sheet.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/selectable_cards_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProjetosModelosPage extends StatefulWidget {
  const ProjetosModelosPage({super.key});

  @override
  State<ProjetosModelosPage> createState() => _ProjetosModelosPageState();
}

class _ProjetosModelosPageState extends State<ProjetosModelosPage> {
  final ProjetoStore _store = Modular.get<ProjetoStore>();
  late final Future<void> _future;
  final NumberFormat currencyFormatter = NumberFormat("#,##0.00", "pt_BR");

  @override
  void initState() {
    _future = Future.wait([_store.initProjetosModelo()]);

    super.initState();
  }

  @override
  void dispose() {
    _store.listaModelos.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SimpleScaffoldWidget(
            title: 'Modelos',
            bodyPadding: EdgeInsets.all(2.w),
            actions: [
              IconButton(
                  onPressed: () {
                    showCustomBottomSheet(context, 'FILTRO', _filterWidget());
                  },
                  icon: const Icon(
                    Icons.tune,
                    color: primary,
                  ))
            ],
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
    return const CircularProgressIndicator(
      color: primary,
    );
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _itemsFilter(),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Número de colunas
            childAspectRatio: 0.67, // Proporção largura/altura das células
            crossAxisSpacing: 3.0, // Espaçamento horizontal
            mainAxisSpacing: 8.0, // Espaçamento vertical
          ),
          itemCount: _store.listaModelos.length,
          itemBuilder: (context, index) {
            // Aqui você pode personalizar o widget que será exibido no grid
            return _mostWishedCard(
              'Modelo ${index + 1}', //_store.listaModelos[index].nome,
              _store.listaModelos[index].imgUrl,
              00.00,
              index,
              oldPrice: 00.00,
              review: 4.5,
            );
          },
        ),
        DividerWidget(height: 5.h),
      ],
    );
  }

  Widget _itemsFilter() {
    return Container();
  }

  Widget _mostWishedCard(
    String title,
    String photo,
    double price,
    int index, {
    double? oldPrice,
    String? duration,
    double? review,
  }) {
    String formattedPrice = "R\$ ${currencyFormatter.format(price)}";
    final double mostWishedCardWidth = 50.w;
    const double mostWishedCardRadius = 10;
    final double mostWishedPhotoHeight = 20.h;
    final double mostWishedDetailsHeight = 12.h;

    Widget reviewBadge = (review != null)
        ? Positioned(
            height: 5.h,
            child: Container(
                margin: const EdgeInsets.all(7.5),
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    textWidget(review.toString(), style: small()),
                    SizedBox(width: 1.w),
                    Icon(
                      Icons.star,
                      color: Colors.yellow[700],
                      size: 15,
                    )
                  ],
                )),
          )
        : const SizedBox();

    Widget oldPriceWidget = (oldPrice != null)
        ? textWidget(
            "R\$ ${currencyFormatter.format(oldPrice)}",
            style: verySmall(textDecoration: TextDecoration.lineThrough),
            textAlign: TextAlign.start,
          )
        : const SizedBox();

    return GestureDetector(
      onTap: () {
        _store.setModeloSelecionado(index);
        Modular.to.pushNamed('/projeto/details-modelo');
      },
      child: Container(
        width: mostWishedCardWidth,
        decoration: BoxDecoration(
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: grey,
              blurRadius: 5,
            ),
          ],
          color: background,
          borderRadius: BorderRadius.circular(mostWishedCardRadius),
        ),
        margin: EdgeInsets.only(right: 5.w, bottom: 1.h),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: mostWishedCardWidth,
                  height: mostWishedPhotoHeight,
                  decoration: const BoxDecoration(
                    color: background,
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(mostWishedCardRadius),
                      topRight: Radius.circular(mostWishedCardRadius),
                    ),
                    child: Image.network(
                      photo,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: mostWishedDetailsHeight,
                  width: mostWishedCardWidth,
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: 1.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100.w,
                        child: textWidget(
                          title,
                          textAlign: TextAlign.start,
                          style: mostWished(color: darkerGrey),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 25.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                oldPriceWidget,
                                textWidget(
                                  formattedPrice,
                                  style: headTitle(
                                    color: success,
                                  ),
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            reviewBadge,
          ],
        ),
      ),
    );
  }

  Widget _filterWidget() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(children: [
        _orderFilterWidget(),
        _areaPickerSection(),
        DividerWidget(height: 2.h),
        ButtonWidget.filled(
          onPressed: () async {},
          loading: _store.loadingStore.isLoading,
          title: 'Filtrar',
          textColor: white,
          backgroundColor: focus,
        ),
      ]),
    );
  }

  Widget _orderFilterWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(
          'Ordenar por:',
          style: label(),
          textAlign: TextAlign.start,
        ),
        DividerWidget(height: 2.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _orderFilterItem('MAIS VENDIDO', Icons.favorite_border,
                Colors.transparent, Colors.black, Colors.grey),
            _orderFilterItem('GRÁTIS', Icons.money_off, Colors.transparent,
                Colors.black, Colors.grey),
            _orderFilterItem('AVALIAÇÃO', Icons.star_border, Colors.transparent,
                Colors.black, Colors.grey),
            _orderFilterItem('PREÇO', Icons.attach_money, Colors.transparent,
                Colors.black, Colors.grey),
          ],
        ),
      ],
    );
  }

  Widget _orderFilterItem(label, icon, corContainer, corTexto, corIcon) {
    // Color corContainer = Colors.transparent;
    // Color corTexto = Colors.black;
    // Color corIcon = Colors.grey;
    return GestureDetector(
      onTap: () {
        corContainer = focus;
        corTexto = Colors.white;
        corIcon = Colors.white;
        setState(() {});
      },
      child: Container(
        width: 22.w,
        height: 13.h,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
          color: corContainer,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                icon,
                color: corIcon,
                size: 40,
              ),
              // DividerWidget(height: 2.h),
              textWidget(label, fontSize: 11, color: corTexto)
            ],
          ),
        ),
      ),
    );
  }

  Widget _areaPickerSection() {
    return Observer(builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DividerWidget(height: 2.h),
          textWidget(
            'Categorias:',
            style: label(),
            textAlign: TextAlign.start,
          ),
          DividerWidget(height: 2.h),
          SelectableCardsWidget(
            height: 20.h,
            items: [
              SelectableCard(label: 'teste', value: 'value'),
              SelectableCard(label: 'testeteste', value: 'value'),
              SelectableCard(label: 'testetesteteste', value: 'value'),
              SelectableCard(label: 'teste', value: 'value'),
              SelectableCard(label: 'teste', value: 'value'),
              SelectableCard(label: 'teste', value: 'value'),
              SelectableCard(label: 'teste', value: 'value'),
              SelectableCard(label: 'teste', value: 'value'),
              SelectableCard(label: 'teste', value: 'value'),
              SelectableCard(label: 'teste', value: 'value'),
              SelectableCard(label: 'teste', value: 'value'),
              SelectableCard(label: 'teste', value: 'value'),
              SelectableCard(label: 'teste', value: 'value'),
              SelectableCard(label: 'teste', value: 'value'),
              SelectableCard(label: 'teste', value: 'value'),
              SelectableCard(label: 'teste', value: 'value'),
              SelectableCard(label: 'teste', value: 'value'),
              SelectableCard(label: 'teste', value: 'value'),
              SelectableCard(label: 'teste', value: 'value'),
              SelectableCard(label: 'teste', value: 'value'),
              SelectableCard(label: 'teste', value: 'value'),
            ],
          ),
        ],
      );
    });
  }
}
