// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:roadman_vegi/Controller/buyer_auth_contorller.dart';
import 'package:roadman_vegi/Controller/buyer_profile_controller.dart';
import 'package:roadman_vegi/Controller/mystore.dart';

import 'package:get/get.dart';
import 'package:roadman_vegi/Controller/product_controller.dart';
import 'package:roadman_vegi/Controller/seller_auth_controller.dart';
// our data
// const url = "meshivanshsingh.me";
// const email = "me.shivansh007@gmail.com";
// const phone = "90441539202"; // not real number :)
// const location = "Lucknow, India";

class BuyerProfile extends StatelessWidget {
  // final SellerAuthController sellerAuthController =
  //     Get.put(SellerAuthController());
  final productController = Get.put(ProductController());
  // final sellerController = Get.put(SellerController());
  final BuyerProfileController buyerProfileController =
      Get.put(BuyerProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.blueGrey[800],
        body: SafeArea(
      minimum: const EdgeInsets.only(top: 100),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Image.asset(
                'assets/splashlogo.png',
                width: 120,
                height: 120,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // // ignore: prefer_const_constructors

            // SizedBox(
            //   height: 20,
            //   width: 200,
            //   child: Divider(
            //       // color: Colors.white,
            //       ),
            // ),

            // we will be creating a new widget name info carrd
            GetX<BuyerAuthController>(
                init: Get.put<BuyerAuthController>(BuyerAuthController()),
                builder: (BuyerAuthController buyController) {
                  if (buyController != null && buyController.buyer != null) {
                    return Column(
                      children: [
                        // Text(
                        //   proController.buyer..toUpperCase(),
                        //   style: TextStyle(
                        //     fontSize: 40.0,
                        //     color: Colors.black,
                        //     fontWeight: FontWeight.bold,
                        //     fontFamily: "Pacifico",
                        //   ),
                        // ),
                        // InfoCard(
                        //     text: "", icon: Icons.phone, onPressed: () async {}),
                        BuyerCard(
                            text: buyController.buyer.firstName +
                                " " +
                                buyController.buyer.lastName,
                            icon: Icons.person,
                            onPressed: () async {}),
                        BuyerCard(
                            text: buyController.buyer.contactNo,
                            icon: Icons.phone,
                            onPressed: () async {}),
                        BuyerCard(
                            text: buyController.buyer.buyerAdress,
                            icon: Icons.location_on,
                            onPressed: () async {}),
                        // InfoCard(
                        //     text: proController.seller.city,
                        //     icon: Icons.location_city,
                        //     onPressed: () async {}),
                      ],
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),

            // InfoCard(text: email, icon: Icons.email, onPressed: () async {}),
          ],
        ),
      ),
    ));
  }
}

class BuyerCard extends StatelessWidget {
  // the values we need
  final String text;
  final IconData icon;
  Function onPressed;

  BuyerCard(
      {@required this.text, @required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        //color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child:
            //TextField(),
            ListTile(
          leading: Icon(
            icon,
            color: Colors.teal,
          ),
          title: Text(
            text,
            style: TextStyle(
                color: Colors.teal,
                fontSize: 20,
                fontFamily: "Source Sans Pro"),
          ),
        ),
      ),
    );
  }
}
