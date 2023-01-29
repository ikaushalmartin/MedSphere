import 'dart:convert';

cartmodel cartmodelFromJson(String str) => cartmodel.fromJson(json.decode(str));

String cartmodelToJson(cartmodel data) => json.encode(data.toJson());

class cartmodel {
  cartmodel(
      {required this.id,
      required this.cutprice,
      required this.url,
      required this.company,
      required this.productname,
      required this.price,
      required this.quantity});
  String cutprice;
  String id;
  String url;
  String company;
  String productname;
  String price;
  int quantity;

  factory cartmodel.fromJson(Map<String, dynamic> json) => cartmodel(
      id: json["id"],
      cutprice: json["cutprice"],
      url: json["url"],
      company: json["company"],
      productname: json["productname"],
      price: json["price"],
      quantity: json["quantity"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "cutprice": cutprice,
        "url": url,
        "company": company,
        "productname": productname,
        "price": price,
        "quantity": quantity
      };
}
