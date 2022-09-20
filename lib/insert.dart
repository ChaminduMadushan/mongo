import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:mongo/MongoDBModel.dart';
import 'package:mongo/mongoose.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class MongoDbInsert extends StatefulWidget {
  const MongoDbInsert({super.key});

  @override
  State<MongoDbInsert> createState() => _MongoDbInsertState();
}

class _MongoDbInsertState extends State<MongoDbInsert> {
  var fnamecontroller = new TextEditingController();
  var lnamecontroller = new TextEditingController();
  var addresscontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              "Insert Data",
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
              controller: fnamecontroller,
              decoration: InputDecoration(labelText: "First Name"),
            ),
            TextField(
              controller: lnamecontroller,
              decoration: InputDecoration(labelText: "Last Name"),
            ),
            TextField(
              controller: addresscontroller,
              minLines: 3,
              maxLines: 5,
              decoration: InputDecoration(labelText: "address "),
            ),
            Row(
              children: [
                OutlinedButton(
                    onPressed: () {
                      _fakeDate();
                    },
                    child: Text('Genarate Date')),
                ElevatedButton(
                  onPressed: () {
                    _insertDate(fnamecontroller.text, lnamecontroller.text,
                        addresscontroller.text);
                  },
                  child: Text('Insert DATA'),
                )
              ],
            )
          ],
        ),
      )),
    );
  }

  Future<void> _insertDate(String fname, String lname, String address) async {
    var _id = M.ObjectId();
    final data = MongoDbModel(
        id: "", fisrtname: fname, lastname: lname, address: address);
    var result = await MongoDatabase.insert(data);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Inserted ID' + _id.$oid)));
    _clearAll();
  }

  void _clearAll() {
    fnamecontroller.text = "";
    lnamecontroller.text = "";
    addresscontroller.text = "";
  }

  void _fakeDate() {
    setState(() {
      fnamecontroller.text = faker.person.firstName();
      lnamecontroller.text = faker.person.lastName();
      addresscontroller.text =
          faker.address.streetName() + "\n" + faker.address.streetAddress();
    });
  }
}
