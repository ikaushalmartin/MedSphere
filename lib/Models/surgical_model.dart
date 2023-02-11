import 'dart:convert';

surgical_model surgical_modelFromJson(String str) =>
    surgical_model.fromJson(json.decode(str));

String surgical_modelToJson(surgical_model data) => json.encode(data.toJson());

class surgical_model {
  surgical_model(
      {required this.name,
      required this.price,
      required this.cutprice,
      required this.use,
      required this.company,
      required this.sterile,
      required this.size,
      required this.category,
      required this.id,
      required this.description});

  String id;
  String price,
      name,
      cutprice,
      use,
      company,
      sterile,
      size,
      category,
      description;

  factory surgical_model.fromJson(Map<String, dynamic> json) => surgical_model(
      id: json["id"],
      price: json["price"],
      name: json["name"],
      cutprice: json["cutprice"],
      use: json["use"],
      company: json["company"],
      sterile: json["sterile"],
      size: json["size"],
      category: json["category"],
      description: json["description"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
        "Cutprice": cutprice,
        "Use": use,
        "Company": company,
        "Sterlie": sterile,
        "Size": size,
        "Category": category,
        "Description": description,
        "Price": price,
      };
}
