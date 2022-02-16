import 'dart:convert';

class DownedServicesModel {
  int id;
  int disasterId;
  ServiceModel serivce;
  DateTime downTime;
  DateTime upTime;
  bool isActive;
  DownedServicesModel({
    required this.id,
    required this.disasterId,
    required this.serivce,
    required this.downTime,
    required this.upTime,
    required this.isActive,
  });

  DownedServicesModel copyWith({
    int? id,
    int? disasterId,
    ServiceModel? serivce,
    DateTime? downTime,
    DateTime? upTime,
    bool? isActive,
  }) {
    return DownedServicesModel(
      id: id ?? this.id,
      disasterId: disasterId ?? this.disasterId,
      serivce: serivce ?? this.serivce,
      downTime: downTime ?? this.downTime,
      upTime: upTime ?? this.upTime,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'disasterId': disasterId,
      'serivce': serivce.toMap(),
      'downTime': downTime.millisecondsSinceEpoch,
      'upTime': upTime.millisecondsSinceEpoch,
      'isActive': isActive,
    };
  }

  factory DownedServicesModel.fromMap(Map<String, dynamic> map) {
    return DownedServicesModel(
      id: map['id']?.toInt() ?? 0,
      disasterId: map['disasterId']?.toInt() ?? 0,
      serivce: ServiceModel.fromMap(map['serivce']),
      downTime: DateTime.fromMillisecondsSinceEpoch(map['downTime']),
      upTime: DateTime.fromMillisecondsSinceEpoch(map['upTime']),
      isActive: map['isActive'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory DownedServicesModel.fromJson(String source) =>
      DownedServicesModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DownedServicesModel(id: $id, disasterId: $disasterId, serivce: $serivce, downTime: $downTime, upTime: $upTime, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DownedServicesModel &&
        other.id == id &&
        other.disasterId == disasterId &&
        other.serivce == serivce &&
        other.downTime == downTime &&
        other.upTime == upTime &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        disasterId.hashCode ^
        serivce.hashCode ^
        downTime.hashCode ^
        upTime.hashCode ^
        isActive.hashCode;
  }
}

class ServiceModel {
  int id;
  String details;
  int responseTime;
  String phone_1;
  String phone_2;
  String email;
  int city;

  ServiceModel({
    required this.id,
    required this.details,
    required this.responseTime,
    required this.phone_1,
    required this.phone_2,
    required this.email,
    required this.city,
  });

  ServiceModel copyWith({
    int? id,
    String? details,
    int? responseTime,
    String? phone_1,
    String? phone_2,
    String? email,
    int? city,
  }) {
    return ServiceModel(
      id: id ?? this.id,
      details: details ?? this.details,
      responseTime: responseTime ?? this.responseTime,
      phone_1: phone_1 ?? this.phone_1,
      phone_2: phone_2 ?? this.phone_2,
      email: email ?? this.email,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'details': details,
      'responseTime': responseTime,
      'phone_1': phone_1,
      'phone_2': phone_2,
      'email': email,
      'city': city,
    };
  }

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      id: map['id']?.toInt() ?? 0,
      details: map['details'] ?? '',
      responseTime: map['responseTime']?.toInt() ?? 0,
      phone_1: map['phone_1'] ?? '',
      phone_2: map['phone_2'] ?? '',
      email: map['email'] ?? '',
      city: map['city']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceModel.fromJson(String source) =>
      ServiceModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ServiceModel(id: $id, details: $details, responseTime: $responseTime, phone_1: $phone_1, phone_2: $phone_2, email: $email, city: $city)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ServiceModel &&
        other.id == id &&
        other.details == details &&
        other.responseTime == responseTime &&
        other.phone_1 == phone_1 &&
        other.phone_2 == phone_2 &&
        other.email == email &&
        other.city == city;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        details.hashCode ^
        responseTime.hashCode ^
        phone_1.hashCode ^
        phone_2.hashCode ^
        email.hashCode ^
        city.hashCode;
  }
}
