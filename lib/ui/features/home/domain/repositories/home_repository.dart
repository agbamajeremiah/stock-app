import 'package:dartz/dartz.dart';
import 'package:stock/core/errors/failure.dart';
import 'package:stock/ui/features/home/data/models/stock_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<StockModel>>> getAllStocks();
}
