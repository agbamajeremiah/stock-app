import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:stock/core/dependency/injection_container.dart';
import 'package:stock/core/utils/currency_util.dart';
import 'package:stock/ui/features/home/domain/entities/stock_entity.dart';
import 'package:stock/ui/features/home/presentation/providers/home_provider.dart';
import 'package:stock/ui/shared/styles/colors.dart';
import 'package:stock/ui/shared/styles/fonts.dart';
import 'package:stock/ui/shared/widgets/loader.dart';

class MarketDetailScreen extends StatefulWidget {
  final StockEntity params;
  const MarketDetailScreen({
    Key? key,
    required this.params,
  }) : super(key: key);

  @override
  State<MarketDetailScreen> createState() => _MarketDetailScreenState();
}

class _MarketDetailScreenState extends State<MarketDetailScreen> {
  void _fetchStockDetail() async {
    await sl<HomeProvider>()
        .getSingleStockDetails(ticker: widget.params.ticker);
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, _fetchStockDetail);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.black,
          ),
        ),
        title: SubHeaderText(
          'Stock Details',
          color: AppColors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer<HomeProvider>(
          builder: (context, provider, child) {
            return provider.isBusy || provider.stockDetailEntity == null
                ? const Center(
                    child: AppLoader(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Center(
                                child: Image.network(
                                  provider.stockDetailEntity!.logo,
                                  height: 35,
                                  width: 35,
                                ),
                              ),
                            ),
                            const Gap(5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  provider.stockDetailEntity!.name,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                const Gap(5),
                                SmallText(
                                  provider.stockDetailEntity!.symbol,
                                  color: AppColors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Gap(10),
                        BodyText(
                          provider.stockDetailEntity!.description,
                          color: AppColors.black,
                        ),
                        const Gap(10),
                        StockElementWidget(
                          field: 'Symbol: ',
                          value: provider.stockDetailEntity!.symbol,
                        ),
                        StockElementWidget(
                          field: 'Exchange: ',
                          value: provider.stockDetailEntity!.exchange,
                        ),
                        StockElementWidget(
                          field: 'Industry: ',
                          value: provider.stockDetailEntity!.industry,
                        ),
                        StockElementWidget(
                          field: 'Sector',
                          value: provider.stockDetailEntity!.sector,
                        ),
                        const Gap(20),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    provider.stockDetailEntity!.logo,
                                    height: 30,
                                    width: 30,
                                  ),
                                  const Gap(5),
                                  CustomText(
                                    'Overview',
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w600,
                                  )
                                ],
                              ),
                              const Gap(10),
                              TinyText(
                                'Market Cap',
                                color: AppColors.grey,
                              ),
                              const Gap(5),
                              BodyText(
                                CurrencyUtil.formatAmountInt(
                                    provider.stockDetailEntity!.marketcap),
                                color: AppColors.black,
                              )
                            ],
                          ),
                        ),
                        const Gap(30),
                        SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.green[500],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: BodyText(
                                      'Buy',
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const Gap(20),
                              Expanded(
                                child: Container(
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: BodyText(
                                      'Follow',
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}

class StockElementWidget extends StatelessWidget {
  final String field;
  final String value;

  const StockElementWidget({
    Key? key,
    required this.field,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SmallText(
              field,
              color: AppColors.black,
            ),
          ),
          Expanded(
            flex: 3,
            child: SmallText(
              value,
              color: AppColors.black,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
