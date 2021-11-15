import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stock/core/constants/app_asset.dart';
import 'package:lottie/lottie.dart';
import 'package:stock/core/constants/routes.dart';
import 'package:stock/ui/shared/styles/colors.dart';
import 'package:stock/ui/shared/styles/fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then(
      (_) => Navigator.pushReplacementNamed(context, Routes.loginView),
    );
    super.initState();
  }

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
            ),
            const Gap(10),
            H1('Stock'),
          ],
        ),
      ),
    );
  }
}
