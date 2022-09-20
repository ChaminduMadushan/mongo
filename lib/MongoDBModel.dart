// To parse this JSON data, do
//
//     final mongoDbModel = mongoDbModelFromJson(jsonString);

import 'dart:convert';

MongoDbModel mongoDbModelFromJson(String str) =>
    MongoDbModel.fromJson(json.decode(str));

String mongoDbModelToJson(MongoDbModel data) => json.encode(data.toJson());

class MongoDbModel {
  MongoDbModel({
    required this.id,
    required this.fisrtname,
    required this.lastname,
    required this.address,
  });

  String id;
  String fisrtname;
  String lastname;
  String address;

  factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
        id: json["id"],
        fisrtname: json["fisrtname"],
        lastname: json["lastname"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fisrtname": fisrtname,
        "lastname": lastname,
        "address": address,
      };
}
