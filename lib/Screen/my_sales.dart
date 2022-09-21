// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roadman_vegi/Controller/product_controller.dart';
import 'package:roadman_vegi/Controller/sales_controller.dart';
import 'package:roadman_vegi/Controller/seller_auth_controller.dart';
import 'package:roadman_vegi/Models/changecolor.dart';
import 'package:roadman_vegi/Models/product_model.dart';
import 'package:roadman_vegi/Screen/SellerdDawerScreen.dart';
import 'package:intl/intl.dart';
import 'package:roadman_vegi/Screen/seller_history.dart';

class MySales extends StatefulWidget {
  const MySales({Key key}) : super(key: key);

  @override
  State<MySales> createState() => _MySalesState();
}

class _MySalesState extends State<MySales> {
  final salesController = Get.put(SalesController());
  final ProductController productController = Get.put(ProductController());
  void _pickDateDialog() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            //which date will display when user open the picker
            firstDate: DateTime(1950),
            //what will be the previous supported year in picker
            lastDate: DateTime(
                2050)) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        //for rebuilding the ui
        salesController.selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Changecolor changecolor = Changecolor();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.to(SellerDrawerScreen());
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
              "My Sales",
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
                Get.to(SellerDrawerScreen());
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          _pickDateDialog();
                        },
                        child: Text("Select Date")),
                    Text(salesController.selectedDate ==
                            null //ternary expression to check if date is null
                        ? 'No date was chosen!'
                        : DateFormat.yMMMd()
                            .format(salesController.selectedDate)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                // SizedBox(
                //   height: 50,
                //   width: MediaQuery.of(context).size.width - 30,
                //   child: TextField(
                //     decoration: InputDecoration(
                //       hintText: "Customer name",
                //       hintStyle: TextStyle(color: Colors.black),
                //       fillColor: Colors.white,
                //     ),
                //     style: TextStyle(
                //       color: Colors.black,
                //     ),
                //     keyboardType: TextInputType.name,
                //     controller: salesController.customerName,
                //   ),
                // ),
                // SizedBox(
                //   height: 25,
                // ),
                Container(
                  //   height: 6 * SizeConfig.heightMultiplier,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                      // border: Border.all(color: Colors.grey),
                      // color: CustomColor.backGround,
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding: const EdgeInsets.all(0.0),
                    child: DropdownButtonFormField<ProductModel>(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          border: InputBorder.none,
                          //focusedBorder: InputBorder.none,
                          //errorBorder: InputBorder.none,
                          //enabledBorder: InputBorder.none,
                          fillColor: Colors.white),

                      elevation: 5,
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                      validator: (value) {
                        if (value == null) {
                          return 'Select product';
                        } else {
                          return null;
                        }
                      },
                      items: productController.sellerProductList.value
                          .map<DropdownMenuItem<ProductModel>>((value) {
                        return DropdownMenuItem<ProductModel>(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(value.name),
                          ),
                        );
                      }).toList(),
                      isExpanded: true,
                      // elevation: 16,
                      hint: const Text(
                        'Select Prodcuts',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      onChanged: (value) {
                        setState(() {
                          salesController.selectedProductValue.value =
                              value.name;
                          salesController.productPrice.text =
                              value.price.toString();
                          salesController.id.value = value.id;
                          salesController.weight.value = value.weight;
                        });
                        // print('asset id: ${asController.assetId}');
                      },
                      //value: salesController.productValue.value,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 30,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Price",
                      hintStyle: TextStyle(color: Colors.black),
                      fillColor: Colors.white,
                    ),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    keyboardType: TextInputType.number,
                    controller: salesController.productPrice,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 30,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Weight in kg",
                      hintStyle: TextStyle(color: Colors.black),
                      fillColor: Colors.white,
                    ),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    keyboardType: TextInputType.number,
                    controller: salesController.qty,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    salesController.addSales();
                  },
                  child: Text(
                    'Add Sales',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // floatingActionButton: Container(
        //   height: 35,
        //   width: 120,
        //   child: ElevatedButton(
        //     style: ButtonStyle(
        //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //         RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(30.0),
        //           side: BorderSide(
        //             color: Colors.white,
        //           ),
        //         ),
        //       ),
        //     ),
        //     onPressed: () async {
        //       await salesController.getsellerproduct();
        //       Get.to(SellerHistory());
        //     },
        //     child: Text(
        //       'Check History',
        //       style: TextStyle(
        //         fontSize: 14,
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
