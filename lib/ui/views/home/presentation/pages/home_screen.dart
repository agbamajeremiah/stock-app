import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:stock/core/constants/app_asset.dart';
import 'package:stock/ui/shared/styles/colors.dart';
import 'package:stock/ui/shared/styles/fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    'Jogn Doe',
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                  SizedBox(
                    child: SvgPicture.asset(
                      AppAsset.notificationIcon,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Gap(30),
                      Container(
                        padding: const EdgeInsets.all(25),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SmallText(
                              'Portfolio value',
                              color: AppColors.grey,
                            ),
                            const Gap(10),
                            CustomText(
                              "\$15,135.32",
                              color: AppColors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                            const Gap(20),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.green[500],
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: SmallText(
                                    'Deposit',
                                    color: AppColors.white,
                                  ),
                                ),
                                const Gap(10),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(color: AppColors.grey),
                                  ),
                                  child: SmallText(
                                    'Withdraw',
                                    color: AppColors.white,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const Gap(30),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: HeaderText(
                          'Market',
                          color: AppColors.black,
                        ),
                      ),
                      const Gap(20),
                      Column(
                        children: const [
                          SingleMerketWidget(),
                          SingleMerketWidget(),
                          SingleMerketWidget(),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SingleMerketWidget extends StatelessWidget {
  const SingleMerketWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("yes");
      },
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
              'Agilent Technologies Inc.',
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            const Gap(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(
                  'Nvidia',
                  color: AppColors.grey,
                ),
                SmallText(
                  'USD',
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
