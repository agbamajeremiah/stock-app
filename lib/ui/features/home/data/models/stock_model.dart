// ignore_for_file: overridden_fields

import 'package:stock/ui/features/home/domain/entities/stock_entity.dart';

class StockModel extends StockEntity {
  const StockModel({
    required this.ticker,
    required this.name,
    required this.market,
    required this.locale,
    required this.primaryExchange,
    required this.active,
    required this.currencyName,
  }) : super(
          ticker: ticker,
          name: name,
          market: market,
          locale: locale,
          primaryExchange: primaryExchange,
          active: active,
          currencyName: currencyName,
        );

  @override
  final String ticker;
  @override
  final String name;
  @override
  final String? market;
  @override
  final String? locale;
  @override
  final String? primaryExchange;
  @override
  final bool? active;
  @override
  final String? currencyName;

  factory StockModel.fromMap(Map<String, dynamic> json) => StockModel(
        ticker: json["ticker"],
        name: json["name"],
        market: json["market"],
        locale: json["locale"],
        primaryExchange: json["primary_exchange"],
        active: json["active"],
        currencyName: json["currency_name"],
      );

  Map<String, dynamic> toMap() => {
        "ticker": ticker,
        "name": name,
        "market": market,
        "locale": locale,
        "primary_exchange": primaryExchange,
        "active": active,
        "currency_name": currencyName,
      };
}

class StockModelList {
  final List<StockModel> tickerList;

  StockModelList({required this.tickerList});
  factory StockModelList.fromJson(List parsedJson) {
    var list = parsedJson.map((i) => StockModel.fromMap(i)).toList();
    return StockModelList(tickerList: list);
  }
}
