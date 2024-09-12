import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../text_widget.dart';
import 'divider_widget.dart';
import 'models/dropdown.model.dart';

class DropdownWidget extends StatefulWidget {
  final List<DropDownModel> list;
  final String text;
  final Color? textColor;
  final Function(String) onChanged;
  final String? error;
  final String? initValue;
  final bool? enable;
  const DropdownWidget(
      {super.key,
      required this.list,
      required this.text,
      required this.onChanged,
      this.textColor,
      this.initValue,
      this.enable = true,
      this.error});

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  late DropDownModel? dropdownValue;
  late List<DropDownModel> list;
  @override
  void initState() {
    super.initState();
    var listSet = widget.list.toSet();
    list = listSet.toList();
    if (list.isNotEmpty) {
      var initValue = list.first;
      if (widget.initValue != null) {
        var isContem = list.where(
            (e) => e.key.toLowerCase() == widget.initValue!.toLowerCase());
        if (isContem.isNotEmpty) {
          initValue = isContem.first;
        }
        dropdownValue = initValue;
      } else {
        var firstIsSelection = list.where((element) => element.key == '');
        if (firstIsSelection.isEmpty) {
          var init = DropDownModel(value: 'Todos', key: '');
          list.insert(0, init);
          dropdownValue = init;
        } else {
          dropdownValue = list.first;
        }
      }
    } else {
      dropdownValue = DropDownModel(value: 'Todos', key: '');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) return Container();
    return SizedBox(
        width: 90.w,
        child: Column(
          children: [
            widget.textColor != null
                ? Container(
                    alignment: Alignment.centerLeft,
                    child: textWidget(widget.text, color: widget.textColor))
                : Container(
                    alignment: Alignment.centerLeft,
                    child: textWidget(widget.text,
                        fontSize: 16.sp, fontWeight: FontWeight.bold)),
            const DividerWidget(),
            DropdownButtonFormField(
                disabledHint:
                    widget.enable == false ? null : textWidget(widget.text),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(style: BorderStyle.solid, width: 0.7),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(style: BorderStyle.solid, width: 0.7),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(style: BorderStyle.solid, width: 0.7),
                  ),
                  filled: false,
                ),
                validator: (value) =>
                    value == null ? 'Campo obrigatório' : null,
                value: dropdownValue,
                onChanged: (DropDownModel? newValue) {
                  if (newValue != null) {
                    widget.onChanged.call(newValue.key);
                  }
                },
                items: list.map<DropdownMenuItem<DropDownModel>>(
                    (DropDownModel value) {
                  return DropdownMenuItem<DropDownModel>(
                    value: value,
                    child: textWidget(toBeginningOfSentenceCase(value.value)),
                  );
                }).toList()),
          ],
        ));
  }
}
