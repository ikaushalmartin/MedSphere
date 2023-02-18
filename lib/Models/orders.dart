import 'dart:convert';

order orderFromJson(String str) => order.fromJson(json.decode(str));

String orderToJson(order data) => json.encode(data.toJson());

class order {
  order(
      {required this.id,
      required this.cutprice,
      required this.company,
      required this.name,
      required this.price,
      required this.status,
      required this.quantity});

  String id;
  String cutprice;
  String company;
  String name;
  String price;
  String status;
  int quantity;

  factory order.fromJson(Map<String, dynamic> json) => order(
      id: json["id"],
      cutprice: json["cutprice"],
      company: json["company"],
      name: json["Name"],
      price: json["Price"],
      status: json["Status"],
      quantity: json["Quantity"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "Cutprice": cutprice,
        "Company": company,
        "Name": name,
        "Price": price,
        "Status": status,
        "Quantity": quantity
      };
}
