import 'package:injectable/injectable.dart';
import 'package:stock/core/errors/error.dart';
import 'package:stock/core/errors/logger.dart';
import 'package:stock/core/network/http_requester.dart';
import 'package:stock/core/network/network_info.dart';
import 'package:stock/ui/features/home/data/models/stock_detail_model.dart';
import 'package:stock/ui/features/home/data/models/stock_model.dart';

abstract class HomeRemoteDatasource {
  Future<List<StockModel>> getAllStocks();
  Future<StockDetailModel> getStockDetail({
    required String ticker,
  });
}

@LazySingleton(as: HomeRemoteDatasource)
class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final NetworkInfo networkInfo;
  final HttpServiceRequester httpServiceRequester;

  HomeRemoteDatasourceImpl({
    required this.networkInfo,
    required this.httpServiceRequester,
  });

  @override
  Future<List<StockModel>> getAllStocks() async {
    if (await networkInfo.isConnected) {
      var response = await httpServiceRequester.getRequest(
        url: 'v3/reference/tickers',
      );
      Log.d(response.data);
      return StockModelList.fromJson(response.data['results']).tickerList;
    } else {
      throw NoInternetException();
    }
  }

  @override
  Future<StockDetailModel> getStockDetail({required String ticker}) async {
    if (await networkInfo.isConnected) {
      var response = await httpServiceRequester.getRequest(
        url: 'v1/meta/symbols/$ticker/company',
      );
      Log.d(response.data);
      return StockDetailModel.fromMap(response.data);
    } else {
      throw NoInternetException();
    }
  }
}
