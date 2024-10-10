import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/modules/projeto/projeto_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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
    return SizedBox(
      height: 100.h - (kToolbarHeight + 40),
      width: 100.w,
      child: _store.loadingStore.isLoading
          ? Center(child: _loadingBody())
          : _store.listaProjetos.isNotEmpty
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: _store.listaProjetos.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            textWidget(_store.listaProjetos[index].nomeProjeto),
                            SizedBox(
                              width: 100.w,
                              child: ElevatedButton(
                                onPressed: () {
                                  launchUrlString(
                                      _store.listaProjetos[index].url);
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10), // <-- Radius
                                  ),
                                  foregroundColor: Colors.white,
                                  backgroundColor: primary,
                                ),
                                child:
                                    textWidget('ACESSAR', color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              width: 100.w,
                              child: OutlinedButton(
                                onPressed: () {
                                  Modular.to
                                      .pushNamed('/projeto/dados-resultados');
                                },
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: primary),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10), // <-- Radius
                                  ),
                                  foregroundColor: primary,
                                  backgroundColor: Colors.white,
                                ),
                                child: textWidget('Editar', color: primary),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _store.excluirProjeto(
                                    _store.listaProjetos[index].id);
                              },
                              child: textWidget("apagar página",
                                  color: primary,
                                  style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor: primary,
                                      color: primary,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
              : Center(child: textWidget('Nenhum projeto criado')),
    );
  }
}
