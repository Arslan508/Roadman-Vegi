import 'package:cloud_firestore/cloud_firestore.dart';

class SellerModel {
  String city;
  String closingTime;
  String id;
  String openingTime;
  String firstName;
  String lastName;
  GeoPoint location;
  String storeName;
  String sellerAdress;
  String contactNo;
  SellerModel(
      {this.city,
      this.closingTime,
      this.firstName,
      this.id,
      this.lastName,
      this.location,
      this.openingTime,
      this.contactNo,
      this.sellerAdress,
      this.storeName});
  SellerModel.fromdocumentsnapshot(DocumentSnapshot snapshot) {
    city = snapshot.data()["city"] ?? "";
    closingTime = snapshot.data()["closingTime"] ?? "";
    firstName = snapshot.data()["firstName"] ?? "";
    lastName = snapshot.data()["lastName"] ?? "";
    location = snapshot.data()["location"] ?? const GeoPoint(0.0, 0.0);
    openingTime = snapshot.data()["openingTime"] ?? "";
    id = snapshot.id;
    sellerAdress = snapshot.data()["sellerAdress"] ?? "";
    storeName = snapshot.data()["storeName"] ?? "";
    contactNo = snapshot.data()["contactNo"] ?? "";
  }

  // static SellerModel fromDocumentSnapshot(QueryDocumentSnapshot element) {}
}
