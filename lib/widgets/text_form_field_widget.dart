import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTextField extends StatelessWidget {
  final String? text;
  final TextEditingController controller;
  final bool? readOnly;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final String labelText;
  final bool? inputFormatters;
  final IconData? prefixIcon;
  final bool? contentPadding;
  final IconData? suffixIcon;
  final Function()? onTap;
  const MyTextField(
      {super.key,
      this.text,
      required this.controller,
      this.readOnly,
      this.validator,
      this.textInputType,
      required this.labelText,
      this.inputFormatters = false,
      this.prefixIcon,
      this.contentPadding = false,
      this.suffixIcon,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text == null
            ? Container()
            : Text(
                text!,
                style: const TextStyle(
                  color: Color(0xFFB4A9A7),
                  fontFamily: "Pyidaungsu",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: textInputType ?? TextInputType.name,
          readOnly: readOnly ?? false,
          onTap: onTap,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            suffix: suffixIcon != null
                ? Icon(
                    suffixIcon,
                    color: Colors.grey,
                  )
                : null,
            errorStyle: const TextStyle(color: Colors.red),
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            hintText: labelText,
            contentPadding: contentPadding == true ? EdgeInsets.zero : const EdgeInsets.all(8),
            labelStyle: const TextStyle(
              color: Color(0xFFB4A9A7),
              fontFamily: "Noto Sans Myanmar ",
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder outlineInputBorderDesign() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Get.theme.colorScheme.primary,
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
