import 'dart:convert';

address_model address_modelFromJson(String str) =>
    address_model.fromJson(json.decode(str));

String address_modelToJson(address_model data) => json.encode(data.toJson());

class address_model {
  address_model({
    required this.id,
    required this.name,
    required this.useraddress,
    required this.phone,
    required this.pincode,
  });
  String name;
  String id;
  String useraddress;
  String phone;
  String pincode;

  factory address_model.fromJson(Map<String, dynamic> json) => address_model(
        id: json["id"],
        name: json["Customer Name"],
        useraddress: json["address"],
        phone: json["phone"],
        pincode: json["pincode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Customer Name": name,
        "address": useraddress,
        "phone": phone,
        "pincode": pincode,
      };
}
