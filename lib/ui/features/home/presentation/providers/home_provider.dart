import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:stock/ui/features/home/domain/entities/stock_entity.dart';
import 'package:stock/ui/features/home/domain/repositories/home_repository.dart';

@lazySingleton
class HomeProvider extends ChangeNotifier {
  final HomeRepository homeRepository;
  List<StockEntity>? stockList;

  HomeProvider({required this.homeRepository});
  Future<void> getAllStocks(BuildContext context) async {
    if (true) {
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
}
