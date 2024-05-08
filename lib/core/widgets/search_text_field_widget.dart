import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nova_task/core/resources/app_strings.dart';
import 'package:nova_task/core/resources/dimens.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({super.key, this.controller, this.onChange});
  final TextEditingController? controller;
  final Function(String? value)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(Dimens.medium),
        filled: true,
        fillColor: const Color(0xFFF6F6F6),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(Dimens.small),
          child: SvgPicture.asset("assets/svgs/IconlyCurvedSearch.svg"),
        ),
        hintText: AppStrings.searchTaskHint,
        hintStyle: context.textTheme.bodyMedium!.apply(color: const Color(0xFFC8CDD9) ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(Dimens.medium.r)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(Dimens.medium.r)
        )
      ),
    );
  }
}
