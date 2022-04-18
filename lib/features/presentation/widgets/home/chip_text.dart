import 'package:flutter/material.dart';
import 'package:restaurant_app/core/theme/my_colors.dart';

class ChipText extends StatelessWidget {
  const ChipText({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: MyColors.secondaryLight2)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(name, style: TextStyle(color: MyColors.secondary, fontSize: 12))
        ],
      ),
    );
  }
}
