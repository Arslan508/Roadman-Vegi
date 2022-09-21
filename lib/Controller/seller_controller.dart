import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';
import 'package:roadman_vegi/Controller/product_controller.dart';
import 'package:roadman_vegi/Controller/seller_auth_controller.dart';
import 'package:roadman_vegi/Models/seller_model.dart';
import 'package:roadman_vegi/Screen/AddProductScreen.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';

final fireStore = FirebaseFirestore.instance;
final sellerAuth = Get.put(SellerAuthController());
final productController = Get.put(ProductController());

class SellerController extends GetxController {
  TextEditingController openTimeController1 = TextEditingController();
  TextEditingController closeTimeController2 = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController storeName = TextEditingController();
  TextEditingController storeAddress = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController physicalStore = TextEditingController();
  TextEditingController specificTiming = TextEditingController();
  TextEditingController allDays = TextEditingController();
  // TextEditingController OpeningTiming = TextEditingController();
  // TextEditingController CloseTiming = TextEditingController();

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  RxString physicalStoreGroupValue = "".obs;
  RxString timingGroupValue = "".obs;

  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  String shopAddress;
  String placeName;

  Future<void> saveSeller() async {
    print(sellerAuth.firebaseAuth.currentUser?.uid);
    try {
      await fireStore
          .collection("Seller_store")
          .doc(sellerAuth.firebaseAuth.currentUser.uid)
          .set({
        "firstName": firstName.text,
        "lastName": lastName.text,
        "storeName": storeName.text,
        "city": city.text,
        "isPhysicalStore":
            physicalStoreGroupValue.value == "Yes" ? true : false,
        "openingTime": openTimeController1.text,
        "closingTime": closeTimeController2.text,
        "sellerId": sellerAuth.firebaseAuth.currentUser.uid,
        "contactNo": phoneController.text,
        "location": GeoPoint(latitude.value, longitude.value),
        "sellerAdress": "$placeName:$shopAddress"
      }).then((value) => Get.to(const AddProductScreen()));
    } catch (e) {
      Get.snackbar("Erorr", e.toString());
    }
  }

  Future<void> saveProducts() async {
    try {
      for (int i = 0; i < productController.selecteditem.length; i++) {
        await fireStore
            .collection("Seller_store")
            .doc(sellerAuth.firebaseAuth.currentUser.uid)
            .collection("products")
            .doc(productController.selecteditem[i].id)
            .set({
          "name": productController.selecteditem[i].name,
          "image": productController.selecteditem[i].image,
          "price": productController.selecteditem[i].price,
          "weight": productController.selecteditem[i].weight,
          "id": productController.selecteditem[i].id,
          "isSelected": productController.selecteditem[i].isSelected
        });
      }
    } catch (e) {
      Get.snackbar("Erorr", e.toString());
    }
  }
}

Future<File> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load(path);

  final file = File('${(await getTemporaryDirectory()).path}/$path');
  await file.writeAsBytes(byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return file;
}
