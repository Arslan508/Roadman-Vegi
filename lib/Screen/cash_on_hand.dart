// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:roadman_vegi/Screen/buyer_cart_product.dart';
import 'package:roadman_vegi/Screen/buyer_show_product_drawer.dart';

class CashOnHand extends StatefulWidget {
  const CashOnHand({Key key}) : super(key: key);

  @override
  State<CashOnHand> createState() => _CashOnHandState();
}

class _CashOnHandState extends State<CashOnHand> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 15.0,
          //  leadingWidth: 90,
          leading: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          title: Text(
            "",
            style: TextStyle(
              fontSize: 24,
              fontStyle: FontStyle.italic,
            ),
          ),
          actions: [
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.to(BuyerCartScreen());
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Center(
              child: Lottie.network(
                "https://assets2.lottiefiles.com/packages/lf20_vivylat3.json",
                width: 250,
                height: 300,
              ),
            ),
            Text(
              "Pick up delivery at your door and",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Cash in hand",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 40,
                width: 150,
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
                    Get.to(SellerProducts());
                  },
                  child: Text(
                    'choice Product',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
