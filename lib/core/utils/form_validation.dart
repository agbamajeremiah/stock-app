import 'package:flutter/material.dart';
import 'package:stock/ui/shared/styles/colors.dart';

class CustomFormValidation {
  static Color getColor(
    String? text,
    FocusNode focus,
    String? validationError,
  ) {
    if (focus.hasFocus && text == null) {
      return AppColors.red;
    } else if (focus.hasFocus &&
        text!.isEmpty &&
        validationError != null &&
        validationError.isNotEmpty) {
      return Colors.redAccent;
    } else if (focus.hasFocus &&
        text!.isNotEmpty &&
        validationError != null &&
        validationError.isEmpty) {
      return AppColors.primaryColor.withOpacity(0.28);
    } else if (text != null &&
        text.isNotEmpty &&
        validationError != null &&
        validationError.isEmpty) {
      return AppColors.primaryColor.withOpacity(0.28);
    } else if (validationError != null && validationError.isNotEmpty) {
      return AppColors.red;
    } else {
      return AppColors.accent;
    }
  }

  static String errorMessageEmail(
    String? text,
    String message,
  ) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (!text.contains('@') || !text.contains('.')) {
      return 'Please enter a vaild Email';
    } else {
      return '';
    }
  }

  static String errorMessagePassword(
    String? text,
    String message,
  ) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text.length < 6) {
      return 'Password must have 6 or more characters';
    } else {
      return '';
    }
  }
}
