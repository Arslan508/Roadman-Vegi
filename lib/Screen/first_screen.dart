// ignore_for_file: unused_import, file_names, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unused_element, unnecessary_new, avoid_web_libraries_in_flutter, unused_local_variable, sized_box_for_whitespace, unnecessary_import, avoid_print

//import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roadman_vegi/Controller/Textcontroller.dart';
import 'package:roadman_vegi/Controller/buyer_profile_controller.dart';
import 'package:roadman_vegi/Controller/product_controller.dart';
import 'package:roadman_vegi/Models/ChangeColor.dart';
import 'package:roadman_vegi/Screen/seller_login.dart';
import 'package:roadman_vegi/Screen/SplashScreen.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:roadman_vegi/Screen/buyer_login.dart';
import 'package:roadman_vegi/Screen/root_seller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextController textController = Get.put(TextController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Changecolor changecolor = Changecolor();

    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.black,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                changecolor.primary_color,
                changecolor.primary_dark,
              ],
              begin: Alignment.center,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 160,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.asset(
                  'assets/splashlogo.png',
                  width: 150,
                  height: 150,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Center(
                    child: InkWell(
                      onTap: () {
                        //textController.isSeller.value = false;
                        Get.put(ProductController());
                        Get.to(RootSeller());
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 1),
                        height: 60,
                        width: 200,
                        decoration: BoxDecoration(
                          color: changecolor.primary_dark,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'assets/seller.png',
                                height: 30,
                              ),
                              Text(
                                'Seller',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      // //Get.put(BuyerLogin());
                      // textController.isSeller.value = false;
                      // print('value is :${textController.isSeller.value}');
                      Get.to(BuyerLogin());
                      // if (Value != null) {
                      //   Get.to(BuyerLogin());
                      // } else {
                      //   CircularProgressIndicator();
                      // }
                    },
                    child: Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                        color: changecolor.primary_dark,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/customer.png',
                              height: 30,
                            ),
                            Text(
                              "Buyer",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
