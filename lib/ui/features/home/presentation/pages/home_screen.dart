import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:stock/core/constants/app_asset.dart';
import 'package:stock/core/dependency/injection_container.dart';
import 'package:stock/ui/features/home/presentation/providers/home_provider.dart';
import 'package:stock/ui/features/home/presentation/widgets/single_market_widget.dart';
import 'package:stock/ui/shared/styles/colors.dart';
import 'package:stock/ui/shared/styles/fonts.dart';
import 'package:stock/ui/shared/ui_helpers.dart';
import 'package:stock/ui/shared/widgets/loader.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _fetchStocks() async {
    await sl<HomeProvider>().getAllStocks(context);
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, _fetchStocks);
    super.initState();
  }

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
                    'John Doe',
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
                      Consumer<HomeProvider>(
                        builder: (context, provider, child) {
                          return provider.stockList == null
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      top: screenHeight(context) * 0.12),
                                  child: const Center(
                                    child: AppLoader(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: provider.stockList!.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return SingleMarketWidget(
                                      item: provider.stockList![index],
                                    );
                                  },
                                );
                        },
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
