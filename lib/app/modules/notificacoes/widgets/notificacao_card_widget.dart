import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pollos_digital/app/models/notificacao.model.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/modal_bottom_sheet.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificacaoCard extends StatefulWidget {
  final NotificacaoModel notificacao;
  final Function(NotificacaoModel notificacao) onClick;

  const NotificacaoCard({
    super.key,
    required this.notificacao,
    required this.onClick,
  });

  @override
  State<NotificacaoCard> createState() => _NotificacaoCardState();
}

class _NotificacaoCardState extends State<NotificacaoCard> {
  @override
  Widget build(BuildContext context) {
    Icon icon = Icon(
      Icons.notifications_active,
      color: primary,
      size: 24.sp,
    );

    if (widget.notificacao.lido!) {
      icon = Icon(
        Icons.notifications_none,
        color: darkGrey,
        size: 24.sp,
      );
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child: GestureDetector(
        onTap: () {
          widget.onClick.call(widget.notificacao);
          _detalhes(context, widget.notificacao);
        },
        child: Container(
          width: 100.w,
          height: 9.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: const Border(
              bottom: BorderSide(width: 1.5, color: grey),
              left: BorderSide(width: 0.5, color: grey),
              right: BorderSide(width: 0.5, color: grey),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 1.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 75.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWidget(
                      widget.notificacao.tituloNotificacao,
                      style: medium(color: primary),
                      maxLines: 1,
                    ),
                    DividerWidget(height: 0.5.h),
                    textWidget(
                      widget.notificacao.mensagemNotificacao,
                      style: small(),
                      maxLines: 2,
                      autoSize: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              icon,
            ],
          ),
        ),
      ),
    );
  }

  void _detalhes(BuildContext context, NotificacaoModel n) {
    final titulo = n.tituloNotificacao ?? "Notificação";

    showCustomBottomSheet(
      context,
      titulo,
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          children: [
            textWidget(
              widget.notificacao.mensagemNotificacao,
              style: label(),
              maxLines: 100,
              autoSize: false,
              overflow: TextOverflow.ellipsis,
            ),
            DividerWidget(height: 2.5.h),
            ButtonWidget.filled(onPressed: Modular.to.pop, title: "FECHAR")
          ],
        ),
      ),
    );
  }
}
