import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String hint;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  const CustomTextFieldWidget({
    super.key,
    required this.hint,
    this.textEditingController,
    required this.keyboardType,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      controller: textEditingController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        contentPadding: const EdgeInsets.only(left: 10, bottom: 0),
      ),
    );
  }
}
