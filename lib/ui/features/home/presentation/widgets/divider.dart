import 'package:flutter/material.dart';
import 'package:stock/ui/shared/styles/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      thickness: 1,
      color: AppColors.grey,
    );
  }
}
