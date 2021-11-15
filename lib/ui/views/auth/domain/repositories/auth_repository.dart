import 'package:dartz/dartz.dart';
import 'package:stock/core/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> loginUser(String email, String password);
}
