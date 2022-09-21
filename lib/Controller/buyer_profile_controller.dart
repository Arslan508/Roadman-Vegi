import 'package:flutter/cupertino.dart';
import 'package:roadman_vegi/Controller/buyer_auth_contorller.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firebaseFirestore = FirebaseFirestore.instance;
final BuyerAuthController buyerAuthController = Get.put(BuyerAuthController());

class BuyerProfileController extends GetxController {
  TextEditingController buyerAdress = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController locationController = TextEditingController();
}
