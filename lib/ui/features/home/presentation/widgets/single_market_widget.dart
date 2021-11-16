import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stock/core/constants/routes.dart';
import 'package:stock/ui/features/home/domain/entities/stock_entity.dart';
import 'package:stock/ui/shared/styles/colors.dart';
import 'package:stock/ui/shared/styles/fonts.dart';

class SingleMarketWidget extends StatelessWidget {
  final StockEntity item;
  const SingleMarketWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        Routes.marketDetailView,
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              item.name,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            const Gap(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(
                  item.ticker,
                  color: AppColors.grey,
                ),
                SmallText(
                  item.currencyName!.toUpperCase(),
                  color: AppColors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
