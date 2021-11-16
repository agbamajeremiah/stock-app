import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stock/ui/shared/styles/colors.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? const CupertinoActivityIndicator(
            radius: 15,
          )
        : const CircularProgressIndicator(
            color: AppColors.primaryColor,
            strokeWidth: 2.5,
          );
  }
}
