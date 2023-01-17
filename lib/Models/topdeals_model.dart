import 'dart:convert';

topdeals topdealsFromJson(String str) => topdeals.fromJson(json.decode(str));

String topdealsToJson(topdeals data) => json.encode(data.toJson());

class topdeals {
  topdeals({
    required this.id,
    required this.cuttopdeals,
    required this.name,
    required this.price,
    required this.quantity,
    required this.company,
    required this.medicaldiscription,
    required this.sideeffect,
    required this.uses,
    required this.doses,
    required this.precaution_and_warning,
  });

  String id;
  String cuttopdeals;
  String name;
  String price;
  String quantity;
  String company;
  String medicaldiscription;
  String uses;
  String doses;
  String sideeffect;
  String precaution_and_warning;
  factory topdeals.fromJson(Map<String, dynamic> json) => topdeals(
      id: json["id"],
      cuttopdeals: json["cuttopdeals"],
      name: json["Name"],
      price: json["topdeals"],
      quantity: json["quantity"],
      company: json["company"],
      medicaldiscription: json["medicaldiscription"],
      uses: json["uses"],
      doses: json["doses"],
      sideeffect: json["sideeffect"],
      precaution_and_warning: json["precaution_and_warning"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "Cuttopdeals": cuttopdeals,
        "Name": name,
        "Price": price,
        "Quantity": quantity,
        "Company": company,
        "Medical_discription": medicaldiscription,
        "Uses": uses,
        "Doses": doses,
        "Side_effect": sideeffect,
        "Precaution_and_Warning": precaution_and_warning
      };
}
