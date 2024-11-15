import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pollos_digital/app/modules/projeto/projeto_store.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InputLocalidadeWidget extends StatefulWidget {
  final ProjetoStore store;

  const InputLocalidadeWidget({super.key, required this.store});

  @override
  State<InputLocalidadeWidget> createState() => _InputLocalidadeWidgetState();
}

class _InputLocalidadeWidgetState extends State<InputLocalidadeWidget> {
  // final ValueNotifier<ObservableList?> _atividadesNotifier =
  //     ValueNotifier<ObservableList?>(null);

  // Controlador de texto para o campo de cidade
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _estadoController = TextEditingController();

  // Variável para controlar se o usuário clicou no campo de cidade antes de selecionar o estado
  bool _clicouNaCidadeSemEstado = false;

  // Função de pesquisa para o TypeAhead
  List<String> _filtrarCidades(String pesquisa) {
    return widget.store.cidadesPorEstado
        .where((cidade) =>
            cidade.cidade!.toLowerCase().contains(pesquisa.toLowerCase()))
        .map((cidade) => cidade.cidade!) // Mapear para String
        .toList();
  }

  List<String> _filtrarEstados(String pesquisa) {
    return widget.store.estados
        .where((cidade) =>
            cidade.estado!.toLowerCase().contains(pesquisa.toLowerCase()))
        .map((cidade) => cidade.estado!) // Mapear para String
        .toList();
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWidget(
              'Estado',
              style: label(color: black),
            ),
            SizedBox(height: 1.h),
            TypeAheadFormField<String>(
              textFieldConfiguration: TextFieldConfiguration(
                style: TextStyle(
                  fontSize:
                      17.sp, // Aplica o tamanho de fonte com base no widget
                  color: darkGrey, // Aplica a cor desejada
                  height: 1, // Aplica a altura da linha (espessura da linha)
                ),
                controller: _estadoController, // Usando o controlador de texto
                decoration: InputDecoration(
                  hintText: 'Digite o nome do estado',
                  hintStyle: TextStyle(
                    fontSize:
                        17.sp, // Aplica o tamanho de fonte com base no widget
                    color: darkGrey, // Aplica a cor desejada
                    height: 1, // Aplica a altura da linha (espessura da linha)
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
              ),
              suggestionsCallback: (pattern) {
                // Filtra as cidades com base no texto inserido
                return _filtrarEstados(
                    pattern); // Não permite a pesquisa de cidades se o estado não foi selecionado
              },
              itemBuilder: (context, estado) {
                return ListTile(
                  title: Text(estado),
                );
              },
              onSuggestionSelected: (novoEstado) {
                widget.store.setEstado(novoEstado);
                _estadoController.text = novoEstado;
                widget.store.carregarCidades(novoEstado);
                widget.store.setCidade(null);
                _cidadeController.clear(); // Limpa o campo de cidade
                _clicouNaCidadeSemEstado = false;
              },
              noItemsFoundBuilder: (context) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Nenhum estado encontrado',
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              },
            ),
            // Container(
            //   decoration: BoxDecoration(
            //     border: Border.all(color: Colors.grey, width: 1), // Borda
            //     borderRadius: BorderRadius.circular(8), // Bordas arredondadas
            //   ),
            //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //   child: DropdownButton<String>(
            //     value: widget.store.estadoSelecionado,
            //     hint: const Text('Selecione o Estado'),
            //     isExpanded: true,
            //     onChanged: (novoEstado) {
            //       widget.store.setEstado(novoEstado);
            //       widget.store.carregarCidades(novoEstado);
            //       widget.store.setCidade(null);
            //       _cidadeController.clear(); // Limpa o campo de cidade
            //       _clicouNaCidadeSemEstado =
            //           false; // Restaura o clique na cidade
            //       // setState(() {
            //       //   _estadoSelecionado = novoEstado;
            //       //   _cidadeSelecionada =
            //       //       null; // Limpa a cidade ao mudar o estado
            //       //   _cidadeController.clear(); // Limpa o campo de cidade
            //       //   _clicouNaCidadeSemEstado =
            //       //       false; // Restaura o clique na cidade
            //       // });
            //     },
            //     items: widget.store.estados.map((estado) {
            //       return DropdownMenuItem<String>(
            //         value: estado.estado,
            //         child: Text(estado.estado.toString()),
            //       );
            //     }).toList(),
            //     underline: const SizedBox(),
            //     style: TextStyle(
            //       fontSize:
            //           17.sp, // Aplica o tamanho de fonte com base no widget
            //       color: darkGrey, // Aplica a cor desejada
            //       height: 1, // Aplica a altura da linha (espessura da linha)
            //     ),
            //   ),
            // ),
            DividerWidget(height: 2.h),
            textWidget(
              'Cidade',
              style: label(color: black),
            ),
            SizedBox(height: 1.h),
            TypeAheadFormField<String>(
              textFieldConfiguration: TextFieldConfiguration(
                style: TextStyle(
                  fontSize:
                      17.sp, // Aplica o tamanho de fonte com base no widget
                  color: darkGrey, // Aplica a cor desejada
                  height: 1, // Aplica a altura da linha (espessura da linha)
                ),
                controller: _cidadeController, // Usando o controlador de texto
                decoration: InputDecoration(
                  hintText: 'Digite o nome da cidade',
                  hintStyle: TextStyle(
                    fontSize:
                        17.sp, // Aplica o tamanho de fonte com base no widget
                    color: darkGrey, // Aplica a cor desejada
                    height: 1, // Aplica a altura da linha (espessura da linha)
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  errorText: _clicouNaCidadeSemEstado
                      ? 'Selecione um estado antes de escolher a cidade'
                      : null,
                ),
                onTap: () {
                  // Marcar como clicado na cidade sem estado
                  if (widget.store.estadoSelecionado == null) {
                    setState(() {
                      _clicouNaCidadeSemEstado = true;
                    });
                  }
                },
              ),
              suggestionsCallback: (pattern) {
                // Filtra as cidades com base no texto inserido
                return widget.store.estadoSelecionado != null
                    ? _filtrarCidades(pattern)
                    : []; // Não permite a pesquisa de cidades se o estado não foi selecionado
              },
              itemBuilder: (context, cidade) {
                return ListTile(
                  title: Text(cidade),
                );
              },
              onSuggestionSelected: (cidade) {
                widget.store.setCidade(cidade);
                _cidadeController.text = cidade;
                _clicouNaCidadeSemEstado = false;
              },
              noItemsFoundBuilder: (context) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Nenhuma cidade encontrada',
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
