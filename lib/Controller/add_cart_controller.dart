import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:roadman_vegi/Controller/buyer_auth_contorller.dart';
import 'package:roadman_vegi/Controller/seller_controller.dart';
import 'package:roadman_vegi/Models/add_cart_model.dart';

class AddCartController extends GetxController {
  final BuyerAuthController byerAuth = Get.put(BuyerAuthController());

  Rx<List<AddCartModel>> addcardlist = Rx<List<AddCartModel>>();
  List<AddCartModel> get buyerproductcard => addcardlist.value;

  @override
  void onInit() {
    super.onInit();
  }

  Future getCart() async {
    addcardlist.bindStream(addTocartStream());
  }

  Stream<List<AddCartModel>> addTocartStream() {
    print("add to card products");
    print("id: ${byerAuth.firebaseAuth.currentUser.uid}");
    return FirebaseFirestore.instance
        .collection('Buyers')
        .doc(byerAuth.firebaseAuth.currentUser.uid)
        .collection('add_to_cart')
        .snapshots()
        .map((QuerySnapshot query) {
      List<AddCartModel> retVal = List();
      for (var element in query.docs) {
        retVal.add(AddCartModel.fromDocumentSnapshot(element));
      }

      print('Add to cart lenght ${retVal.length}');
      return retVal;
    });
  }

  Future<void> addcart({
    productName,
    productPrice,
    productWeight,
    productImg,
    productsid,
    selectedQuantity,
    sellerId,
    buyerAddress,
    buyerName,
    buyerNo,
  }) async {
    try {
      print("id $productsid");
      await FirebaseFirestore.instance
          .collection("Buyers")
          .doc(byerAuth.firebaseAuth.currentUser.uid)
          .collection("add_to_cart")
          .doc(productsid)
          .set({
        "productName": productName,
        "productPrice": productPrice,
        "productWeight": productWeight,
        "productImg": productImg,
        "selectedQuantity": selectedQuantity,
        "isSelected": false
      })
          // .doc(id.value)
          // .update({"weight": weight.value - double.parse(qty.text)}))
          .then((value) => Get.snackbar("Success", "Added to cart "));
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString());
    }
  }

  Future checkOut(
      {sellerId,
      buyerName,
      buyerNo,
      buyerAddress,
      List<AddCartModel> productName,
      List<AddCartModel> productPrice,
      List<AddCartModel> productWeight,
      List<AddCartModel> productImg,
      List<AddCartModel> selectedQuantity,
      List<AddCartModel> productsid}) async {
    try {
      await FirebaseFirestore.instance
          .collection("Seller_store")
          .doc(sellerId)
          .collection("customers")
          .doc(byerAuth.firebaseAuth.currentUser.uid)
          .set({
        "customerId": byerAuth.firebaseAuth.currentUser.uid,
        "firstName": buyerName,
        "contactNo": buyerNo,
        "buyerAdress": buyerAddress
      }).then((value) async {
        for (int i = 0; i < productName.length; i++) {
          await FirebaseFirestore.instance
              .collection("Seller_store")
              .doc(sellerId)
              .collection("customers")
              .doc(byerAuth.firebaseAuth.currentUser.uid)
              .collection("cart")
              .add({
                "productName": productName[i].productName,
                "productPrice": productPrice[i].productPrice,
                "productWeight": productWeight[i].productWeight,
                "productImg": productImg[i].productImg,
                "selectedQuantity": selectedQuantity[i].selectedQuantity,
              })
              .then((value) => FirebaseFirestore.instance
                      .collection("Seller_store")
                      .doc(sellerId)
                      .collection("products")
                      .doc(productsid[i].productId)
                      .update({
                    "weight": productWeight[i].productWeight -
                        selectedQuantity[i].selectedQuantity
                  }))
              .then((value) {
                Get.snackbar("Success", "Checked out!");
              });
        }
      });
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
