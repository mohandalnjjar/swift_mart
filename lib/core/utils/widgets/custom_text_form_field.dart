import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    required this.hint,
    this.prefixIcon,
    this.keyBordType,
    this.onSaved,
    this.validator,
    this.controller,
    this.onFieldSubmitted,
    this.focusNode,
    this.onChanged,
    this.suffixIcon,
  });

  final String hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final void Function(String)? onChanged;
  final TextInputType? keyBordType;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      onChanged: onChanged,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      keyboardType: keyBordType,
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(13),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(100),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
