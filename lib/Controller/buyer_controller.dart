import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:roadman_vegi/Controller/buyer_auth_contorller.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:roadman_vegi/Controller/seller_controller.dart';
import 'package:roadman_vegi/Screen/Seller_store_show.dart';

final buyerAuth = Get.put(BuyerAuthController());

class BuyerController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController buyerAddressController =
      TextEditingController(text: 'Location');
  // TextEditingController  = TextEditingController();
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  String buyersAddress;
  String placeName;
  Future<void> saveBuyer() async {
    print(buyerAuth.firebaseAuth.currentUser?.uid);
    try {
      await fireStore
          .collection("Buyers")
          .doc(buyerAuth.firebaseAuth.currentUser.uid)
          .set({
        "firstName": firstName.text,
        "lastName": lastName.text,
        "buyerId": buyerAuth.firebaseAuth.currentUser.uid,
        "contactNo": phoneController.text,
        "location": GeoPoint(
          latitude.value,
          longitude.value,
        ),
        "buyerAdress": "$placeName:$buyersAddress",
      }).then((value) => Get.to(const BuyerHomeScreen()));
    } catch (e) {
      Get.snackbar("Erorr", e.toString());
    }
  }
}
