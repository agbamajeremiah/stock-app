import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:stock/core/errors/error.dart';
import 'package:stock/core/errors/failure.dart';
import 'package:stock/core/errors/logger.dart';
import 'package:stock/ui/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:stock/ui/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;

  AuthRepositoryImpl({
    required this.remoteDatasource,
  });

  @override
  Future<Either<Failure, bool>> loginUser(String email, String password) async {
    try {
      final response = await remoteDatasource.login(
        email,
        password,
      );
      return Right(response);
    } catch (e) {
      Log.d(e);
      if (e is InvalidCredentialException) {
        return const Left(
          CustomKnownFailure(message: 'Incorrect email or password'),
        );
      }
      return Left(UnknownFailure());
    }
  }
}
