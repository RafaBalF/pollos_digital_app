import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/models/projeto.model.dart';
import 'package:pollos_digital/app/modules/projeto/projeto_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjetosCriadosPage extends StatefulWidget {
  const ProjetosCriadosPage({super.key});

  @override
  State<ProjetosCriadosPage> createState() => _ProjetosCriadosPageState();
}

class _ProjetosCriadosPageState extends State<ProjetosCriadosPage> {
  final ProjetoStore _store = Modular.get<ProjetoStore>();
  late final Future<void> _future;

  @override
  void initState() {
    _future = Future.wait([_store.initProjetosCriado()]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SimpleScaffoldWidget(
            title: 'Meus projetos',
            bodyPadding: EdgeInsets.all(2.w),
            body: Observer(
              builder: (_) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Observer(builder: (_) {
                    return _body();
                  });
                } else {
                  return _store.listaProjetos.isNotEmpty
                      ? Center(child: textWidget('Nenhum projeto criado'))
                      : _loadingBody();
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
    return SizedBox(
      height: 100.h - (kToolbarHeight + 40),
      width: 100.w,
      child: _store.loadingStore.isLoading
          ? Center(child: _loadingBody())
          : _store.listaProjetos.isNotEmpty
              ? ListView.builder(
                  // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  //     maxCrossAxisExtent: 200,
                  //     childAspectRatio: 1,
                  //     crossAxisSpacing: 20,
                  //     mainAxisSpacing: 20),
                  itemCount: _store.listaProjetos.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      width: 85.w,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 40.w,
                            padding: const EdgeInsets.only(left: 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                _store.listaProjetos[index].imagemModelo,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 50.w,
                            // height: 30.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 15, left: 15, top: 2, bottom: 2),
                                  child: textWidget(
                                      _store.listaProjetos[index].nome,
                                      textAlign: TextAlign.center,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp,
                                      maxLines: 1),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 15, left: 15, top: 10, bottom: 10),
                                  child: textWidget(
                                      _store.listaProjetos[index].descricao,
                                      textAlign: TextAlign.justify,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 500,
                                      maxLines: 2),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        textWidget('Link da página',
                                            fontSize: 12),
                                        Container(
                                          width: 30.w,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Center(
                                            child: textWidget(
                                                'https://site.pollosdigital.com.br/${_store.listaProjetos[index].urlAmigavel}',
                                                maxLines: 1,
                                                fontSize: 0),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: IconButton(
                                          onPressed: () async {
                                            await Clipboard.setData(ClipboardData(
                                                text:
                                                    'https://site.pollosdigital.com.br/${_store.listaProjetos[index].urlAmigavel}'));
                                            _showToast(context,
                                                'Link de acesso copiado!');
                                          },
                                          icon: const Icon(Icons.copy)),
                                    ),
                                  ],
                                ),
                                // DividerWidget(height: 2.h),
                                SizedBox(
                                  width: 42.w,
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      launchUrlString(
                                          'https://site.pollosdigital.com.br/${_store.listaProjetos[index].urlAmigavel}');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10), // <-- Radius
                                      ),
                                      foregroundColor: Colors.white,
                                      backgroundColor: Color(0xffcccccc),
                                    ),
                                    icon: const Icon(
                                      Icons.web,
                                      size: 20,
                                      color: Color(0xff333333),
                                    ),
                                    iconAlignment: IconAlignment.end,
                                    label: textWidget('ACESSAR',
                                        color: Color(0xff333333), fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  width: 42.w,
                                  child: ElevatedButton.icon(
                                    onPressed: () async {
                                      await Share.shareUri(Uri.parse(
                                          'https://site.pollosdigital.com.br/${_store.listaProjetos[index].urlAmigavel}'));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10), // <-- Radius
                                      ),
                                      foregroundColor: Colors.white,
                                      backgroundColor: Color(0xff42bb30),
                                    ),
                                    icon: const Icon(
                                      Icons.share,
                                      size: 15,
                                    ),
                                    iconAlignment: IconAlignment.end,
                                    label: textWidget('COMPARTILHAR',
                                        color: Colors.white, fontSize: 11),
                                  ),
                                ),
                                SizedBox(
                                  width: 60.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            var lista = _store.listaProjetos;
                                            _store.projetoModel = ProjetoModel(
                                              nome: lista[index].nome,
                                              urlAmigavel:
                                                  lista[index].urlAmigavel,
                                              descricao: lista[index].descricao,
                                              email: lista[index].email,
                                              linkContato:
                                                  lista[index].linkContato,
                                              linkImage: lista[index].linkImage,
                                              missao: lista[index].missao,
                                              visao: lista[index].visao,
                                              valores: lista[index].valores,
                                              telefone: lista[index].telefone,
                                              modelo: lista[index].modelo,
                                              usuarioId: lista[index].usuarioId,
                                              id: lista[index].id,
                                              habilidades:
                                                  lista[index].habilidades,
                                              extras: lista[index].extras,
                                              faq: lista[index].faq,
                                              card: lista[index].card,
                                              depoimentos:
                                                  lista[index].depoimentos,
                                            );
                                            Modular.to.pushNamed(
                                                '/projeto/dados-resultados');
                                          },
                                          icon: const Icon(Icons.edit_outlined,
                                              color: Color(0xff555555))),
                                      IconButton(
                                          onPressed: () {
                                            _store.excluirProjeto(
                                                _store.listaProjetos[index].id);
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Color(0xffc23b22),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  })
              : Center(child: textWidget('Nenhum projeto criado')),
    );
  }

  void _showToast(BuildContext context, message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: scaffold.hideCurrentSnackBar,
          textColor: white,
        ),
      ),
    );
  }
}
