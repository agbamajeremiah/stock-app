import 'package:flutter/material.dart';
import 'package:stock/ui/shared/styles/colors.dart';
import 'package:stock/ui/shared/styles/fonts.dart';

class MarketDetailScreen extends StatelessWidget {
  const MarketDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.black,
        ),
        title: SubHeaderText(
          'Stock Details',
          color: AppColors.black,
        ),
      ),
      body: Container(),
    );
  }
}
