import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stock/ui/shared/styles/colors.dart';
import 'package:stock/ui/shared/styles/fonts.dart';

class InputTextField extends StatelessWidget {
  final String label;
  final String errorText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  const InputTextField({
    Key? key,
    required this.label,
    required this.errorText,
    required this.controller,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          style: const InputTextStyle(),
          cursorColor: AppColors.textColor,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const LabelTextStyle(),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.textColor),
            ),
          ),
        ),
        const Gap(5),
        SmallText(errorText, color: AppColors.red),
      ],
    );
  }
}
