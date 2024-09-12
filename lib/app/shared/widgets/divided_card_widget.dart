import 'package:flutter/material.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DividedCardWidget extends StatelessWidget {
  final String header;
  final Widget content;
  const DividedCardWidget({
    super.key,
    required this.header,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: darkGrey,
            blurRadius: 5,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Container(
            height: 5.h,
            width: 100.w,
            decoration: const BoxDecoration(
              color: backgroundSecondary,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
              child: textWidget(
                header,
                style: headTitle(),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Container(
            width: 100.w,
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
            decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            child: content,
          ),
        ],
      ),
    );
  }
}
