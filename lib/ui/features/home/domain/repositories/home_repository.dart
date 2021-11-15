import 'package:dartz/dartz.dart';
import 'package:stock/core/errors/failure.dart';
import 'package:stock/ui/features/home/domain/entities/stock_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<StockEntity>>> getAllStocks();
}
