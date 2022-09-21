// ignore_for_file: unused_import, file_names, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roadman_vegi/Controller/my_coustomer_controller.dart';
import 'package:roadman_vegi/Controller/product_controller.dart';
import 'package:roadman_vegi/Models/changecolor.dart';
import 'package:roadman_vegi/Screen/AddProductScreenTwo.dart';
import 'package:roadman_vegi/Screen/CongrationsScreen.dart';
import 'package:roadman_vegi/Screen/SellerdDawerScreen.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final productController = Get.put(ProductController());
  final MycoustomerController myCustomerController =
      Get.put(MycoustomerController());
  @override
  void initState() {
    Get.put(ProductController());
    productController.getSellerproducts();
    setState(() {});

    super.initState();
  }

  //final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    Changecolor changecolor = Changecolor();
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                //  Get.to(CongrationsScreen());
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
            elevation: 5.0,
            backgroundColor: changecolor.primary_dark,
            title: Text(
              "My Products",
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  Get.to(AddProductScreenTwo());
                },
              )
            ],
          ),
          body: GetX<ProductController>(
              init: Get.put<ProductController>(ProductController()),
              builder: (ProductController proController) {
                if (proController != null &&
                    proController.sellerProductList != null) {
                  return Container(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height,
                      maxWidth: MediaQuery.of(context).size.width,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          changecolor.primary_color,
                          changecolor.primary_dark,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          //  crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              height: 200,
                              width: 200,
                              child: Image.asset(
                                'assets/addproduct.png',
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            proController.sellerProductList.value == null
                                ? Text(
                                    "No Products Added",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
                                    "Product found",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                            SizedBox(
                              height: 10,
                            ),
                            proController.sellerProductList.value == null
                                ? Text(
                                    "You can add product information and quantiy to",
                                    style: TextStyle(
                                      fontSize: 15,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
                                    "Click to go to your store",
                                    style: TextStyle(
                                      fontSize: 15,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "make your product available on your online store",
                              style: TextStyle(
                                fontSize: 15,
                                // fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            proController.sellerProductList == null
                                ? Container(
                                    height: 50,
                                    width: 190,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            side: BorderSide(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        //  Get.to(AddProductScreenTwo());
                                      },
                                      child: Text(
                                        'Add Product',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 50,
                                    width: 190,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            side: BorderSide(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      onPressed: () async {
                                        await myCustomerController
                                            .getcoustomer();
                                        productController.getSellerproducts();
                                        Get.to(SellerDrawerScreen());
                                      },
                                      child: Text(
                                        'Go to home',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              })),
    );
  }
}
