import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:stock/core/errors/error.dart';
import 'package:stock/core/errors/failure.dart';
import 'package:stock/ui/features/home/data/datasources/home_remote_datasource.dart';
import 'package:stock/ui/features/home/data/models/stock_model.dart';
import 'package:stock/ui/features/home/domain/repositories/home_repository.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({
    required this.homeRemoteDatasource,
  });

  final HomeRemoteDatasource homeRemoteDatasource;

  @override
  Future<Either<Failure, List<StockModel>>> getAllStocks() async {
    try {
      final response = await homeRemoteDatasource.getAllStocks();
      return Right(response);
    } catch (e) {
      Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().e(e.response!.data);
        if (e.response!.data != null && e.response!.data != '') {
          return Left(
            ServerFailure(
              message: e.response!.data['error'] ??
                  'Service unavailable, please try again!',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      return Left(UnknownFailure());
    }
  }
}
