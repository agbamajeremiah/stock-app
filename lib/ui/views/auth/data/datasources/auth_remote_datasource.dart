import 'package:injectable/injectable.dart';
import 'package:stock/core/constants/constant.dart';
import 'package:stock/core/errors/error.dart';

abstract class AuthRemoteDatasource {
  Future<bool> login(String email, String password);
}

@LazySingleton(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  @override
  Future<bool> login(
    String email,
    String password,
  ) async {
    if (email == TEST_EMAIL && password == TEST_PASSWORD) {
      return true;
    } else {
      throw InvalidCredentialException();
    }
  }
}
