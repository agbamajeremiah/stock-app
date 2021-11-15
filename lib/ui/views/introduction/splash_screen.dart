import 'package:flutter/material.dart';
import 'package:stock/core/constants/app_asset.dart';
import 'package:stock/ui/views/shared/styles/colors.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 174,
            height: 132,
            child: Lottie.asset(
              AppAsset.stockAnimation,
              fit: BoxFit.cover,
            ),
          )
        ],
      )),
    );
  }
}
