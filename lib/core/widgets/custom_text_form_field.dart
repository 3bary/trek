import 'package:flutter/material.dart';
import 'package:greendo/core/utils/constants.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.icon,
    required this.hintText,
    this.validator,
    this.onChanged,
    required this.obscureText,
    this.suffixIcon,
    required this.textInputType,
    required this.textEditingController,
  });
  final IconData icon;
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType textInputType;

  final TextEditingController textEditingController;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      validator: widget.validator,
      obscureText: widget.obscureText,
      keyboardType: widget.textInputType,
      controller: widget.textEditingController,
      style: const TextStyle(
        color: kTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      cursorColor: const Color(0xff879EA4),
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        focusedErrorBorder: buildOutlineInputBorder(),
        errorBorder: buildOutlineInputBorder(),
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Color(0xff879EA4)),
        prefixIcon: Icon(widget.icon, color: const Color(0xff96A7AF)),
        suffixIcon: widget.suffixIcon,
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: kSecondaryColor),
      borderRadius: BorderRadius.circular(4.0),
    );
  }
}
