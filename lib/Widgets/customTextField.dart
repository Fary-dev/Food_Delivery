
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  late final Widget? suffixIcon;
  late final Widget? prefixIcon;
  late final String? lable;
  late final Function(String?)? onChange;
  late final Function(String?)? onSave;
  late final FormFieldValidator<String>? validator;
  late final bool autoFocus;
  late final bool? obscureText;
  late final TextEditingController controller;
  late final List<TextInputFormatter>? inputFormatters;
  late final TextInputType?textInputType;

  CustomTextField({
    this.prefixIcon,
    this.suffixIcon,
    required this.lable,
    this.validator,
    required this.controller,
    this.autoFocus = false,
    this.onChange,
    this.onSave,
    this.obscureText=false,
    this.inputFormatters,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: this.textInputType,
      inputFormatters:this.inputFormatters,
      controller: this.controller,
      style:
          Theme.of(context).primaryTextTheme.headline3!.apply(fontSizeDelta: 2),
      obscureText: this.obscureText!,
      validator: this.validator,
      onSaved: this.onSave,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: this.lable,
        suffixIcon: this.suffixIcon,
        prefixIcon: this.prefixIcon,
      ),
    );
  }
}
