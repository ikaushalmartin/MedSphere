import 'dart:convert';

cartmodel2 cartmodel2FromJson(String str) =>
    cartmodel2.fromJson(json.decode(str));

String cartmodel2ToJson(cartmodel2 data) => json.encode(data.toJson());

class cartmodel2 {
  cartmodel2(
      {required this.id,
      required this.cutprice,
      required this.url,
      required this.company,
      required this.productname,
      required this.price,
      required this.quantity,
      required this.medicaldiscription,
      required this.sideeffect,
      required this.uses,
      required this.doses,
      required this.precaution_and_warning,
      required this.salts});
  String cutprice;
  String id;
  String url;
  String salts;
  String company;
  String productname;
  String price;
  int quantity;
  String medicaldiscription;
  String uses;
  String doses;
  String sideeffect;
  String precaution_and_warning;

  factory cartmodel2.fromJson(Map<String, dynamic> json) => cartmodel2(
      id: json["id"],
      cutprice: json["cutprice"],
      url: json["url"],
      company: json["company"],
      productname: json["productname"],
      price: json["price"],
      quantity: json["quantity"],
      medicaldiscription: json["medicaldiscription"],
      uses: json["uses"],
      doses: json["doses"],
      sideeffect: json["sideeffect"],
      precaution_and_warning: json["precaution_and_warning"],
      salts: json["salts"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "cutprice": cutprice,
        "url": url,
        "company": company,
        "productname": productname,
        "price": price,
        "quantity": quantity,
        "Medical_discription": medicaldiscription,
        "Uses": uses,
        "Doses": doses,
        "Side_effect": sideeffect,
        "Precaution_and_Warning": precaution_and_warning,
        "Salts": salts
      };
}
