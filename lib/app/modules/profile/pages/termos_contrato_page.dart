import 'package:flutter/material.dart';
import 'package:pollos_digital/app/models/contrato.model.dart';
import 'package:pollos_digital/app/shared/widgets/webview_widget.dart';

class TermosContratoPage extends StatefulWidget {
  final ContratoModel contrato;
  const TermosContratoPage({super.key, required this.contrato});
  @override
  TermosContratoPageState createState() => TermosContratoPageState();
}

class TermosContratoPageState extends State<TermosContratoPage> {
  @override
  Widget build(BuildContext context) {
    final url = widget.contrato.linkTermoCiencia!.replaceFirst("http", "https");
    return WebviewWidget(
      url: url,
      title: "Contrato #${widget.contrato.codigoComanda}",
    );
  }
}
