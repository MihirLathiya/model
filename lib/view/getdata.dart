import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:model/const.dart';
import 'package:model/model/myname.dart';

class ItemData {
  // static final CollectionReference collectionReference =
  //     FirebaseFirestore.instance.collection('add_item');

  Future<List<MyName>> getProduct() async {
    List<MyName> listData = [];
    await FirebaseFirestore.instance.collection('user').get().then(
      (value) {
        value.docs.forEach(
          (element) {
            MyName data = MyName.fromJson(element.data());
            listData.add(data);
          },
        );
      },
    );
    return listData;
  }
}
