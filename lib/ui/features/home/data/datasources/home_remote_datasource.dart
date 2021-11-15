import 'package:injectable/injectable.dart';
import 'package:stock/core/errors/error.dart';
import 'package:stock/core/errors/logger.dart';
import 'package:stock/core/network/http_requester.dart';
import 'package:stock/core/network/network_info.dart';
import 'package:stock/ui/features/home/data/models/ticker_model.dart';

abstract class HomeRemoteDatasource {
  Future<List<TickerModel>> getAllStocks();
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
  Future<List<TickerModel>> getAllStocks() async {
    if (await networkInfo.isConnected) {
      var response = await httpServiceRequester.getRequest(
        url: 'v3/reference/tickers',
      );
      Log.d(response.data);
      return TickerModelList.fromJson(response.data['results']).tickerList;
    } else {
      throw NoInternetException();
    }
  }
}
