import 'package:flutter/material.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TabHeaderWidget extends StatefulWidget {
  final String title;
  const TabHeaderWidget({super.key, required this.title});

  @override
  State<TabHeaderWidget> createState() => _TabHeaderWidgetState();
}

class _TabHeaderWidgetState extends State<TabHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: primary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.title, style: headTitle()),
              ],
            ),
          ),
        ),
        //precisa existir pra alinhar o título no centro
        IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: white,
          ),
          onPressed: () {},
          focusColor: white,
          hoverColor: white,
          color: white,
        ),
      ],
    );
  }
}
