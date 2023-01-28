import 'dart:convert';

cartmodel cartmodelFromJson(String str) => cartmodel.fromJson(json.decode(str));

String cartmodelToJson(cartmodel data) => json.encode(data.toJson());

class cartmodel {
  cartmodel({
    required this.id,
    required this.url,
    required this.company,
    required this.productname,
    required this.price,
  });

  String id;
  String url;
  String company;
  String productname;
  String price;

  factory cartmodel.fromJson(Map<String, dynamic> json) => cartmodel(
        id: json["id"],
        url: json["url"],
        company: json["company"],
        productname: json["productname"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "company": company,
        "productname": productname,
        "price": price,
      };
}
