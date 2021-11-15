import 'package:equatable/equatable.dart';

class StockEntity extends Equatable {
  const StockEntity({
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

  @override
  List<Object?> get props => [
        ticker,
        name,
        market,
        locale,
        primaryExchange,
        active,
        currencyName,
      ];
}
