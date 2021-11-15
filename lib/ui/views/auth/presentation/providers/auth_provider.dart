import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stock/core/constants/routes.dart';
import 'package:stock/core/errors/failure.dart';
import 'package:stock/ui/views/auth/domain/repositories/auth_repository.dart';

@lazySingleton
class AuthProvider extends ChangeNotifier {
  final AuthRepository authRepository;
  String loginError = '';
  bool isBusy = false;
  AuthProvider({required this.authRepository});

  Future<void> loginUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    loginError = '';
    setBusy(true);
    final response = await authRepository.loginUser(email, password);
    response.fold(
      (l) {
        loginError = FailureToMessage.mapFailureToMessage(l);
      },
      (r) async {
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.tabView,
          (route) => false,
        );
      },
    );
    setBusy(false);
  }

  void setBusy(bool value) {
    isBusy = value;
    notifyListeners();
  }
}
