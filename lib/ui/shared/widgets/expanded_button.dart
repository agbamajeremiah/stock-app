import 'package:flutter/material.dart';
import 'package:stock/ui/shared/styles/colors.dart';
import 'package:stock/ui/shared/styles/fonts.dart';
import 'package:stock/ui/shared/widgets/loader.dart';

class ExpandedButton extends StatelessWidget {
  const ExpandedButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.fontSize,
    this.height,
    this.backgroundColor = AppColors.primaryColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.disabled = false,
    this.busy = false,
  }) : super(key: key);
  final Function? onPressed;
  final String text;
  final double? fontSize;
  final double? height;
  final Color backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? borderRadius;
  final bool disabled;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : onPressed as void Function()?,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: height ?? 52,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: disabled || busy
              ? backgroundColor.withOpacity(0.5)
              : backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          border: Border.all(
            width: 3,
            color: borderColor ?? Colors.transparent,
          ),
        ),
        child: !busy
            ? BodyText(
                text,
                color: textColor ?? AppColors.white,
              )
            : const AppLoader(),
      ),
    );
  }
}
