import 'dart:convert';
import 'package:remedio_da_hora/common/consts.dart';
import 'package:remedio_da_hora/src/data/data_source.dart/local_repository.dart';

import 'package:uuid/uuid.dart';
import 'package:crypto/crypto.dart';

Medicine medicineFromJson(String str) => Medicine.fromJson(json.decode(str));

String medicineToJson(Medicine data) => json.encode(data.toJson());

class Medicine {
  String? id;
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
  }) {
    id = Uuid().v4(); // inicia com um valor para quando ser salvo na memoria salvar um valor
  }

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
        dose: json["dose"]?.toDouble() ?? 0,
        frequency: json["frequency"] ?? '',
        unity: json["unity"] ?? '',
        name: json["name"] ?? '',
        active: json["remind"] ?? false,
        time: json["time"] ?? '',
        id: json["id"].toString(),
      );

  Map<String, dynamic> toJson() {
    var json = {
      "dose": dose,
      "frequency": frequency,
      "unity": unity,
      "name": name,
      "remind": active ?? true,
      "time": time,
    };

    if (CONSTANT.REPOSITORY is LocalRepository) {
      json["id"] = id;
    }
    return json;
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
