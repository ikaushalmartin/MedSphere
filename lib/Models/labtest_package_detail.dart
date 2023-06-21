import 'dart:convert';

labtest_packages labtest_packagesFromJson(String str) =>
    labtest_packages.fromJson(json.decode(str));

String labtest_packagesToJson(labtest_packages data) =>
    json.encode(data.toJson());

class labtest_packages {
  labtest_packages(
      {required this.id,
      required this.cutprice,
      required this.info,
      required this.name,
      required this.price,
      required this.sampletype,
      required this.fastingrequired,
      required this.tubetype,
      required this.packagesinclude,
      required this.description});

  String id;
  String cutprice;
  String info;
  String name;
  String price;
  String sampletype;
  String fastingrequired;
  String tubetype;
  String packagesinclude;
  String description;

  factory labtest_packages.fromJson(Map<String, dynamic> json) =>
      labtest_packages(
          id: json["id"],
          cutprice: json["cutprice"],
          info: json["info"],
          name: json["Name"],
          price: json["Price"],
          sampletype: json["SampleType"],
          fastingrequired: json["FastingRequired"],
          tubetype: json["TubeType"],
          packagesinclude: json["PackagesInclude"],
          description: json["Description"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "Cutprice": cutprice,
        "Info": info,
        "Name": name,
        "Price": price,
        "SampleType": sampletype,
        "FastingRequired": fastingrequired,
        "TubeType": tubetype,
        "PackagesInclude": packagesinclude,
        "Description": description
      };
}
