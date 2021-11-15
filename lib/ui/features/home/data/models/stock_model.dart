class StockModel {
  StockModel({
    required this.ticker,
    required this.name,
    required this.market,
    required this.locale,
    required this.primaryExchange,
    required this.active,
    required this.currencyName,
  });

  final String ticker;
  final String name;
  final String? market;
  final String? locale;
  final String? primaryExchange;
  final bool? active;
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
