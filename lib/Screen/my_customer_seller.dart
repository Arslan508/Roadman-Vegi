// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roadman_vegi/Controller/add_cart_controller.dart';
import 'package:roadman_vegi/Controller/my_coustomer_controller.dart';
import 'package:roadman_vegi/Controller/product_controller.dart';
import 'package:roadman_vegi/Models/add_cart_model.dart';
import 'package:roadman_vegi/Screen/SellerdDawerScreen.dart';
import 'package:roadman_vegi/Screen/buyer_product.dart';

class MyCoustomerSeller extends StatefulWidget {
  const MyCoustomerSeller({Key key}) : super(key: key);

  @override
  State<MyCoustomerSeller> createState() => _MyCoustomerSellerState();
}

class _MyCoustomerSellerState extends State<MyCoustomerSeller> {
  AddCartController addCartController = Get.put(AddCartController());
  MycoustomerController mycoustomerController =
      Get.put(MycoustomerController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Get.to(SellerDrawerScreen());
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
          ),
          elevation: 5.0,
          title: Center(
            child: Text(
              "Coustomer Detail ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                CupertinoIcons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {
                Get.to(BuyerProductShow());
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: GetX<MycoustomerController>(
              init: Get.put<MycoustomerController>(MycoustomerController()),
              builder: (MycoustomerController coustomercontroller) {
                if (coustomercontroller != null &&
                    coustomercontroller.myCoustomer != null) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height - 20,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: coustomercontroller.myCoustomer.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      mycoustomerController.getcoustomerproduct(
                                          coustomercontroller
                                              .myCoustomer[index].buyerId);
                                      Get.to(BuyerProductShow());
                                    },
                                    child: Card(
                                      elevation: 5,
                                      shape: BeveledRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.black, width: 1),
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: Container(
                                        height: 80,
                                        color: Colors.white,
                                        child: ListTile(
                                          leading: Text(
                                            mycoustomerController
                                                    .myCoustomer[index]
                                                    .firstName +
                                                "" +
                                                mycoustomerController
                                                    .myCoustomer[index]
                                                    .lastName,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          title: Text(
                                            mycoustomerController
                                                .myCoustomer[index].contactNo,
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          subtitle: Text(
                                            mycoustomerController
                                                .myCoustomer[index].buyerAdress,
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
