import 'package:flutter/material.dart';
import 'package:nova_task/core/resources/app_strings.dart';

class ListHeaderWidget extends StatelessWidget {
  const ListHeaderWidget({
    super.key, required this.title, required this.onPress,
  });
  final String title;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        const Spacer(),
        TextButton(onPressed: onPress, child: const Text(AppStrings.viewAll))
      ],
    );
  }
}

