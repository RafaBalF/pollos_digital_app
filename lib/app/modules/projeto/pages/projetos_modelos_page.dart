import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/modules/projeto/projeto_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjetosModelosPage extends StatefulWidget {
  const ProjetosModelosPage({super.key});

  @override
  State<ProjetosModelosPage> createState() => _ProjetosModelosPageState();
}

class _ProjetosModelosPageState extends State<ProjetosModelosPage> {
  final ProjetoStore _store = Modular.get<ProjetoStore>();
  late final Future<void> _future;

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
        mainAxisSize: MainAxisSize.min,
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
          SizedBox(
            height: 35.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: _store.listaModelos.length,
              itemBuilder: (BuildContext context, int index) {
                return _verticalBanner(_store.listaModelos[index].imgUrl,
                    _store.listaModelos[index].selected, () {
                  _store.setModeloSelecionado(index);
                }, _store.listaModelos[index].status);
              },
            ),
          ),
          DividerWidget(height: 10.h),
          Visibility(
            visible: _store.buttonDisplayed,
            child: ButtonWidget.filled(
              onPressed: () {
                _store.criarProjeto();
                _store.buttonDisplayed = false;
              },
              title: 'Criar',
              textColor: white,
              backgroundColor: focus,
            ),
          ),
          Visibility(
            visible: !_store.buttonDisplayed,
            child: _store.loadingStore.isLoading
                ? const CircularProgressIndicator(
                    color: focus,
                  )
                : Column(
                    children: [
                      textWidget(
                          'Link para sua pagina: ${_store.createdPageUrl}'),
                      DividerWidget(height: 2.h),
                      ButtonWidget.filled(
                        onPressed: () {
                          launchUrlString(_store.createdPageUrl.toString());
                        },
                        title: 'Acessar',
                        textColor: white,
                        backgroundColor: focus,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {
                              _store.criarProjeto();
                            },
                            child: textWidget('Criar outro', color: focus),
                          ),
                          TextButton(
                            onPressed: () {
                              launchUrlString(
                                  'https://api.whatsapp.com/send/?phone=5516991996799&text=Quero+saber+mais&type=phone_number&app_absent=0');
                            },
                            child:
                                textWidget('Chamar no WhatsApp', color: focus),
                          ),
                        ],
                      )
                    ],
                  ),
          )
        ],
      ),
    );
  }

  Widget _verticalBanner(String imgPath, selected, func, active) {
    return GestureDetector(
      onTap: active == 'ativo' ? func : null,
      child: Container(
        height: 30.h,
        width: 40.w,
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imgPath),
            fit: BoxFit.contain,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(active == 'ativo' ? 1 : 0.4),
              BlendMode.dstATop,
            ),
          ),
          border: Border.all(
              width: selected ? 3 : 1, color: selected ? focus : Colors.grey),
        ),
        // child: Image.network(
        //   imgPath,
        //   alignment: Alignment.topCenter,
        //   fit: BoxFit.contain,
        // ),
      ),
    );
  }
}
