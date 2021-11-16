// ignore_for_file: overridden_fields

import 'package:stock/ui/features/home/domain/entities/stock_detail_entity.dart';

class StockDetailModel extends StockDetailEntity {
  const StockDetailModel({
    required this.logo,
    required this.bloomberg,
    required this.country,
    required this.industry,
    required this.sector,
    required this.marketcap,
    required this.employees,
    required this.phone,
    required this.ceo,
    required this.url,
    required this.description,
    required this.exchange,
    required this.name,
    required this.symbol,
    required this.exchangeSymbol,
    required this.hqAddress,
    required this.hqState,
    required this.hqCountry,
    required this.type,
    required this.updated,
    required this.active,
  }) : super(
          logo: logo,
          bloomberg: bloomberg,
          country: country,
          industry: industry,
          sector: sector,
          marketcap: marketcap,
          employees: employees,
          phone: phone,
          ceo: ceo,
          url: url,
          description: description,
          exchange: exchange,
          name: name,
          symbol: symbol,
          exchangeSymbol: exchange,
          hqAddress: hqAddress,
          hqState: hqState,
          hqCountry: hqCountry,
          type: type,
          updated: updated,
          active: active,
        );

  @override
  final String logo;
  @override
  final String bloomberg;
  @override
  final String country;
  @override
  final String industry;
  @override
  final String sector;
  @override
  final int marketcap;
  @override
  final int employees;
  @override
  final String phone;
  @override
  final String ceo;
  @override
  final String url;
  @override
  final String description;
  @override
  final String exchange;
  @override
  final String name;
  @override
  final String symbol;
  @override
  final String exchangeSymbol;
  @override
  final String hqAddress;
  @override
  final String hqState;
  @override
  final String hqCountry;
  @override
  final String type;
  @override
  final String updated;
  @override
  final bool active;

  factory StockDetailModel.fromMap(Map<String, dynamic> json) =>
      StockDetailModel(
        logo: json["logo"],
        bloomberg: json["bloomberg"],
        country: json["country"],
        industry: json["industry"],
        sector: json["sector"],
        marketcap: json["marketcap"],
        employees: json["employees"],
        phone: json["phone"],
        ceo: json["ceo"],
        url: json["url"],
        description: json["description"],
        exchange: json["exchange"],
        name: json["name"],
        symbol: json["symbol"],
        exchangeSymbol: json["exchangeSymbol"],
        hqAddress: json["hq_address"],
        hqState: json["hq_state"],
        hqCountry: json["hq_country"],
        type: json["type"],
        updated: json["updated"],
        active: json["active"],
      );

  Map<String, dynamic> toMap() => {
        "logo": logo,
        "bloomberg": bloomberg,
        "country": country,
        "industry": industry,
        "sector": sector,
        "marketcap": marketcap,
        "employees": employees,
        "phone": phone,
        "ceo": ceo,
        "url": url,
        "description": description,
        "exchange": exchange,
        "name": name,
        "symbol": symbol,
        "exchangeSymbol": exchangeSymbol,
        "hq_address": hqAddress,
        "hq_state": hqState,
        "hq_country": hqCountry,
        "type": type,
        "updated": updated,
        "active": active,
      };
}
