import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:roadman_vegi/Controller/buyer_profile_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:roadman_vegi/Controller/seller_auth_controller.dart';
import 'package:roadman_vegi/Models/sales_model.dart';

class SalesController extends GetxController {
  TextEditingController customerName = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  TextEditingController qty = TextEditingController();
  final sellerAuth = Get.put(SellerAuthController());
  final salemodel = Get.put(SalesModel());
  var id = ''.obs;
  var weight = 0.0.obs;
//sales model
  Rx<List<SalesModel>> saleProductList = Rx<List<SalesModel>>();
  List<SalesModel> get saleProducts => saleProductList.value;

  @override
  void onInit() {
    //saleProductList.bindStream(sellerProductStream());

    super.onInit();
  }

  Future getsellerproduct() async {
    saleProductList.bindStream(sellerProductStream());
  }

  Stream<List<SalesModel>> sellerProductStream() {
    print("histry");
    return FirebaseFirestore.instance
        .collection('Seller_store')
        .doc(sellerAuth.firebaseAuth.currentUser.uid)
        .collection('sales')
        .snapshots()
        .map((QuerySnapshot query) {
      List<SalesModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(SalesModel.fromDocumentSnapshot(element));
      });

      print('seller prodcuts lenght is ${retVal.length}');
      return retVal;
    });
  }

  DateTime selectedDate;
  var selectedProductValue = "".obs;
  var productValue;
  Future<void> addSales() async {
    try {
      await FirebaseFirestore.instance
          .collection("Seller_store")
          .doc(sellerAuth.firebaseAuth.currentUser.uid)
          .collection("sales")
          .add({
            "date": selectedDate,
            "customerName": customerName.text,
            "productName": selectedProductValue.value,
            "productPrice": productPrice.text,
            "productQuantity": qty.text
          })
          .then((value) => FirebaseFirestore.instance
              .collection("Seller_store")
              .doc(sellerAuth.firebaseAuth.currentUser.uid)
              .collection("products")
              .doc(id.value)
              .update({"weight": weight.value - double.parse(qty.text)}))
          .then((value) => Get.snackbar("Success", "Sales Added"));
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
