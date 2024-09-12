import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CustomFutureBuilderWidget extends StatefulWidget {
  final Future<dynamic>? future;
  final Widget finalWidget;
  final Widget loadingWidget;
  const CustomFutureBuilderWidget({
    super.key,
    required this.future,
    required this.finalWidget,
    required this.loadingWidget,
  });

  @override
  State<CustomFutureBuilderWidget> createState() =>
      _CustomFutureBuilderWidgetState();
}

class _CustomFutureBuilderWidgetState extends State<CustomFutureBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return Observer(builder: (_) {
            return widget.finalWidget;
          });
        } else {
          return widget.loadingWidget;
        }
      },
    );
  }
}
