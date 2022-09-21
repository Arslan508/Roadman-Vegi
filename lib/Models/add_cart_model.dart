import 'package:cloud_firestore/cloud_firestore.dart';

class AddCartModel {
  String productId;
  String productImg;
  double productPrice;
  double productWeight;
  String productName;
  double selectedQuantity;
  bool isSelected;
  AddCartModel({
    this.productId,
    this.productImg,
    this.productPrice,
    this.productWeight,
    this.productName,
    this.selectedQuantity,
    this.isSelected,
  });
  AddCartModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    productName = snapshot.data()["productName"] ?? "";
    productId = snapshot.id;
    productPrice = snapshot.data()["productPrice"] ?? "";
    productWeight = snapshot.data()["productWeight"] ?? 0.0;
    productImg = snapshot.data()["productImg"] ?? "";
    selectedQuantity = snapshot.data()["selectedQuantity"] ?? 0.0;
    isSelected = snapshot.data()["isSelected"] ?? false;
  }
}
