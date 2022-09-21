import 'package:cloud_firestore/cloud_firestore.dart';

class BuyerModel {
  String buyerAdress;
  String buyerId;
  String contactNo;
  String firstName;
  String lastName;
  GeoPoint location;
  BuyerModel(
      {this.buyerAdress,
      this.buyerId,
      this.contactNo,
      this.firstName,
      this.lastName,
      this.location});
  BuyerModel.fromdocumentsnapshot(DocumentSnapshot snapshot) {
    buyerAdress = snapshot.data()["buyerAdress"] ?? "";
    buyerId = snapshot.id;
    contactNo = snapshot.data()["contactNo"] ?? "";
    firstName = snapshot.data()["firstName"] ?? "";
    lastName = snapshot.data()["lastName"] ?? "";
    location = snapshot.data()["location"] ?? const GeoPoint(0.0, 0.0);
  }
}
