// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:roadman_vegi/Controller/mystore.dart';

import 'package:get/get.dart';
import 'package:roadman_vegi/Controller/seller_auth_controller.dart';
// our data
// const url = "meshivanshsingh.me";
// const email = "me.shivansh007@gmail.com";
// const phone = "90441539202"; // not real number :)
// const location = "Lucknow, India";

class MyStore extends StatelessWidget {
  // final SellerAuthController sellerAuthController =
  //     Get.put(SellerAuthController());
  // final productController = Get.put(ProductController());
  // final sellerController = Get.put(SellerController());
  final MyStoreController myStoreController = Get.put(MyStoreController());
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

              GetX<SellerAuthController>(
                  init: Get.put<SellerAuthController>(SellerAuthController()),
                  builder: (SellerAuthController proController) {
                    if (proController != null && proController.seller != null) {
                      return Column(
                        children: [
                          Text(
                            proController.seller.storeName == null
                                ? proController.seller.storeName
                                : proController.seller.storeName.toUpperCase(),
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Pacifico",
                            ),
                          ),
                          // InfoCard(
                          //     text: "", icon: Icons.phone, onPressed: () async {}),
                          InfoCard(
                              text: proController.seller.firstName +
                                  " " +
                                  proController.seller.lastName,
                              icon: Icons.person,
                              onPressed: () async {}),
                          InfoCard(
                              text: proController.seller.contactNo,
                              icon: Icons.phone,
                              onPressed: () async {}),
                          InfoCard(
                              text: proController.seller.sellerAdress,
                              icon: Icons.location_on,
                              onPressed: () async {}),
                          InfoCard(
                              text: proController.seller.city,
                              icon: Icons.location_city,
                              onPressed: () async {}),
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
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  // the values we need
  final String text;
  final IconData icon;
  Function onPressed;

  InfoCard(
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
