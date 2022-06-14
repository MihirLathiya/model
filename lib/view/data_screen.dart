import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:model/const.dart';

import '../model/myname.dart';

class DataScreen extends StatefulWidget {
  DataScreen({Key? key}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  TextEditingController name = TextEditingController();

  TextEditingController firstName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: name,
          ),
          TextField(
            controller: firstName,
          ),
          ElevatedButton(
              onPressed: () {
                addData();
                name.clear();
                firstName.clear();
              },
              child: Icon(Icons.add))
        ],
      ),
    );
  }

  addData() async {
    DocumentReference doc = mainTaskCollection.doc();
    MyName myName = MyName(
      name: name.text,
      firstName: firstName.text,
      uid: doc.id,
    );

    await doc.set(myName.toJson());
  }
}
