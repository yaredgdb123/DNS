import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../util.dart';
import 'model.dart';

class DownServiceProvider extends ChangeNotifier {
  bool isLoading = false;
  late List<DownedServicesModel> downedServices = [];
  Future<void> getDownedServices(List<int> disasterIds, int page,
      {bool shouldReload = true}) async {
    try {
      isLoading = true;
      notifyListeners();
      await Future.delayed(const Duration(seconds: 2));
      // final response =
      final response =
          await DioHelper.dio.get("/downed-services", queryParameters: {
        "page": page,
        "disasterIds": disasterIds,
      });
      final data = response.data
          .map<DownedServicesModel>((e) => DownedServicesModel.fromMap(e))
          .toList();
      // final data = [
      //   DownedServicesModel(
      //     disasterId: 1,
      //     downTime: DateTime.now(),
      //     upTime: DateTime.now(),
      //     id: 1,
      //     isActive: false,
      //     serivce: ServiceModel(
      //       city: 1,
      //       details: "Tele Service",
      //       email: "Tele@gmail.com",
      //       phone_1: "999",
      //       phone_2: "999",
      //       id: 1,
      //       responseTime: 2,
      //     ),
      //   ),
      //   DownedServicesModel(
      //     disasterId: 1,
      //     downTime: DateTime.now(),
      //     upTime: DateTime.now(),
      //     id: 2,
      //     isActive: false,
      //     serivce: ServiceModel(
      //       city: 1,
      //       details: "Police Station",
      //       email: "police@gmail.com",
      //       phone_1: "911",
      //       phone_2: "911",
      //       id: 2,
      //       responseTime: 2,
      //     ),
      //   ),
      //   DownedServicesModel(
      //     disasterId: 1,
      //     downTime: DateTime.now(),
      //     upTime: DateTime.now(),
      //     id: 3,
      //     isActive: false,
      //     serivce: ServiceModel(
      //       city: 1,
      //       details: "Light Service",
      //       email: "MebratHail@gmail.com",
      //       phone_1: "909",
      //       phone_2: "909",
      //       id: 3,
      //       responseTime: 2,
      //     ),
      //   ),
      // ];
      if (shouldReload) {
        downedServices = data;
      } else {
        downedServices.addAll(data);
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
