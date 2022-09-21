// ignore_for_file: unused_import, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:roadman_vegi/Models/product_model.dart';

class SalesModel {
  String id;
  double price;
  double weight;
  String name;
  Timestamp dateTime;
  SalesModel({this.id, this.name, this.price, this.weight, this.dateTime});
  SalesModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.data()["id"] ?? "";
    name = snapshot.data()["name"] ?? "";
    price = snapshot.data()["price"] ?? 0.0;
    weight = snapshot.data()["weight"] ?? 0.0;
    dateTime = snapshot.data()["dateTime"] ?? Timestamp.now();
  }
}
