import 'package:pollos_digital/app/models/base.model.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future showCustomBottomSheet(
  BuildContext context,
  String header,
  Widget widget, {
  bool dismissable = true,
  void Function()? onClose,
}) {
  return showModalBottomSheet(
      isDismissible: dismissable,
      enableDrag: dismissable,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Wrap(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(header, style: modalHeader(color: black)),
                  IconButton(
                    onPressed: onClose ??
                        () {
                          Modular.to.pop();
                        },
                    icon: const Icon(
                      Icons.close,
                      color: primary,
                      size: 32,
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: widget,
            ),
            DividerWidget(height: 5.h),
          ],
        );
      });
}

Future showErrorBottomSheet(
  BuildContext context, {
  String message = 'Ocorreu um erro ao executar a ação',
  String details = '',
  String btnTitle = 'OK',
  Function()? onPressed,
  bool dismissable = true,
  void Function()? onClose,
}) {
  Widget widget = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      DividerWidget(height: 5.h),
      Image.asset('assets/icons/error.png'),
      DividerWidget(height: 5.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: textWidget(
          message,
          style: modalHeader(),
          textAlign: TextAlign.center,
          maxLines: 5,
        ),
      ),
      DividerWidget(height: 5.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: textWidget(
          details,
          style: modalDetails(color: darkerGrey),
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
      ),
      DividerWidget(height: 5.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: ButtonWidget.filled(
          title: btnTitle,
          onPressed: onPressed ??
              () {
                Modular.to.pop();
              },
          backgroundColor: primary,
          textColor: white,
        ),
      )
    ],
  );

  return showCustomBottomSheet(
    context,
    'ERRO',
    widget,
    dismissable: dismissable,
    onClose: onClose,
  );
}

Future showSuccessBottomSheet(
  BuildContext context, {
  String message = 'Ação realizada com sucesso',
  String details = '',
  String btnTitle = 'OK',
  Function()? onPressed,
  bool dismissable = true,
  void Function()? onClose,
}) {
  Widget widget = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      DividerWidget(height: 5.h),
      Image.asset('assets/icons/success.png'),
      DividerWidget(height: 5.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: textWidget(
          message,
          style: modalHeader(),
          textAlign: TextAlign.center,
          maxLines: 5,
        ),
      ),
      DividerWidget(height: 5.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: textWidget(
          details,
          style: modalDetails(color: darkerGrey),
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
      ),
      DividerWidget(height: 5.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: ButtonWidget.filled(
          title: btnTitle,
          onPressed: onPressed ??
              () {
                Modular.to.pop();
              },
          backgroundColor: primary,
          textColor: white,
        ),
      )
    ],
  );

  return showCustomBottomSheet(
    context,
    'SUCESSO',
    widget,
    dismissable: dismissable,
    onClose: onClose,
  );
}

Future showBaseModalBottomSheet(
  BuildContext context,
  BaseModel baseModel, {
  Function()? onSuccessPressed,
  Function()? onErrorPressed,
  bool dismissable = true,
  void Function()? onClose,
}) {
  if (baseModel.success) {
    return showSuccessBottomSheet(
      context,
      message: baseModel.message,
      onPressed: onSuccessPressed,
      dismissable: dismissable,
      onClose: onClose,
    );
  }

  return showErrorBottomSheet(
    context,
    message: baseModel.message,
    onPressed: onErrorPressed,
    dismissable: dismissable,
    onClose: onClose,
  );
}
