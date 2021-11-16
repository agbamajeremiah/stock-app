import 'package:equatable/equatable.dart';

class StockDetailEntity extends Equatable {
  const StockDetailEntity({
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
  });

  final String logo;
  final String bloomberg;
  final String country;
  final String industry;
  final String sector;
  final int marketcap;
  final int employees;
  final String phone;
  final String ceo;
  final String url;
  final String description;
  final String exchange;
  final String name;
  final String symbol;
  final String exchangeSymbol;
  final String hqAddress;
  final String hqState;
  final String hqCountry;
  final String type;
  final String updated;
  final bool active;

  @override
  List<Object?> get props => [
        logo,
        bloomberg,
        country,
        industry,
        sector,
        marketcap,
        employees,
        phone,
        ceo,
        url,
        description,
        exchange,
        name,
        symbol,
        exchangeSymbol,
        hqAddress,
        hqState,
        hqCountry,
        type,
        updated,
        active,
      ];
}
