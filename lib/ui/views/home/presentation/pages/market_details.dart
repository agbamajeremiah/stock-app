import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
        child: SingleChildScrollView(
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
                        "https://s3.polygon.io/logos/aapl/logo.png",
                        height: 45,
                        width: 45,
                      ),
                    ),
                  ),
                  const Gap(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        'Agilent Technologies Inc.',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      const Gap(5),
                      SmallText(
                        'Nvidia',
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(10),
              BodyText(
                'Apple Inc is designs, manufactures and markets mobile communication and media devices and personal computers, and sells a variety of related software, services, accessories, networking solutions and third-party digital content and applications.',
                color: AppColors.black,
              ),
              const Gap(10),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SmallText(
                        'Symbol: ',
                        color: AppColors.black,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: SmallText(
                        'AAP',
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SmallText(
                        'Exchange: ',
                        color: AppColors.black,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: SmallText(
                        'Nasdaq Global Select',
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SmallText(
                        'Industry: ',
                        color: AppColors.black,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: SmallText(
                        'Computer Hardware',
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SmallText(
                        'Sector: ',
                        color: AppColors.black,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: SmallText(
                        'Technology',
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
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
                          "https://s3.polygon.io/logos/aapl/logo.png",
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
                      '\$908316631180',
                      color: AppColors.black,
                    )
                  ],
                ),
              ),
              const Gap(20),
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
        ),
      ),
    );
  }
}
