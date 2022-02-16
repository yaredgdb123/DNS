import 'package:flutter/material.dart';

import '../util.dart';

class LoginProvider extends ChangeNotifier {
  int? city;
  bool isLoading = false;

  Future<void> attemptLogin(
    String? email,
    String? password,
  ) async {
    try {
      isLoading = true;
      notifyListeners();
      Future.delayed(const Duration(seconds: 1));
      final response = await DioHelper.dio.post("/login", data: {
        "email": email,
        "password": password,
      });
      city = response.data["data"];
      // city = 1;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    city = null;
  }
}
