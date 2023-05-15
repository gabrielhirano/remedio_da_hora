import 'dart:convert';

Medicine medicineFromJson(String str) => Medicine.fromJson(json.decode(str));

String medicineToJson(Medicine data) => json.encode(data.toJson());

class Medicine{
  num id;
  num dose;
  String frequency;
  String name;
  bool active;
  String time;

  Medicine({
    required this.id,
    required this.dose,
    required this.frequency,
    required this.name,
    required this.active,
    required this.time,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
        dose: json["dose"]?.toDouble(),
        frequency: json["frequency"],
        name: json["name"],
        active: json["remind"],
        time: json["time"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dose": dose,
        "frequency": frequency,
        "name": name,
        "remind": active,
        "time": time,
      };

  @override
  String toString() => jsonEncode(toJson());
  
}

extension EmployerExtension on Map<String, dynamic> {
  dynamic toEntity(){
    
  }
}

