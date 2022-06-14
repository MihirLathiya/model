import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

/// Collection Main

CollectionReference mainTaskCollection = firebaseFirestore.collection('user');
