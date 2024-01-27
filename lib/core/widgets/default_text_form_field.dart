import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  DefaultTextFormField({
    super.key,
    required this.controller,
    this.color = const Color(0xFFF5F8FA),
    this.onSave,
    this.onChange,
    this.validator,
    this.prefixIcon,
    this.hintText,
    this.obscureText = false,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final Color color;

  dynamic onSave;
  dynamic onChange;

  dynamic validator;

  dynamic prefixIcon;
  dynamic suffixIcon;

  String? hintText;

  dynamic textInputType;

  bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Color(0xFF52734D),
          ),
        ),
        // disabledBorder: OutlineInputBorder(
        //
        // ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Color(0xffEDEEF1),
            width: 2.0,
          ),
        ),
        fillColor: color,
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
      ),
      onSaved: onSave,
      onChanged: onChange,
      validator: validator,
    );
  }
}
