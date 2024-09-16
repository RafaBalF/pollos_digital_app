import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/modules/curriculo/curriculo_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CurriculosModelosPage extends StatefulWidget {
  const CurriculosModelosPage({super.key});

  @override
  State<CurriculosModelosPage> createState() => _CurriculosModelosPageState();
}

class _CurriculosModelosPageState extends State<CurriculosModelosPage> {
  final CurriculoStore _store = Modular.get<CurriculoStore>();
  late final Future<void> _future;

  @override
  void initState() {
    _future = Future.wait([_store.init()]);

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
    return SizedBox(
      height: MediaQuery.of(context).size.height -
          (kToolbarHeight + kBottomNavigationBarHeight),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          textWidget('Escolha o tema',
              fontWeight: FontWeight.bold, fontSize: 3.h),
          textWidget(
            'Escolha o tema e automaticamente iremos criar para você',
            fontSize: 2.5.h,
            autoSize: false,
            maxLines: 10,
            textAlign: TextAlign.center,
            color: Colors.grey[700],
          ),
          DividerWidget(height: 10.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _verticalBanner('assets/images/banners/duckbill.png', ''),
                SizedBox(width: 2.w),
                _verticalBanner(
                  'assets/images/banners/fastmassagem.png',
                  'https://www.instagram.com/fastmassagem_/',
                ),
                SizedBox(width: 2.w),
                _verticalBanner(
                  'assets/images/banners/fastmassagem.png',
                  'https://www.instagram.com/fastmassagem_/',
                ),
              ],
            ),
          ),
          DividerWidget(height: 10.h),
          ButtonWidget.filled(
            onPressed: () {
              // Modular.to.pushNamed('/curriculo/curriculos-modelos');
            },
            title: 'Criar',
            textColor: white,
            backgroundColor: focus,
          )
        ],
      ),
    );
  }

  Widget _verticalBanner(String imgPath, String route) {
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          launchUrlString(route);
        },
        child: Image.asset(imgPath),
      ),
    );
  }
}
