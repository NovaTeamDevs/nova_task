import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/dimens.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key, this.controller, this.label, this.validator, this.maxLength,this.readOnly = false, this.onChange});
  final TextEditingController? controller;
  final String? label;
  final bool readOnly;
  final String? Function(String? value)? validator;
  final int? maxLength;
  final Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      validator: validator,
      maxLength: maxLength,
      onChanged: onChange,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(Dimens.small),
        labelText: label,
        labelStyle: context.textTheme.bodySmall
      ),
    );
  }
}
