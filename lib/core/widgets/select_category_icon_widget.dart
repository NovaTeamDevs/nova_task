import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nova_task/core/resources/dimens.dart';

class SelectCategoryIconWidget extends StatelessWidget {
  const SelectCategoryIconWidget({
    super.key, required this.onTap, required this.selected, required this.iconPath,
  });
  final VoidCallback onTap;
  final bool selected;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: 750.milliseconds,
        decoration: BoxDecoration(
            color: selected? context.theme.colorScheme.primary : Colors.transparent,
            shape: BoxShape.circle
        ),
        child: Padding(
          padding: const EdgeInsets.all(Dimens.small),
          child: SvgPicture.asset(
            iconPath,
            colorFilter: ColorFilter.mode(
                selected? Colors.white : Colors.black,
                BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}