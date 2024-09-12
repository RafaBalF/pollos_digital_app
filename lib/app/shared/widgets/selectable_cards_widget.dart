import 'package:flutter/material.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/interfaces/selectable_card.interface.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectableCardsWidget<T> extends StatefulWidget {
  final double height;
  final List<SelectableCard<T>> items;
  final bool multiple;

  const SelectableCardsWidget({
    super.key,
    required this.height,
    required this.items,
    this.multiple = true,
  });

  @override
  State<SelectableCardsWidget<T>> createState() =>
      _SelectableCardsWidgetState<T>();
}

class _SelectableCardsWidgetState<T> extends State<SelectableCardsWidget<T>> {
  final ScrollController scrollController = ScrollController();

  bool canSelectAnother = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: 100.w,
      color: grey,
      child: RawScrollbar(
        thumbColor: primary,
        trackColor: grey,
        trackBorderColor: grey,
        thumbVisibility: true,
        thickness: 10.sp,
        minThumbLength: 5.h,
        controller: scrollController,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 2.w,
              runSpacing: 1.h,
              children: widget.items.map((v) => _selectableCard(v)).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _selectableCard(SelectableCard<T> v) {
    late Color borderColor;
    late Color bgColor;
    late Color textColor;

    if (v.selected) {
      borderColor = primary;
      bgColor = primary;
      textColor = white;
    } else {
      borderColor = grey;
      bgColor = background;
      textColor = darkGrey;
    }

    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: borderColor),
          color: bgColor,
        ),
        padding: EdgeInsets.symmetric(horizontal: 7.5.w, vertical: 1.h),
        child: textWidget(
          v.label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: textColor,
            height: 1.2,
          ),
        ),
      ),
      onTap: () {
        if (!v.selected && v.onSelect != null) {
          v.onSelect!();
        } else if (v.selected && v.onUnselect != null) {
          v.onUnselect!();
        }

        if (!widget.multiple) {
          widget.items.where((i) => i != v).forEach((j) => j.selected = false);
        }

        setState(() {
          v.selected = !v.selected;
        });
      },
    );
  }
}
