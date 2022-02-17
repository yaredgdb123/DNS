import 'dart:convert';

class DisasterModel {
  int id;
  int city;
  int type;
  int level;
  String description;
  DisasterModel({
    required this.id,
    required this.city,
    required this.type,
    required this.level,
    required this.description,
  });

  DisasterModel copyWith({
    int? id,
    int? city,
    int? type,
    int? level,
    String? description,
  }) {
    return DisasterModel(
      id: id ?? this.id,
      city: city ?? this.city,
      type: type ?? this.type,
      level: level ?? this.level,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'city': city,
      'type': type,
      'level': level,
      'description': description,
    };
  }

  factory DisasterModel.fromMap(Map<String, dynamic> map) {
    return DisasterModel(
      id: map['id'] ?? 0,
      city: map['city'] ?? 0,
      type: map['dtype'] ?? 0,
      level: map['dlevel'] ?? 0,
      description: map['description'] ?? '',
    );
  }

  @override
  String toString() {
    return 'DisasterModel(id: $id, city: $city, type: $type, level: $level, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DisasterModel &&
        other.id == id &&
        other.city == city &&
        other.type == type &&
        other.level == level &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        city.hashCode ^
        type.hashCode ^
        level.hashCode ^
        description.hashCode;
  }
}
