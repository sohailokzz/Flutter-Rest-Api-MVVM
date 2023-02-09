import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rest_api_mvvp/repository/auth_repository.dart';
import 'package:rest_api_mvvp/utils/routes/route_names.dart';
import 'package:rest_api_mvvp/utils/utilis.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then(
      (value) {
        setLoading(false);
        Utlis.flushBarShowMessage('Login Success', context);
        Navigator.pushNamed(context, RoutesName.home);
        if (kDebugMode) {
          print(value.toString());
        }
      },
    ).onError(
      (error, stackTrace) {
        if (kDebugMode) {
          setLoading(false);
          Utlis.flushBarShowMessage(error.toString(), context);
          print(error.toString());
        }
      },
    );
  }
}
