import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roadman_vegi/Controller/buyer_auth_contorller.dart';
import 'package:roadman_vegi/Controller/sales_controller.dart';
import 'package:roadman_vegi/Controller/seller_auth_controller.dart';
import 'package:roadman_vegi/Controller/seller_controller.dart';
import 'package:roadman_vegi/Models/Listimages.dart';
import 'package:roadman_vegi/Models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:roadman_vegi/Models/sales_model.dart';
import 'package:roadman_vegi/Models/seller_model.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;
final SellerAuthController sellerAuthController =
    Get.put(SellerAuthController());
final BuyerAuthController buyerAuthController = Get.put(BuyerAuthController());

class ProductController extends GetxController {
  Rx<List<ProductModel>> productList = Rx<List<ProductModel>>();
  List<ProductModel> get products => productList.value;

  Rx<List<ProductModel>> sellerProductList = Rx<List<ProductModel>>();
  List<ProductModel> get sellerProducts => sellerProductList.value;

  RxList<SellerModel> sellerStoreList = RxList<SellerModel>();
  List<SellerModel> get sellerStore => sellerStoreList.value;

  RxList<ProductController> sellerShowProduct = RxList<ProductController>();
  List<ProductController> get sellerShow => sellerShowProduct.value;

  List<ProductModel> selecteditem = <ProductModel>[];

  List<SalesModel> checkhistroy = <SalesModel>[];

  TextEditingController priceController = TextEditingController();
  TextEditingController enterweight = TextEditingController();
  @override
  void onInit() {
    productList.bindStream(allProductStream());

    sellerStoreList.bindStream(sellerStoreStream());

    //  sellerProductList.bindStream(sellerProductStream());
    //sellerShowProduct.bindStream(sellershowstream(S));
    super.onInit();
  }

  getSellerproducts() {
    sellerProductList.bindStream(sellerProductStream());
  }

  getSellerproductsCustom(id) {
    sellerProductList.bindStream(sellerProductStreamCustom(id));
  }

  // Future<void> getAgencyRoute(id) async {
  //   priceController.bindStream(routStreamBus(id));
  // }

  Stream<List<ProductController>> sellershowstream(id) {
    return FirebaseFirestore.instance
        .collection('Seller_store')
        .where('id', isEqualTo: id)
        .where("sales", isEqualTo: '')
        .snapshots()
        .map((QuerySnapshot query) {
      List<ProductController> retVal = [];
      query.docs.forEach((element) {
        retVal.add(ProductController.fromSnapshot(element));
      });
      print("lenght${retVal.length}");
      return retVal;
    });
  }

  Stream<List<SellerModel>> sellerStoreStream() {
    print("enter in all sellar store stream funtion");
    return firestore
        .collection('Seller_store')
        .snapshots()
        .map((QuerySnapshot query) {
      List<SellerModel> retVal = [];
      query.docs.forEach((element) {
        retVal.add(SellerModel.fromdocumentsnapshot(element));
      });

      print('product lenght is ${retVal.length}');
      return retVal;
    });
  }

  // void getSellerProduct() {
  //   sellerProductList.bindStream(sellerProductStream());
  // }

  Future<void> deletProduct(id) async {
    await fireStore
        .collection("Seller_store")
        .doc(sellerAuthController.firebaseAuth.currentUser.uid)
        .collection('products')
        .doc(id)
        .delete()
        .then((value) => Get.snackbar("Success", "Product Deleted !"));
  }

  Future<void> updateProduct(id, newPrice, newweight) async {
    await fireStore
        .collection("Seller_store")
        .doc(sellerAuthController.firebaseAuth.currentUser.uid)
        .collection('products')
        .doc(id)
        .update({
      "price": double.parse(newPrice),
      "weight": double.parse(newweight)
    }).then((value) {
      Get.back();
      Get.snackbar("Success", "Product price updated");
    });
  }

  Stream<List<ProductModel>> allProductStream() {
    print("enter in all purchase stream funtion");
    return firestore
        .collection('vegitables')
        .snapshots()
        .map((QuerySnapshot query) {
      List<ProductModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(ProductModel.fromDocumentSnapshot(element));
      });

      print('product lenght is ${retVal.length}');
      return retVal;
    });
  }

  Stream<List<ProductModel>> sellerProductStream() {
    print("enter in all purchase stream funtion");
    return firestore
        .collection('Seller_store')
        .doc(sellerAuth.firebaseAuth.currentUser.uid)
        .collection('products')
        .snapshots()
        .map((QuerySnapshot query) {
      List<ProductModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(ProductModel.fromDocumentSnapshot(element));
      });

      print('seller prodcuts lenght is ${retVal.length}');
      return retVal;
    });
  }

  Stream<List<ProductModel>> sellerProductStreamCustom(id) {
    print("enter in all purchase stream funtion");
    return firestore
        .collection('Seller_store')
        .doc(id)
        .collection('products')
        .snapshots()
        .map((QuerySnapshot query) {
      List<ProductModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(ProductModel.fromDocumentSnapshot(element));
      });

      print('seller prodcuts lenght is ${retVal.length}');
      return retVal;
    });
  }

  List<Listimages> productlist = [
    Listimages(
        price: 0.0,
        id: 1,
        isSelected: false,
        ProductImage: 'assets/tomato.jpg',
        ProductName: "Tomato ( ٹماٹر )",
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 2,
        ProductImage: "assets/lemon.jpg",
        isSelected: false,
        ProductName: "Lemon ( لیموں )",
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 3,
        ProductImage: 'assets/eggplant.jpg',
        isSelected: false,
        ProductName: "Eggplant  (بینگن)",
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 4,
        ProductImage: 'assets/babycorn.jpg',
        isSelected: false,
        ProductName: "Baby corn  (مکئی)",
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 5,
        ProductImage: 'assets/patato.jpg',
        isSelected: false,
        ProductName: "Patato  (آلو)",
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 6,
        isSelected: false,
        ProductImage: 'assets/beans.png',
        ProductName: "Beans  (پھلیاں )",
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 7,
        isSelected: false,
        ProductImage: 'assets/bittergourd.jpg',
        ProductName: "Bitter Gourd  (کریلا )",
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 8,
        ProductImage: 'assets/cabbage.jpg',
        isSelected: false,
        ProductName: "Cabbage (بند گوبھی )",
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 9,
        ProductImage: 'assets/Broccoli.jpg',
        isSelected: false,
        ProductName: "Broccoli  (بروکولی )",
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 10,
        ProductImage: 'assets/cauliflower.jpg',
        ProductName: "Cauliflower  (گوبھی )",
        isSelected: false,
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 11,
        ProductImage: 'assets/cucumber.jpg',
        ProductName: "Cucumber  ( کھیرا )",
        isSelected: false,
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 12,
        ProductImage: 'assets/cucumberTwo.jpg',
        ProductName: "Cucumber  (کھیرا )",
        isSelected: false,
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 13,
        ProductImage: 'assets/applegourd.jpg',
        isSelected: false,
        ProductName: "Applegourd  ( ٹنڈے )",
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 14,
        ProductImage: 'assets/drumstick.jpg',
        ProductName: "Drumstick  (چوب نقارہ)",
        isSelected: false,
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 15,
        ProductImage: 'assets/curryleaves.jpg',
        ProductName: "curry (کری پتے)",
        isSelected: false,
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 16,
        ProductImage: 'assets/garlic.jpg',
        isSelected: false,
        ProductName: "Garlic  (لہسن)",
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 17,
        ProductImage: 'assets/ginger.jpg',
        isSelected: false,
        ProductName: "Ginger  (ادرک)",
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 18,
        ProductImage: 'assets/glueberry.jpg',
        isSelected: false,
        ProductName: "Glueberry  (نیل بیری)",
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 19,
        ProductImage: 'assets/greenchilli.jpg',
        ProductName: "Green chilli  (ہری مرچ)",
        Select_Icon: Icons.favorite,
        isSelected: false,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 20,
        ProductImage: 'assets/redchilli.jpg',
        isSelected: false,
        ProductName: "Red chilli  (لال مرچ)",
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 21,
        ProductImage: 'assets/beetroot.jpg',
        ProductName: "Beetroot  (چقندر)",
        Select_Icon: Icons.favorite,
        isSelected: false,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 22,
        ProductImage: 'assets/bottalgourd.jpg',
        ProductName: "Bottal Gourd (لوکی)",
        isSelected: false,
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 23,
        ProductImage: 'assets/coriander.jpg',
        ProductName: "Coriander  (ہرا دھنیا)",
        Select_Icon: Icons.favorite,
        isSelected: false,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 24,
        ProductImage: 'assets/cucumismelo.jpg',
        ProductName: "Cucumis Melo  (پیٹھا)",
        isSelected: false,
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 25,
        isSelected: false,
        ProductImage: 'assets/greencapsicum.jpg',
        ProductName: "Capsicum(شملہ مرچ)",
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 26,
        ProductImage: 'assets/okra.jpg',
        isSelected: false,
        ProductName: "Okra  (بھنڈی توری)",
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 27,
        ProductImage: 'assets/onion.jpg',
        ProductName: "Onion  (پیاز)",
        Select_Icon: Icons.favorite,
        isSelected: false,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 28,
        isSelected: false,
        ProductImage: 'assets/peeledgarlic.jpg',
        ProductName: "Peeled (چھلکا ہوا لہسن)",
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 29,
        isSelected: false,
        ProductImage: 'assets/orangecarrott.jpg',
        ProductName: "Orang Carrot (گاجر)",
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 30,
        isSelected: false,
        ProductImage: 'assets/pumpkingreen.jpg',
        ProductName: "Pumpkin Green (کدو )",
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 31,
        isSelected: false,
        ProductImage: 'assets/redcabbage.jpg',
        ProductName: "Cabbage(بند گوبھی)",
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 32,
        ProductImage: 'assets/yam.jpg',
        isSelected: false,
        ProductName: "Yam  (شکرقندی)",
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 33,
        isSelected: false,
        ProductImage: 'assets/redcapsicum.jpg',
        ProductName: "Capsicum (شملہ مرچ)",
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 34,
        isSelected: false,
        ProductImage: 'assets/spinach.jpg',
        ProductName: "Spinach (پالک)",
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 35,
        ProductImage: 'assets/zucchini.jpg',
        isSelected: false,
        ProductName: "Zucchini (دیسی توریہ)",
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
    Listimages(
        price: 0.0,
        id: 36,
        isSelected: false,
        ProductImage: 'assets/mint.jpg',
        ProductName: "Mint (پودینہ,)",
        Select_Icon: Icons.favorite,
        ProductDetails: "Good Product"),
  ];

  static ProductController fromSnapshot(QueryDocumentSnapshot element) {}
}
