import 'dart:convert';

emergency emergencyFromJson(String str) => emergency.fromJson(json.decode(str));

String emergencyToJson(emergency data) => json.encode(data.toJson());

class emergency {
  emergency({
    required this.id,
    required this.name,
    required this.number,
  });

  String id;
  String name;
  String number;

  factory emergency.fromJson(Map<String, dynamic> json) =>
      emergency(id: json["id"], name: json["Name"], number: json["Number"]);

  Map<String, dynamic> toJson() => {"id": id, "Name": name, "Number": number};
}
