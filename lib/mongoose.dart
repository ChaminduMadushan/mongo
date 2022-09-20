import 'dart:developer';

import 'package:mongo/MongoDBModel.dart';
import 'package:mongo/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static var dbcollection;
  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    dbcollection = db.collection(COLLECTION);
  }

  static Future<String> insert(MongoDbModel data) async {
    try {
      var result = await dbcollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return " Data Inserted";
      } else {
        return "Something Wrong while iserting data";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
