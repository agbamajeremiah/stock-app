import 'package:flutter/material.dart';
import 'package:stock/ui/views/shared/styles/colors.dart';

/// Base text with black color and letter spacing set
class StockTextBase extends StatelessWidget {
  const StockTextBase(
    this.text, {
    Key? key,
    this.style,
    this.textAlign,
    this.overflow = TextOverflow.visible,
    this.maxLines,
  }) : super(key: key);
  final String? text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    assert(text != null);
    return Text(
      text ?? '',
      style: const TextStyle(
        fontSize: 16,
        color: AppColors.textColor,
      ).merge(style),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}

/// Main black bold text
class StockTextBold extends StockTextBase {
  StockTextBold(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
  }) : super(
          text,
          key: key,
          style: const TextStyle(
            fontFamily: 'SF-Pro-Display',
            fontSize: 20,
          ).merge(style),
          textAlign: textAlign,
          overflow: overflow,
          maxLines: maxLines,
        );
}

/// Semi-bold text
class StockTextSemiBold extends StockTextBase {
  StockTextSemiBold(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
  }) : super(
          text,
          key: key,
          style: const TextStyle(
            fontFamily: 'SF-Pro-Display',
          ).merge(style),
          textAlign: textAlign,
          overflow: overflow,
          maxLines: maxLines,
        );
}

/// Medium text
class StockTextMedium extends StockTextBase {
  StockTextMedium(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
  }) : super(
          text,
          key: key,
          style: const TextStyle(
            fontFamily: 'SF-Pro-Display',
          ).merge(style),
          textAlign: textAlign,
          overflow: overflow,
          maxLines: maxLines,
        );
}

/// Medium text
class StockTextRegular extends StockTextBase {
  StockTextRegular(
    String? text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
  }) : super(
          text,
          key: key,
          style: const TextStyle(
            fontFamily: 'SF-Pro-Display',
          ).merge(style),
          textAlign: textAlign,
          overflow: overflow,
          maxLines: maxLines,
        );
}

class H1 extends StockTextBold {
  H1(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool noHeight = true,
  }) : super(
          text,
          key: key,
          overflow: overflow,
          maxLines: maxLines,
          style: const TextStyle(
            fontSize: 50,
            color: AppColors.textColor,
            fontWeight: FontWeight.w700,
          ).merge(style),
          textAlign: textAlign,
        );
}

class HeaderText extends StockTextBold {
  HeaderText(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    Color? color,
    int? maxLines,
    bool noHeight = true,
  }) : super(
          text,
          key: key,
          overflow: overflow,
          maxLines: maxLines,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ).merge(style),
          textAlign: textAlign,
        );
}

class SubHeaderText extends StockTextSemiBold {
  SubHeaderText(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Color? color,
    bool noHeight = true,
  }) : super(
          text,
          key: key,
          overflow: overflow,
          maxLines: maxLines,
          style: TextStyle(
            fontSize: 18,
            color: color ?? AppColors.textColor,
            fontWeight: FontWeight.w600,
          ).merge(style),
          textAlign: textAlign,
        );
}

class BodyText extends StockTextRegular {
  BodyText(
    String? text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Color? color,
    double? fonSize,
    bool noHeight = true,
  }) : super(
          text,
          key: key,
          overflow: overflow,
          maxLines: maxLines,
          style: TextStyle(
            fontSize: fonSize ?? 14,
            color: color ?? AppColors.textColor,
            fontWeight: FontWeight.w400,
          ).merge(style),
          textAlign: textAlign,
        );
}

class SmallText extends StockTextRegular {
  SmallText(
    String? text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    Color? color,
    double? fontSize,
    int? maxLines,
    bool noHeight = true,
    FontWeight? fontWeight,
  }) : super(
          text,
          key: key,
          overflow: overflow,
          maxLines: maxLines,
          style: TextStyle(
            fontSize: fontSize ?? 12,
            color: color ?? AppColors.textColor,
            fontWeight: fontWeight ?? FontWeight.w400,
          ).merge(style),
          textAlign: textAlign,
        );
}

class TinyText extends StockTextRegular {
  TinyText(
    String? text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    Color? color,
    double? fontSize,
    int? maxLines,
    bool noHeight = true,
    FontWeight? fontWeight,
  }) : super(
          text,
          key: key,
          overflow: overflow,
          maxLines: maxLines,
          style: TextStyle(
            fontSize: fontSize ?? 10,
            color: color ?? AppColors.textColor,
            fontWeight: fontWeight ?? FontWeight.w400,
          ).merge(style),
          textAlign: textAlign,
        );
}

class CustomText extends StockTextSemiBold {
  CustomText(
    String text, {
    Key? key,
    TextStyle? style,
    double? fontSize,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Color? color,
    FontWeight? fontWeight,
    bool noHeight = true,
  }) : super(
          text,
          key: key,
          overflow: overflow,
          maxLines: maxLines,
          style: TextStyle(
            fontSize: fontSize ?? 16,
            color: color ?? AppColors.textColor,
            fontWeight: fontWeight ?? FontWeight.w500,
          ).merge(style),
          textAlign: textAlign,
        );
}

class InputTextStyle extends TextStyle {
  const InputTextStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) : super(
          fontFamily: 'SF-Pro-Display',
          fontSize: fontSize ?? 14,
          color: color ?? AppColors.textColor,
          fontWeight: fontWeight ?? FontWeight.w400,
        );
}

class LabelTextStyle extends TextStyle {
  const LabelTextStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) : super(
          fontFamily: 'SF-Pro-Display',
          fontSize: fontSize ?? 14,
          color: color ?? AppColors.grey,
          fontWeight: fontWeight ?? FontWeight.w400,
        );
}

class HintTextStyle extends TextStyle {
  const HintTextStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) : super(
          fontFamily: 'SF-Pro-Display',
          fontSize: fontSize ?? 14,
          color: color ?? AppColors.grey,
          fontWeight: fontWeight ?? FontWeight.w300,
        );
}

class TextSpanStyle extends TextStyle {
  const TextSpanStyle({
    Color? color,
    double? fontSize,
  }) : super(
          fontFamily: 'SF-Pro-Display',
          fontSize: fontSize ?? 12,
          color: color ?? AppColors.textColor,
          fontWeight: FontWeight.w400,
        );
}
