// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roadman_vegi/Controller/buyer_auth_contorller.dart';
import 'package:roadman_vegi/Controller/product_controller.dart';
import 'package:roadman_vegi/Models/buyer_model.dart';
import 'package:roadman_vegi/Models/changecolor.dart';
import 'package:roadman_vegi/Models/product_model.dart';
import 'package:roadman_vegi/Models/seller_model.dart';
import 'package:roadman_vegi/Screen/AddProductScreenTwo.dart';
import 'package:roadman_vegi/Screen/buyer_product_detail.dart';
import 'package:roadman_vegi/Screen/first_screen.dart';
import 'package:roadman_vegi/Screen/buyer_profile.dart';

class SellerProducts extends StatefulWidget {
  const SellerProducts({
    Key key,
    this.number,
    this.sellerId,
    this.products,
  }) : super(key: key);
  final String number;
  final String sellerId;
  final ProductModel products;

  @override
  State<SellerProducts> createState() => _SellerProductsState();
}

class _SellerProductsState extends State<SellerProducts> {
  final BuyerModel buyerModel = Get.put(BuyerModel());
  final BuyerAuthController buyerAuthController =
      Get.put(BuyerAuthController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // Future<void> _makePhoneCall(String phoneNumber) async {
  //   final Uri launchUri = Uri(
  //     scheme: 'tel',
  //     path: phoneNumber,
  //   );
  //   await launchUrl(launchUri);
  // }

  @override
  Widget build(BuildContext context) {
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
                              'Product',
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
                          height: 20,
                        ),
                        Center(
                          child: ListTile(
                            onTap: () async {
                              await buyerAuthController.getBuyer();
                              Get.to(BuyerProfile());
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
                              'My Profile',
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
                          height: 20,
                        ),
                        Center(
                          child: ListTile(
                            onTap: () {
                              buyerAuthController.firebaseAuth
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
                          height: 20,
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
            child: Text(
              'Seller Product Datails',
              style: TextStyle(
                  color: Colors.grey[850],
                  fontFamily: 'Poppins-Medium',
                  fontSize: 23),
            ),
          ),
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
          child: GetX<ProductController>(
              init: Get.put<ProductController>(ProductController()),
              builder: (ProductController productController) {
                if (productController != null &&
                    productController.sellerProductList.value != null) {
                  return Container(
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount:
                            productController.sellerProductList.value.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(BuyerProdcutDetail(
                                sellerId: widget.sellerId,
                                products: productController
                                    .sellerProductList.value[index],
                              ));
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Card(
                                  elevation: 5,
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        productController.sellerProductList
                                            .value[index].image,
                                      ),
                                    ),
                                    title: Text(
                                      productController
                                          .sellerProductList.value[index].name,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Row(
                                      children: [
                                        Text(
                                          productController.sellerProductList
                                              .value[index].price
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "${productController.sellerProductList.value[index].weight} Kg"
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
        ),
      ),
    );
  }
}
