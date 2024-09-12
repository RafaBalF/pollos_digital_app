import 'package:flutter/material.dart';
import 'package:pollos_digital/app/shared/colors.dart';

class CheckboxWidget extends StatefulWidget {
  final bool value;
  final Function(bool?)? onChanged;
  const CheckboxWidget({
    super.key,
    required this.value,
    this.onChanged,
  });

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.0,
      width: 24.0,
      child: Checkbox(
        value: widget.value,
        activeColor: primary,
        onChanged: widget.onChanged,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        side: const BorderSide(
          width: 1,
          color: black,
        ),
      ),
    );
  }
}
