import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:roadman_vegi/Controller/seller_auth_controller.dart';
import 'package:roadman_vegi/Models/add_cart_model.dart';
import 'package:roadman_vegi/Models/buyer_model.dart';
import 'package:roadman_vegi/Models/product_model.dart';

class MycoustomerController extends GetxController {
  final SellerAuthController sellerAuth = Get.put(SellerAuthController());

  Rx<List<BuyerModel>> myCoustomerlist = Rx<List<BuyerModel>>();
  List<BuyerModel> get myCoustomer => myCoustomerlist.value;

  Rx<List<AddCartModel>> myCoustomerproductlist = Rx<List<AddCartModel>>();
  List<AddCartModel> get myCoustomerproduct => myCoustomerproductlist.value;

  Future getcoustomer() async {
    myCoustomerlist.bindStream(mycoustmoerStream());
  }

  Future getcoustomerproduct(id) async {
    myCoustomerproductlist.bindStream(coustomerproductStream(id));
  }

  Stream<List<BuyerModel>> mycoustmoerStream() {
    print("show my coustomer");
    print("id: ${sellerAuth.firebaseAuth.currentUser.uid}");
    return FirebaseFirestore.instance
        .collection('Seller_store')
        .doc(sellerAuth.firebaseAuth.currentUser.uid)
        .collection('customers')
        .snapshots()
        .map((QuerySnapshot query) {
      List<BuyerModel> retVal = List();
      for (var element in query.docs) {
        retVal.add(BuyerModel.fromdocumentsnapshot(element));
      }

      print('Add Coustomer ${retVal.length}');
      return retVal;
    });
  }

  Stream<List<AddCartModel>> coustomerproductStream(id) {
    print("coustomer product show");
    print("id: ${sellerAuth.firebaseAuth.currentUser.uid}");
    return FirebaseFirestore.instance
        .collection('Seller_store')
        .doc(sellerAuth.firebaseAuth.currentUser.uid)
        .collection('customers')
        .doc(id)
        .collection("cart")
        .snapshots()
        .map((QuerySnapshot query) {
      List<AddCartModel> retVal = List();
      for (var element in query.docs) {
        retVal.add(AddCartModel.fromDocumentSnapshot(element));
      }

      print('Product ${retVal.length}');
      return retVal;
    });
  }
}
