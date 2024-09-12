import 'package:flutter/material.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_widget.dart';

class PasswordInputWidget extends StatefulWidget {
  final String? label;
  final Color? labelColor;
  final Function(String)? onChanged;
  final String? error;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const PasswordInputWidget(
      {super.key,
      this.label,
      this.labelColor,
      required this.onChanged,
      this.error,
      this.validator,
      this.controller});

  @override
  State<PasswordInputWidget> createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<PasswordInputWidget> {
  bool visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return InputWidget(
      label: widget.label ?? 'Senha',
      labelColor: widget.labelColor,
      onChanged: widget.onChanged,
      obscureText: !visiblePassword,
      suffixIcon: GestureDetector(
        onTap: () => {
          setState(() {
            visiblePassword = !visiblePassword;
          })
        },
        child: Icon(
          visiblePassword
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: darkGrey,
          size: 24,
        ),
      ),
      error: widget.error,
      validator: widget.validator,
      controller: widget.controller,
    );
  }
}
