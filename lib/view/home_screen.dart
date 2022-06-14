import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/const.dart';
import 'package:model/model/myname.dart';

import '../controller/controller.dart';
import 'data_screen.dart';
import 'getdata.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  IncrementController incrementController = Get.find();

  List<MyName> data = [];

  getData() async {
    data = (await ItemData().getProduct()).cast<MyName>();
    setState(
      () {
        data;
      },
    );
  }

  var userMap = {};

  searchUser(String? name) async {
    await mainTaskCollection
        .where('name', isGreaterThanOrEqualTo: name)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
      });
    });
  }

  TextEditingController search = TextEditingController();

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                search.text = value;
              });
              searchUser(search.text);
            },
            controller: search,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  searchUser(search.text);
                },
                icon: Icon(Icons.search),
              ),
            ),
          ),
          userMap.isEmpty ? Container() : Text('${userMap['name']}'),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey,
                  child: Column(
                    children: [
                      Text('${data[index].name}'),
                      Text('${data[index].firstName}'),
                      Text('${data[index].uid}'),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => DataScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
