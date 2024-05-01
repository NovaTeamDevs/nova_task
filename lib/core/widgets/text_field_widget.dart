import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/dimens.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key, this.controller, this.label, this.validator, this.maxLength});
  final TextEditingController? controller;
  final String? label;
  final String? Function(String? value)? validator;
  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLength: maxLength,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(Dimens.small),
        labelText: label,
        labelStyle: context.textTheme.bodySmall
      ),
    );
  }
}
