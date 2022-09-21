// ignore_for_file: file_names, unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, await_only_futures

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roadman_vegi/Controller/add_cart_controller.dart';
import 'package:roadman_vegi/Controller/my_coustomer_controller.dart';
import 'package:roadman_vegi/Controller/mystore.dart';
import 'package:roadman_vegi/Controller/product_controller.dart';
import 'package:roadman_vegi/Controller/sales_controller.dart';
import 'package:roadman_vegi/Controller/seller_auth_controller.dart';
import 'package:roadman_vegi/Controller/seller_controller.dart';
import 'package:roadman_vegi/Models/changecolor.dart';
import 'package:roadman_vegi/Screen/AddProductScreen.dart';
import 'package:roadman_vegi/Screen/AddProductScreenTwo.dart';
import 'package:roadman_vegi/Screen/CongrationsScreen.dart';
import 'package:roadman_vegi/Screen/first_screen.dart';
import 'package:roadman_vegi/Screen/StoreDetailsScreen.dart';
import 'package:roadman_vegi/Screen/my_customer_seller.dart';
import 'package:roadman_vegi/Screen/my_sales.dart';
import 'package:roadman_vegi/Screen/my_store.dart';

class SellerDrawerScreen extends StatefulWidget {
  const SellerDrawerScreen({Key key}) : super(key: key);

  @override
  State<SellerDrawerScreen> createState() => _SellerDrawerScreenState();
}

class _SellerDrawerScreenState extends State<SellerDrawerScreen> {
  final MyStoreController myStoreController = Get.put(MyStoreController());

  final productController = Get.put(ProductController());

  final SellerAuthController sellerAuthController =
      Get.put(SellerAuthController());
  final ProductController pController = Get.put(ProductController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final SellerController sellerController = Get.put(SellerController());
  final AddCartController addCartController = Get.put(AddCartController());
  final MycoustomerController myCustomerController =
      Get.put(MycoustomerController());

  // finalGet.put(SalesController());
  @override
  void initState() {
    pController.getSellerproducts();
    myCustomerController.getcoustomer();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Changecolor changecolor = Changecolor();
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.0,
              ),
              ClipRRect(
                child: Center(
                  child: ClipRRect(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: Image.asset(
                            'assets/splashlogo.png',
                            width: 120,
                            height: 120,
                          ),
                        ),
                        Center(
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            leading: Container(
                              decoration: BoxDecoration(),
                              margin: EdgeInsets.symmetric(horizontal: 3.0),
                              child: ClipRRect(
                                child: Icon(
                                  Icons.production_quantity_limits,
                                ),
                              ),
                            ),
                            title: Text(
                              ' Product',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            trailing: Icon(
                              CupertinoIcons.forward,
                            ),
                          ),
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: ListTile(
                            onTap: () async {
                              await sellerAuthController.getSeller();
                              Get.to(MyStore());
                            },
                            leading: Container(
                              decoration: BoxDecoration(),
                              margin: EdgeInsets.symmetric(horizontal: 3.0),
                              child: ClipRRect(
                                child: Icon(
                                  Icons.store,
                                ),
                              ),
                            ),
                            title: Text(
                              'My Store',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            trailing: Icon(
                              CupertinoIcons.forward,
                            ),
                          ),
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: ListTile(
                            onTap: () async {
                              await myCustomerController.getcoustomer();
                              Get.to(MyCoustomerSeller());
                            },
                            leading: Container(
                              decoration: BoxDecoration(),
                              margin: EdgeInsets.symmetric(horizontal: 3.0),
                              child: ClipRRect(
                                child: Icon(
                                  Icons.shop,
                                ),
                              ),
                            ),
                            title: Text(
                              'My Customer',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            trailing: Icon(
                              CupertinoIcons.forward,
                            ),
                          ),
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: ListTile(
                            onTap: () async {
                              await sellerAuthController.getSeller();
                              Get.to(MySales());
                            },
                            leading: Container(
                              decoration: BoxDecoration(),
                              margin: EdgeInsets.symmetric(horizontal: 3.0),
                              child: ClipRRect(
                                child: Icon(
                                  Icons.sailing_sharp,
                                ),
                              ),
                            ),
                            title: Text(
                              'My Sales',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            trailing: Icon(
                              CupertinoIcons.forward,
                            ),
                          ),
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: ListTile(
                            onTap: () {
                              sellerAuthController.firebaseAuth.signOut().then(
                                  (value) => Get.to(AddProductScreenTwo()));
                            },
                            leading: Container(
                              decoration: BoxDecoration(),
                              margin: EdgeInsets.symmetric(horizontal: 3.0),
                              child: ClipRRect(
                                child: Icon(
                                  Icons.logout,
                                ),
                              ),
                            ),
                            title: Text(
                              'Add Product',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            trailing: Icon(
                              CupertinoIcons.forward,
                            ),
                          ),
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: ListTile(
                            onTap: () {
                              sellerAuthController.firebaseAuth
                                  .signOut()
                                  .then((value) => Get.to(LoginScreen()));
                            },
                            leading: Container(
                              decoration: BoxDecoration(),
                              margin: EdgeInsets.symmetric(horizontal: 3.0),
                              child: ClipRRect(
                                child: Icon(
                                  Icons.logout,
                                ),
                              ),
                            ),
                            title: Text(
                              'Logout',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            trailing: Icon(
                              CupertinoIcons.forward,
                            ),
                          ),
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            leading: Container(
                              decoration: BoxDecoration(),
                              margin: EdgeInsets.symmetric(horizontal: 3.0),
                              child: ClipRRect(
                                child: Icon(
                                  Icons.close,
                                ),
                              ),
                            ),
                            title: Text(
                              'Close',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            trailing: Icon(
                              CupertinoIcons.forward,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.amber,
                    spreadRadius: 0,
                    blurRadius: 0,
                    offset: Offset(0, -8), // changes position of shadow
                  ),
                ],
              ),
              child: Obx(
                () => Text(
                  sellerAuthController.seller.firstName == null
                      ? "Seller"
                      : sellerAuthController.seller.firstName,
                  style: TextStyle(
                      color: Colors.grey[850],
                      fontFamily: 'Poppins-Medium',
                      fontSize: 23),
                ),
              )),
          centerTitle: true,
          leadingWidth: 68,
          leading: GestureDetector(
            onTap: () {
              scaffoldKey.currentState.openDrawer();
            },
            child: Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(30)),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Icon(
                Icons.grid_view_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GetX<ProductController>(
                  init: Get.put<ProductController>(ProductController()),
                  builder: (ProductController proController) {
                    //print(proController);
                    if (proController != null &&
                        proController.sellerProductList.value != null) {
                      return SizedBox(
                        //height: MediaQuery.of(context).size.height * 0.100,
                        height: MediaQuery.of(context).size.height - 200,
                        //width: MediaQuery.of(context).size.width / 10,
                        child: ListView.builder(
                            itemCount:
                                proController.sellerProductList.value.length,
                            itemBuilder: (context, index) {
                              // productController.priceController =
                              //     TextEditingController(
                              //         text: proController
                              //             .sellerProducts[index].price
                              //             .toString());

                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  child: Container(
                                    height: 70,
                                    width: 42,
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            proController.sellerProductList
                                                .value[index].image),
                                      ),
                                      title: Text(proController
                                          .sellerProductList.value[index].name),
                                      trailing: IconButton(
                                          onPressed: () {
                                            proController.deletProduct(
                                                proController.sellerProductList
                                                    .value[index].id);
                                          },
                                          icon: Icon(
                                            CupertinoIcons.delete_simple,
                                            color: Colors.red,
                                            size: 20,
                                          )),
                                      subtitle: Row(
                                        children: [
                                          Text(
                                            "Price : ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(proController.sellerProductList
                                              .value[index].price
                                              .toString()),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Weight : ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                              "${proController.sellerProductList.value[index].weight.toString()} Kg"),
                                        ],
                                      ),
                                      //  SizedBox(
                                      //   width: 100,
                                      //   height: 35,
                                      //   child: TextField(
                                      //     decoration: InputDecoration(
                                      //         //  hintText: "Price",
                                      //         ),
                                      //     keyboardType: TextInputType.number,
                                      //     controller:
                                      //         productController.priceController,
                                      //   ),
                                      // ),
                                      onTap: () {
                                        showMyDialog(proController
                                            .sellerProductList.value[index].id);
                                      },
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              // SizedBox(
              //   height: 5,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [

              //   ],
              // )
            ],
          ),
        ),
        floatingActionButton: Container(
          height: 35,
          width: 120,
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            onPressed: () {
              Get.to(AddProductScreenTwo());
            },
            child: Text(
              'Add Product',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> showMyDialog(id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Price & Weight'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    hintText: "Price",
                    hintStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                  ),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  keyboardType: TextInputType.number,
                  controller: productController.priceController,
                ),
                Divider(),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Weight",
                    hintStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                  ),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  keyboardType: TextInputType.number,
                  controller: productController.enterweight,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () async {
                print(productController.priceController.text);
                print(productController.enterweight.text);
                await productController.updateProduct(
                    id,
                    productController.priceController.text,
                    productController.enterweight.text);
                // Navigator.of(context).pop();
                productController.priceController.clear();
                productController.enterweight.clear();
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
                productController.priceController.clear();
              },
            ),
          ],
        );
      },
    );
  }
}
