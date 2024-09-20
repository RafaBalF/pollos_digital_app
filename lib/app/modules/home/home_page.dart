import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:pollos_digital/app/modules/home/widgets/cashback_widget.dart';
import 'package:pollos_digital/app/modules/home/widgets/main_scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/modules/home/home_store.dart';
import 'package:pollos_digital/app/modules/home/widgets/redirect_card_widget.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/shimmer_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeStore _store = Modular.get<HomeStore>();
  late final Future<void> _future;

  final NumberFormat currencyFormatter = NumberFormat("#,##0.00", "pt_BR");

  final double mostWishedCardWidth = 50.w;
  final double mostWishedCardRadius = 10;
  final double mostWishedPhotoHeight = 20.h;
  final double mostWishedDetailsHeight = 12.h;

  @override
  void initState() {
    _future = Future.wait([_store.initHome()]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return MainScaffoldWidget(body: Observer(
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
        children: [
          DividerWidget(height: 3.h),
          SizedBox(
            height: 10.h,
            width: 100.w,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(right: 3.w),
                  child: ShimmerWidget(width: 20.w, height: 25.h),
                );
              },
            ),
          ),
          DividerWidget(height: 3.h),
          SizedBox(
            height: 5.h,
            width: 90.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ShimmerWidget(width: 70.w, height: 4.h),
                ShimmerWidget(width: 15.w, height: 4.h),
              ],
            ),
          ),
          DividerWidget(height: 3.h),
          ShimmerWidget(width: 90.w, height: 12.h),
          DividerWidget(height: 2.h),
          ShimmerWidget(width: 90.w, height: 12.h),
          DividerWidget(height: 3.h),
          SizedBox(
            height: 25.h,
            width: 100.w,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: ShimmerWidget(width: 43.w, height: 10.h),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    final double spacing = 3.h;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DividerWidget(height: spacing),
        _cards(),
        Observer(builder: (_) => CashbackWidget(valor: _store.cashback)),
        DividerWidget(height: spacing),
        _mostAccessed(),
        DividerWidget(height: spacing),
        _horizontalBanners(),
        DividerWidget(height: spacing),
        _verticalBanners(),
        // DividerWidget(height: spacing),
        // _mostWished(),
      ],
    );
  }

  Widget _cards() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RedirectCardWidget(
            imgPath: 'assets/icons/svg/document_accent.svg',
            label: 'Criar currículo',
            route: '/curriculo/',
            labelColor: primary,
            margin: EdgeInsets.only(right: 2.w),
          ),
          RedirectCardWidget(
            imgPath: 'assets/icons/svg/document_accent.svg',
            label: 'Acessar modelos',
            route: '/curriculo/modelos-criados',
            labelColor: primary,
            margin: EdgeInsets.only(right: 2.w),
          ),
          // RedirectCardWidget(
          //   imgPath: 'assets/icons/svg/money_accent.svg',
          //   label: 'Pagamentos',
          //   route: '/pagamentos/',
          //   labelColor: primary,
          //   margin: EdgeInsets.only(right: 2.w),
          //   maxlines: 1,
          // ),
          // RedirectCardWidget(
          //   imgPath: 'assets/icons/svg/blockquote_accent.svg',
          //   label: 'Diário',
          //   route: '/diario/',
          //   labelColor: primary,
          //   margin: EdgeInsets.only(right: 2.w),
          // ),
          RedirectCardWidget(
            imgPath: 'assets/icons/svg/list-details_accent.svg',
            label: 'Perguntas frequentes',
            route: '/faq',
            labelColor: primary,
            margin: EdgeInsets.only(right: 2.w),
          ),
          // RedirectCardWidget(
          //   imgPath: 'assets/icons/svg/chat_accent.svg',
          //   label: 'Chat',
          //   route: '',
          //   labelColor: primary,
          //   margin: EdgeInsets.only(right: 2.w),
          // ),
          RedirectCardWidget(
            imgPath: 'assets/icons/svg/calendar_accent.svg',
            label: 'Agenda',
            route: '/sessao/agendamento',
            labelColor: primary,
            margin: EdgeInsets.only(right: 2.w),
          ),
          RedirectCardWidget(
            imgPath: 'assets/icons/svg/calendar_accent.svg',
            label: 'Agenda',
            route: '/sessao/agendamento',
            labelColor: primary,
            margin: EdgeInsets.only(right: 2.w),
          ),
          RedirectCardWidget(
            imgPath: 'assets/icons/svg/calendar_accent.svg',
            label: 'Agenda',
            route: '/sessao/agendamento',
            labelColor: primary,
            margin: EdgeInsets.only(right: 2.w),
          ),
        ],
      ),
    );
  }

  Widget _mostAccessed() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(
          'Mais acessados',
          style: h2(color: primary),
          textAlign: TextAlign.start,
        ),
        DividerWidget(height: 2.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // _mostAccessedCard('MEU DIÁRIO', '/diario/'),
              _mostAccessedCard('MEU TRATAMENTO', '/sessao/historico'),
              // _mostAccessedCard('FINANCEIRO', '/pagamentos/'),
            ],
          ),
        )
      ],
    );
  }

  Widget _mostAccessedCard(String label, String route) {
    return Container(
      width: 35.w,
      height: 4.h,
      margin: EdgeInsets.symmetric(horizontal: 1.w),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: grey),
          ),
          padding: EdgeInsets.symmetric(horizontal: 1.w),
          alignment: Alignment.center,
          child: textWidget(
            label,
            textAlign: TextAlign.center,
            style: profileTile(color: darkGrey),
          ),
        ),
        onTap: () {
          Modular.to.pushNamed(route);
        },
      ),
    );
  }

  Widget _horizontalBanners() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _horizontalBanner(
          'assets/images/banners/ban-ofertas.png',
          () => Modular.to.pushNamed('/parceiros/'),
        ),
        DividerWidget(height: 1.h),
        _horizontalBanner(
          'assets/images/banners/ban-contato.png',
          () => Modular.to.pushNamed("/sessao/historico"),
        ),
      ],
    );
  }

  Widget _horizontalBanner(String imgPath, Function()? onTap) {
    return SizedBox(
      width: 90.w,
      child: GestureDetector(
        onTap: onTap,
        child: Image.asset(
          imgPath,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Widget _verticalBanners() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget('Conheça os Modelos', fontSize: 20.sp),
        DividerWidget(height: 1.h),
        SizedBox(
          height: 35.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: _store.curriculoStore.listaModelos.length,
            itemBuilder: (BuildContext context, int index) {
              return _verticalBanner(
                _store.curriculoStore.listaModelos[index].asset,
                _store.curriculoStore.listaModelos[index].link,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _verticalBanner(String imgPath, String route) {
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          launchUrlString(route);
        },
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Image.asset(imgPath),
        ),
      ),
    );
  }

  Widget _mostWished() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textWidget(
              'Mais desejados',
              style: h2(),
              textAlign: TextAlign.start,
            ),
            GestureDetector(
              onTap: () async {
                await launchUrlString("https://lfcare.laserfast.com.br/");
              },
              child: Row(
                children: [
                  textWidget(
                    'Ver todos',
                    style: text(color: primary),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    color: primary,
                  )
                ],
              ),
            )
          ],
        ),
        DividerWidget(height: 2.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _mostWishedCard(
                'Pernas inteiras 12 vezes',
                'assets/images/home/most-wished-1.png',
                'https://www.loja.laserfast.com.br/Produto/Detalhe/pernas-inteiras-feminino',
                1349.85,
                oldPrice: 2229.90,
                duration: '25 min',
                review: 4.5,
              ),
              _mostWishedCard(
                'Desodorante L.F Care 50ML',
                'assets/images/home/most-wished-2.png',
                'https://lfcare.laserfast.com.br/Produto/Detalhe/desodorante-lf-Care',
                9.90,
                oldPrice: 19.90,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _mostWishedCard(
    String title,
    String photo,
    String route,
    double price, {
    double? oldPrice,
    String? duration,
    double? review,
  }) {
    String formattedPrice = "R\$ ${currencyFormatter.format(price)}";

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

    Widget durationWidget = (duration != null)
        ? Container(
            width: 20.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: grey),
            ),
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            // margin: EdgeInsets.only(bottom: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.schedule, color: darkGrey, size: 15),
                SizedBox(width: 1.w),
                textWidget(duration, style: small()),
              ],
            ),
          )
        : const SizedBox();

    return GestureDetector(
      onTap: () {
        launchUrlString(route);
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
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(mostWishedCardRadius),
                      topRight: Radius.circular(mostWishedCardRadius),
                    ),
                    child: Image.asset(
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
                      textWidget(
                        title,
                        textAlign: TextAlign.start,
                        style: mostWished(color: darkerGrey),
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
                          durationWidget,
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
}
