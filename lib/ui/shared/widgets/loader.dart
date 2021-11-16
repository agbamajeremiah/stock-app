import 'package:flutter/material.dart';
import 'package:stock/ui/shared/custom_circular_progress_bar.dart';

class AppLoader extends StatelessWidget {
  final Color? color;
  final double? size, strokeWidth;

  const AppLoader({
    Key? key,
    this.color,
    this.size,
    this.strokeWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 20,
      width: size ?? 20,
      child: const CustomCircularProgressIndicator(),
    );
  }
}
