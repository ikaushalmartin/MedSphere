import 'dart:convert';

lab_cartmodel2 lab_cartmodel2FromJson(String str) =>
    lab_cartmodel2.fromJson(json.decode(str));

String lab_cartmodel2ToJson(lab_cartmodel2 data) => json.encode(data.toJson());

class lab_cartmodel2 {
  lab_cartmodel2(
      {required this.id,
      required this.cutprice,
      required this.packages,
      required this.name,
      required this.price,
      required this.sampletype,
      required this.fastingrequired,
      required this.tubetype,
      required this.packagesinclude,
      required this.description,
      required this.info});
  String cutprice;
  String id;
  String packages;
  String name;
  String price;
  String sampletype;
  String fastingrequired;
  String tubetype;
  String packagesinclude;
  String description;
  String info;

  factory lab_cartmodel2.fromJson(Map<String, dynamic> json) => lab_cartmodel2(
      id: json["id"],
      cutprice: json["cutprice"],
      packages: json["packages"],
      name: json[" name"],
      price: json["price"],
      sampletype: json["SampleType"],
      fastingrequired: json["FastingRequired"],
      tubetype: json["TubeType"],
      packagesinclude: json["PackagesInclude"],
      description: json["Description"],
      info: json["info"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "cutprice": cutprice,
        "packages": packages,
        "name": name,
        "price": price,
        "sampletype": sampletype,
        "fastingrequired": fastingrequired,
        "tubetype": tubetype,
        "packagesinclude": packagesinclude,
        "description": description,
        "info": info
      };
}
