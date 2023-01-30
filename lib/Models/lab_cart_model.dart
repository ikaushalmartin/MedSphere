import 'dart:convert';

lab_cartmodel lab_cartmodelFromJson(String str) =>
    lab_cartmodel.fromJson(json.decode(str));

String lab_cartmodelToJson(lab_cartmodel data) => json.encode(data.toJson());

class lab_cartmodel {
  lab_cartmodel(
      {required this.id,
      required this.cutprice,
      required this.packages,
      required this.name,
      required this.price,
      required this.quantity});
  String cutprice;
  String id;
  String packages;
  String name;
  String price;
  int quantity;

  factory lab_cartmodel.fromJson(Map<String, dynamic> json) => lab_cartmodel(
      id: json["id"],
      cutprice: json["cutprice"],
      packages: json["packages"],
      name: json[" name"],
      price: json["price"],
      quantity: json["quantity"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "cutprice": cutprice,
        "packages": packages,
        "name": name,
        "price": price,
        "quantity": quantity
      };
}
