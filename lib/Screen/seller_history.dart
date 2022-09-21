// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roadman_vegi/Controller/product_controller.dart';
import 'package:roadman_vegi/Controller/sales_controller.dart';
import 'package:roadman_vegi/Controller/seller_controller.dart';
import 'package:roadman_vegi/Models/changecolor.dart';
import 'package:roadman_vegi/Screen/my_sales.dart';

class SellerHistory extends StatefulWidget {
  const SellerHistory({Key key}) : super(key: key);

  @override
  State<SellerHistory> createState() => _SellerHistoryState();
}

class _SellerHistoryState extends State<SellerHistory> {
  final ProductController productController = Get.put(ProductController());
  final SalesController salesController = Get.put(SalesController());

  @override
  Widget build(BuildContext context) {
    Changecolor changecolor = Changecolor();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
          elevation: 2.0,
          backgroundColor: changecolor.primary_dark,
          title: Center(
            child: Text(
              "Seller Profit",
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                Get.to(SellerHistory());
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height - 200,
                  child: GetX<SalesController>(
                      init: Get.put<SalesController>(SalesController()),
                      builder: (SalesController proController) {
                        if (proController != null &&
                            proController.saleProducts != null) {
                          return Container(
                            height: 589,
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemCount: proController.saleProducts.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 100,
                                  child: Column(
                                    children: [
                                      Text(
                                        proController.saleProducts[index].name,
                                        // .toString(),
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: 20,
                                      // ),
                                      Text(
                                        proController.saleProducts[index].weight
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
