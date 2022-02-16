import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../util.dart';
import 'model.dart';

class DisasterProvider extends ChangeNotifier {
  bool isLoading = false;
  late List<DisasterModel> disasters = [];
  Future<void> getDisasters(int city, int page,
      {bool shouldReload = true}) async {
    try {
      isLoading = true;
      notifyListeners();
      await Future.delayed(const Duration(seconds: 2));
      // final response =
      await DioHelper.dio.get("/disasters", queryParameters: {
        "page": page,
        "city": city,
      });
      // final data = response.data.map((e) => DisasterModel.fromMap(e)).toList();
      final data = [
        DisasterModel(
          city: "sa",
          description:
              "This is very big disaster ohhhhhhh no what has happened, I can't believe it.",
          id: 1,
          level: 2,
          type: 5,
        ),
        DisasterModel(
          city: "sa",
          description:
              "This is very big disaster ohhhhhhh no what has happened, I can't believe it.",
          id: 2,
          level: 2,
          type: 5,
        ),
        DisasterModel(
          city: "sa",
          description:
              "This is very big disaster ohhhhhhh no what has happened, I can't believe it.",
          id: 3,
          level: 2,
          type: 5,
        ),
        DisasterModel(
          city: "sa",
          description:
              "This is very big disaster ohhhhhhh no what has happened, I can't believe it.",
          id: 4,
          level: 2,
          type: 5,
        ),
        DisasterModel(
          city: "sa",
          description:
              "This is very big disaster ohhhhhhh no what has happened, I can't believe it.",
          id: 5,
          level: 2,
          type: 5,
        )
      ];

      if (shouldReload) {
        disasters = data;
      } else {
        disasters.addAll(data);
      }
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
