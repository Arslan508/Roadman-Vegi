// ignore_for_file: prefer_const_constructors, missing_return, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roadman_vegi/Controller/my_coustomer_controller.dart';
import 'package:roadman_vegi/Screen/my_customer_seller.dart';

class BuyerProductShow extends StatelessWidget {
  MycoustomerController mycoustomerController =
      Get.put(MycoustomerController());
  BuyerProductShow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Get.to(MyCoustomerSeller());
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
              "Buyer product",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          // actions: [
          //   IconButton(
          //     icon: const Icon(
          //       CupertinoIcons.cart,
          //       color: Colors.black,
          //     ),
          //     onPressed: () {
          //       Get.to(BuyerCartScreen());
          //     },
          //   )
          // ],
        ),
        body: SingleChildScrollView(
          child: GetX<MycoustomerController>(
              init: Get.put<MycoustomerController>(MycoustomerController()),
              builder: (MycoustomerController coustomercontroller) {
                if (coustomercontroller != null &&
                    coustomercontroller.myCoustomerproductlist.value != null) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height - 20,
                    child: GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Container(
                              height: 600,
                              child: ListView.builder(
                                  itemCount: mycoustomerController
                                      .myCoustomerproduct.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            mycoustomerController
                                                .getcoustomerproduct(
                                                    coustomercontroller
                                                        .myCoustomer[index]
                                                        .buyerId);
                                            Get.to(BuyerProductShow());
                                          },
                                          child: ListTile(
                                            leading: Image.network(
                                                mycoustomerController
                                                    .myCoustomerproduct[index]
                                                    .productImg),
                                            title: Text(
                                              mycoustomerController
                                                  .myCoustomerproduct[index]
                                                  .productName,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            trailing: Text(
                                              "Rs ${mycoustomerController.myCoustomerproduct[index].productPrice} "
                                                  .toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            subtitle: Text(
                                              "${mycoustomerController.myCoustomerproduct[index].selectedQuantity} kg sold"
                                                  .toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
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
              Get.to(MyCoustomerSeller());
            },
            child: Text(
              'Contect Buyer',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
