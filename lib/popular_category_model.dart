import 'dart:convert';

Price PriceFromJson(String str) => Price.fromJson(json.decode(str));

String PriceToJson(Price data) => json.encode(data.toJson());

class Price {
  Price({
    required this.id,
    required this.cutprice,
    required this.info,
    required this.name,
    required this.price,
  });

  String id;
  String cutprice;
  String info;
  String name;
  String price;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        id: json["id"],
        cutprice: json["cutprice"],
        info: json["info"],
        name: json["Name"],
        price: json["Price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Cutprice": cutprice,
        "Info": info,
        "Name": name,
        "Price": price,
      };
}
