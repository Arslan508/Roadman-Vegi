// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roadman_vegi/Controller/Textcontroller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:roadman_vegi/Controller/seller_auth_controller.dart';
import 'package:roadman_vegi/Models/seller_model.dart';

final firebaseFirestore = FirebaseFirestore.instance;
final SellerAuthController sellerAuthController =
    Get.put(SellerAuthController());

class MyStoreController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController storeNameContorller = TextEditingController();
}
