import 'dart:convert';

topdeals topdealsFromJson(String str) => topdeals.fromJson(json.decode(str));

String topdealsToJson(topdeals data) => json.encode(data.toJson());

class topdeals {
  topdeals({
    required this.id,
    required this.cuttopdeals,
    required this.name,
    required this.price,
  });

  String id;
  String cuttopdeals;
  String name;
  String price;

  factory topdeals.fromJson(Map<String, dynamic> json) => topdeals(
        id: json["id"],
        cuttopdeals: json["cuttopdeals"],
        name: json["Name"],
        price: json["topdeals"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Cuttopdeals": cuttopdeals,
        "Name": name,
        "Price": price,
      };
}
