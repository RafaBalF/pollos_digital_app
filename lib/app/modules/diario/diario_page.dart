import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pollos_digital/app/modules/diario/classes/map_item_values.dart';
import 'package:pollos_digital/app/modules/diario/diario_store.dart';
import 'package:pollos_digital/app/modules/diario/widgets/map_item.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/enums/button_sizes.enum.dart';
import 'package:pollos_digital/app/modules/diario/classes/map_position.dart';
import 'package:pollos_digital/app/shared/modal_bottom_sheet.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/shimmer_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DiarioPage extends StatefulWidget {
  const DiarioPage({super.key});
  @override
  DiarioPageState createState() => DiarioPageState();
}

class DiarioPageState extends State<DiarioPage> {
  final DiarioStore _store = Modular.get<DiarioStore>();
  late final Future<void> _future;

  int introPage = 0;

  late final List<MapItemValues> valoresEstrelas = [
    MapItemValues(
      position: MapPosition(
        bottom: 3.h,
        right: 12.w,
      ),
      onPressed: () => Modular.to.pushNamed('/diario/antes-primeira-sessao'),
    ),
    MapItemValues(
      position: MapPosition(
        bottom: 20.h,
        right: 65.w,
      ),
      onPressed: () {},
    ),
    MapItemValues(
      position: MapPosition(
        bottom: 31.h,
        right: 57.w,
      ),
      onPressed: () {},
    ),
    MapItemValues(
      position: MapPosition(
        bottom: 35.h,
        right: 30.w,
      ),
      onPressed: () {},
    ),
    MapItemValues(
      position: MapPosition(
        bottom: 43.h,
        right: 7.w,
      ),
      onPressed: () {},
    ),
    MapItemValues(
      position: MapPosition(
        bottom: 58.h,
        right: 32.w,
      ),
      onPressed: () {},
    ),
    MapItemValues(
      position: MapPosition(
        bottom: 64.h,
        right: 62.w,
      ),
      onPressed: () {},
    ),
    MapItemValues(
      position: MapPosition(
        bottom: 73.h,
        right: 75.w,
      ),
      onPressed: () {},
    ),
    MapItemValues(
      position: MapPosition(
        bottom: 78.h,
        right: 37.w,
      ),
      onPressed: () {},
    ),
    MapItemValues(
      position: MapPosition(
        bottom: 87.h,
        right: 7.w,
      ),
      onPressed: () {},
    )
  ];

  @override
  void initState() {
    _future = Future.wait([_store.initDiario()]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              width: 100.w,
              height: 100.h,
              child: Observer(
                builder: (_) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return _body();
                  } else {
                    return _loadingBody();
                  }
                },
              ),
            ),
          ),
        );
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
    return Observer(builder: (_) {
      return Stack(
        children: [
          Image.asset(
            width: 100.w,
            height: 100.h,
            'assets/images/diario/background.png',
            fit: BoxFit.fitHeight,
          ),
          Positioned(
            bottom: 3.h,
            right: 40.w,
            child: SizedBox(
              width: 40.w,
              child: ButtonWidget.filled(
                onPressed: () => Modular.to.pop(),
                title: "RETORNAR",
                buttonSize: ButtonSize.medium,
              ),
            ),
          ),
          ..._estrelas(),
          ..._tesouros(),
          ..._avisos(),
          ..._intro(),
        ],
      );
    });
  }

  List<Widget> _estrelas() {
    List<Widget> list = [];

    for (var i = 0; i < valoresEstrelas.length; i++) {
      list.add(MapItem.estrela(
        onPressed: valoresEstrelas[i].onPressed,
        position: valoresEstrelas[i].position,
        desbloqueado: _store.etapa >= i,
        usado: _store.etapa > i,
      ));
    }

    return list;
  }

  List<Widget> _tesouros() {
    return [
      MapItem.tesouro(
        onPressed: () {},
        position: MapPosition(
          bottom: 17.h,
          right: 25.w,
        ),
        desbloqueado: false,
        usado: false,
      ),
      MapItem.tesouro(
        onPressed: () {},
        position: MapPosition(
          bottom: 68.h,
          right: 35.w,
        ),
        desbloqueado: false,
        usado: false,
      ),
    ];
  }

  List<Widget> _avisos() {
    return [
      MapItem.aviso(
        position: MapPosition(
          bottom: 35.h,
          right: 65.w,
        ),
        imgPath: 'assets/images/diario/eh-normal-ainda-ter-pelos.svg',
        imageHeight: 7.h,
        onPressed: () {},
      ),
      MapItem.aviso(
        position: MapPosition(
          bottom: 80.h,
          right: 85.w,
        ),
        imgPath: 'assets/images/diario/balao-aviso.svg',
        onPressed: _mostrarAviso,
      ),
    ];
  }

  void _mostrarAviso() {
    showCustomBottomSheet(
      context,
      'ATENÇÃO',
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/images/diario/balao-aviso.svg',
              height: 10.h,
            ),
            DividerWidget(height: 3.h),
            textWidget(
              'E aí, trouxe a foto? Ela é importante para avaliarmos a evolução e personalizar o seu tratamento. A técnica a ser utilizada poderá ser somente onde restarem pelos.',
              maxLines: 10,
              textAlign: TextAlign.center,
            ),
            DividerWidget(height: 3.h),
            ButtonWidget.filled(
              onPressed: () => Modular.to.pop(),
              title: "FECHAR",
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _intro() {
    if (_store.viuIntro) return [];

    if (introPage == 0) {
      return [
        Positioned(
          bottom: 0,
          right: 0,
          child: SizedBox(
            height: 60.h,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DividerWidget(height: 5.h),
                    SvgPicture.asset('assets/images/diario/intro-1.svg'),
                    _avancar(
                      () => setState(() {
                        introPage = 1;
                      }),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/diario/fly.png',
                  fit: BoxFit.fitHeight,
                )
              ],
            ),
          ),
        ),
      ];
    }

    if (introPage == 1) {
      return [
        Positioned(
          bottom: 0,
          right: 0,
          child: SizedBox(
            height: 60.h,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DividerWidget(height: 5.h),
                    SvgPicture.asset('assets/images/diario/intro-2.svg'),
                    _avancar(
                      () => setState(() {
                        introPage = 2;
                        _store.verIntro;
                      }),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/diario/fly.png',
                  fit: BoxFit.fitHeight,
                )
              ],
            ),
          ),
        ),
      ];
    }

    return [];
  }

  Widget _avancar(Function()? onPressed) {
    return ButtonWidget.filled(
      onPressed: onPressed,
      backgroundColor: primary,
      title: 'AVANÇAR >',
      textColor: white,
      buttonSize: ButtonSize.medium,
      width: 40.w,
    );
  }

  @override
  void dispose() {
    _store.resetDiario();

    super.dispose();
  }
}
