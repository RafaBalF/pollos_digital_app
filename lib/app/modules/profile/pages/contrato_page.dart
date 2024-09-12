import 'package:flutter/material.dart';
import 'package:pollos_digital/app/models/contrato.model.dart';
import 'package:pollos_digital/app/shared/widgets/webview_widget.dart';

class ContratoPage extends StatefulWidget {
  final ContratoModel contrato;
  const ContratoPage({super.key, required this.contrato});
  @override
  ContratoPageState createState() => ContratoPageState();
}

class ContratoPageState extends State<ContratoPage> {
  @override
  Widget build(BuildContext context) {
    final url = widget.contrato.linkContrato!.replaceFirst("http", "https");
    return WebviewWidget(
      url: url,
      title: "Contrato #${widget.contrato.codigoComanda}",
    );
  }
}
