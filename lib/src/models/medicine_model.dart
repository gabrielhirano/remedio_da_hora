import 'dart:convert';

Medicine medicineFromJson(String str) => Medicine.fromJson(json.decode(str));

String medicineToJson(Medicine data) => json.encode(data.toJson());

class Medicine {
  num? id;
  num? dose;
  String? unity;
  String? frequency;
  String? name;
  bool? active;
  String? time;

  Medicine({
    this.id,
    this.dose,
    this.unity,
    this.frequency,
    this.name,
    this.active = false,
    this.time,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
        dose: json["dose"]?.toDouble(),
        unity: json["unity"],
        frequency: json["frequency"],
        name: json["name"],
        active: json["remind"],
        time: json["time"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dose": dose,
        "unity": unity ?? '',
        "frequency": frequency,
        "name": name,
        "remind": active,
        "time": time,
      };

  @override
  String toString() => jsonEncode(toJson());
}

class MedicineEntity {
  num id;
  num dose;
  String unity;
  String frequency;
  String name;
  bool active;
  String time;

  MedicineEntity({
    required this.id,
    required this.dose,
    required this.unity,
    required this.frequency,
    required this.name,
    required this.active,
    required this.time,
  });

  factory MedicineEntity.fromJson(Map<String, dynamic> json) => MedicineEntity(
        dose: json["dose"]?.toDouble(),
        unity: json["unity"],
        frequency: json["frequency"],
        name: json["name"],
        active: json["remind"],
        time: json["time"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dose": dose,
        "unity": unity,
        "frequency": frequency,
        "name": name,
        "remind": active,
        "time": time,
      };

  @override
  String toString() => jsonEncode(toJson());
}

extension MedicineExtension on Medicine {
  MedicineEntity toEntity() {
    return MedicineEntity.fromJson(toJson());
  }
}
