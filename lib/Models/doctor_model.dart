import 'dart:convert';

doc docFromJson(String str) => doc.fromJson(json.decode(str));

String docToJson(doc data) => json.encode(data.toJson());

class doc {
  doc({
    required this.id,
    required this.hospital,
    required this.name,
    required this.specialist,
  });
  String id;
  String hospital;
  String name;
  String specialist;

  factory doc.fromJson(Map<String, dynamic> json) => doc(
        id: json["id"],
        hospital: json["Hospital"],
        name: json["Name"],
        specialist: json["Specialist"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Hospital": hospital,
        "Name": name,
        "Specialist": specialist,
      };
}
