import 'package:flutter/material.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BooleanChoiceWidget extends StatelessWidget {
  final String title;
  final bool? item;
  final Function()? onTrue;
  final Function()? onFalse;

  const BooleanChoiceWidget({
    super.key,
    required this.title,
    required this.item,
    required this.onTrue,
    required this.onFalse,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 10.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget(title, style: h2()),
          DividerWidget(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _selectableCard(true, "SIM", onTrue),
              _selectableCard(false, "NÃO", onFalse),
            ],
          ),
        ],
      ),
    );
  }

  Widget _selectableCard(bool b, String title, Function()? onTap) {
    late Color borderColor;
    late Color bgColor;
    late Color textColor;

    if (b == item) {
      borderColor = primary;
      bgColor = primary;
      textColor = white;
    } else {
      borderColor = grey;
      bgColor = background;
      textColor = darkGrey;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 4.h,
        width: 40.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: borderColor),
          color: bgColor,
        ),
        padding: EdgeInsets.symmetric(horizontal: 7.5.w),
        child: Center(
          child: textWidget(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: textColor,
              height: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
