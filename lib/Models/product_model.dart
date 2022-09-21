import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String id;
  String image;
  bool isSelected;
  String name;
  double price;
  double weight;
  ProductModel(
      {this.id,
      this.image,
      this.isSelected,
      this.name,
      this.price,
      this.weight});
  ProductModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.data()["id"] ?? "";
    image = snapshot.data()["image"] ?? "";
    isSelected = snapshot.data()["isSelected"] ?? false;
    name = snapshot.data()["name"] ?? "";
    price = snapshot.data()["price"] ?? 0.0;
    weight = snapshot.data()["weight"] ?? 0.0;
  }
}
