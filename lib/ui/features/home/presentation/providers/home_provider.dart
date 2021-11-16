import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:stock/ui/features/home/domain/entities/stock_detail_entity.dart';
import 'package:stock/ui/features/home/domain/entities/stock_entity.dart';
import 'package:stock/ui/features/home/domain/repositories/home_repository.dart';

@lazySingleton
class HomeProvider extends ChangeNotifier {
  final HomeRepository homeRepository;
  List<StockEntity>? stockList;
  StockDetailEntity? stockDetailEntity;
  bool isBusy = false;

  HomeProvider({required this.homeRepository});
  Future<void> getAllStocks(BuildContext context) async {
    if (stockList == null) {
      final response = await homeRepository.getAllStocks();
      response.fold(
        (l) {},
        (r) {
          stockList = r;
          notifyListeners();
        },
      );
    }
  }

  Future<void> getSingleStockDetails({required String ticker}) async {
    setBusy(true);
    final response = await homeRepository.getStockDetail(ticker: ticker);
    response.fold(
      (l) {},
      (r) {
        stockDetailEntity = r;
      },
    );
    setBusy(false);
  }

  void setBusy(bool value) {
    isBusy = value;
    notifyListeners();
  }
}
