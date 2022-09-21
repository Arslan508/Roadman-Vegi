// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, duplicate_ignore, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roadman_vegi/Controller/buyer_auth_contorller.dart';
import 'package:roadman_vegi/Controller/product_controller.dart';
import 'package:roadman_vegi/Models/changecolor.dart';
import 'package:roadman_vegi/Screen/buyer_show_product_drawer.dart';

class BuyerHomeScreen extends StatefulWidget {
  const BuyerHomeScreen({Key key}) : super(key: key);

  @override
  State<BuyerHomeScreen> createState() => _BuyerHomeScreenState();
}

class _BuyerHomeScreenState extends State<BuyerHomeScreen> {
  final BuyerAuthController buyerAuthController =
      Get.put(BuyerAuthController());
  final productController = Get.put(ProductController());
  @override
  void initState() {
    buyerAuthController.getBuyer();
    Get.put(ProductController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Changecolor changecolor = Changecolor();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
          elevation: 2.0,
          backgroundColor: changecolor.primary_dark,
          title: Text(
            "Seller Detail",
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {},
            )
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                GetX<ProductController>(
                  init: Get.put<ProductController>(ProductController()),
                  builder: (ProductController productController) {
                    if (productController != null &&
                        productController.sellerStoreList != null) {
                      // ignore: avoid_unnecessary_containers
                      return Container(
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: productController.sellerStoreList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () async {
                                  await productController
                                      .getSellerproductsCustom(productController
                                          .sellerStoreList[index].id);
                                  Get.to(() => SellerProducts(
                                        sellerId: productController
                                            .sellerStoreList[index].id,
                                        number: productController
                                            .sellerStoreList[index].contactNo,
                                      ));
                                  // Get.to(SellerStore(
                                  //   sellerModel: productController
                                  //       .sellerStoreList[index],
                                  // ));
                                },
                                child: Container(
                                  //width: MediaQuery.of(context).size.width / 10,
                                  // height: MediaQuery.of(context).size.height / 12,
                                  child: Card(
                                    elevation: 5,
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    //shadowColor: Colors.green,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Text(
                                          productController
                                              .sellerStoreList[index]
                                              .storeName
                                              .capitalizeFirst,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: changecolor.primary_dark,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Seller Name",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color:
                                                      changecolor.primary_dark,
                                                ),
                                              ),
                                              Text(
                                                productController
                                                        .sellerStoreList[index]
                                                        .firstName +
                                                    " " +
                                                    productController
                                                        .sellerStoreList[index]
                                                        .lastName,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      changecolor.primary_dark,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Contact No",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color:
                                                      changecolor.primary_dark,
                                                ),
                                              ),
                                              Text(
                                                productController
                                                    .sellerStoreList[index]
                                                    .contactNo,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      changecolor.primary_dark,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Opening Time",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color:
                                                      changecolor.primary_dark,
                                                ),
                                              ),
                                              Text(
                                                productController
                                                    .sellerStoreList[index]
                                                    .openingTime,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      changecolor.primary_dark,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Closing time",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color:
                                                      changecolor.primary_dark,
                                                ),
                                              ),
                                              Text(
                                                productController
                                                    .sellerStoreList[index]
                                                    .closingTime,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      changecolor.primary_dark,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Seller Address",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color:
                                                      changecolor.primary_dark,
                                                ),
                                              ),
                                              Flexible(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    productController
                                                        .sellerStoreList[index]
                                                        .sellerAdress,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: changecolor
                                                          .primary_dark,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    } else {
                      return Text('Loading...');
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
