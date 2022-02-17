import 'dart:convert';

class DownedServicesModel {
  int id;
  int disasterId;
  int serivce;
  String details;
  int responseTime;
  int phone_1;
  int phone_2;
  String email;
  int city;
  DateTime downTime;
  DateTime upTime;
  bool isActive;
  DownedServicesModel({
    required this.id,
    required this.disasterId,
    required this.serivce,
    required this.details,
    required this.responseTime,
    required this.phone_1,
    required this.phone_2,
    required this.email,
    required this.city,
    required this.downTime,
    required this.upTime,
    required this.isActive,
  });

  DownedServicesModel copyWith({
    int? id,
    int? disasterId,
    int? serivce,
    String? details,
    int? responseTime,
    int? phone_1,
    int? phone_2,
    String? email,
    int? city,
    DateTime? downTime,
    DateTime? upTime,
    bool? isActive,
  }) {
    return DownedServicesModel(
      id: id ?? this.id,
      disasterId: disasterId ?? this.disasterId,
      serivce: serivce ?? this.serivce,
      details: details ?? this.details,
      responseTime: responseTime ?? this.responseTime,
      phone_1: phone_1 ?? this.phone_1,
      phone_2: phone_2 ?? this.phone_2,
      email: email ?? this.email,
      city: city ?? this.city,
      downTime: downTime ?? this.downTime,
      upTime: upTime ?? this.upTime,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'disasterId': disasterId,
      'serivce': serivce,
      'details': details,
      'responseTime': responseTime,
      'phone_1': phone_1,
      'phone_2': phone_2,
      'email': email,
      'city': city,
      'downTime': downTime.millisecondsSinceEpoch,
      'upTime': upTime.millisecondsSinceEpoch,
      'isActive': isActive,
    };
  }

  factory DownedServicesModel.fromMap(Map<String, dynamic> map) {
    return DownedServicesModel(
      id: map['id'] ?? 0,
      disasterId: map['disasterid'] ?? 0,
      serivce: map['service'] ?? 0,
      details: map['details'] ?? '',
      responseTime: map['responce_time'] ?? 0,
      phone_1: map['phone_1'] ?? 0,
      phone_2: map['phone_2'] ?? 0,
      email: map['email'] ?? '',
      city: map['city'] ?? 0,
      downTime: DateTime.parse(map['down_time']),
      upTime: DateTime.parse(map['up_time']),
      isActive: map['isActive'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory DownedServicesModel.fromJson(String source) =>
      DownedServicesModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DownedServicesModel(id: $id, disasterId: $disasterId, serivce: $serivce, details: $details, responseTime: $responseTime, phone_1: $phone_1, phone_2: $phone_2, email: $email, city: $city, downTime: $downTime, upTime: $upTime, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DownedServicesModel &&
        other.id == id &&
        other.disasterId == disasterId &&
        other.serivce == serivce &&
        other.details == details &&
        other.responseTime == responseTime &&
        other.phone_1 == phone_1 &&
        other.phone_2 == phone_2 &&
        other.email == email &&
        other.city == city &&
        other.downTime == downTime &&
        other.upTime == upTime &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        disasterId.hashCode ^
        serivce.hashCode ^
        details.hashCode ^
        responseTime.hashCode ^
        phone_1.hashCode ^
        phone_2.hashCode ^
        email.hashCode ^
        city.hashCode ^
        downTime.hashCode ^
        upTime.hashCode ^
        isActive.hashCode;
  }
}
