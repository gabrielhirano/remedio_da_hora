import 'dart:convert';

Medicine medicineFromJson(String str) => Medicine.fromJson(json.decode(str));

String medicineToJson(Medicine data) => json.encode(data.toJson());

class Medicine {
  num? id;
  num? dose;
  String? frequency;
  String? unity;
  String? name;
  bool? active;
  String? time;

  Medicine({
    this.id,
    this.dose,
    this.frequency,
    this.unity,
    this.name,
    this.active,
    this.time,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
        dose: json["dose"]?.toDouble() ?? 0,
        frequency: json["frequency"] ?? '',
        unity: json["unity"] ?? '',
        name: json["name"] ?? '',
        active: json["remind"] ?? false,
        time: json["time"] ?? '',
        id: json["id"] ?? 0,
      );

  Map<String, dynamic> toJson() {
    return {
      "id": id ?? 0,
      "dose": dose,
      "frequency": frequency,
      "unity": unity,
      "name": name,
      "remind": active ?? true,
      "time": time,
    };
  }

    Map<String, dynamic> toMap() {
    return {
      "dose": dose,
      "frequency": frequency,
      "unity": unity,
      "name": name,
      "remind": active ?? true,
      "time": time,
    };
  }

  @override
  String toString() => jsonEncode(toJson());
}
